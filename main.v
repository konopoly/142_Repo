`timescale 1ns / 1ps
`include "IF/im.v"
`include "IF/PC.v"
`include "IF/add2.v"
`include "IF/sub2.v"
`include "IFIDBuffer.v"

`include "control.v"

`include "ID/branch.v"
//`include "ID/hazard.v"
`include "ID/registers.v"
`include "ID/shiftleft.v"
`include "ID/signextend.v"
`include "ID/adder16bit.v"
`include "IDEXBuffer.v"

`include "EX/alucontrol.v"
`include "EX/alu.v"

`include "EXMEMBuffer.v"

`include "MUX/m2to1_16.v"
`include "MUX/m3to1_16.v"
`include "MUX/m4to1_16.v"

module main(reset,clk,Hazard,overflow,ALUResult_MEM,R0D_MEM,DataIn_MEM,RA1_MEM,opcode_MEM,FN_Offset_MEM,regWrite_MEM,r0Write_MEM,memRead_MEM,memWrite_MEM,memSource_MEM);
	//INPUTS
	input reset,clk,Hazard;
	output overflow;
	//IF WIRES
	wire[15:0] PC_output_IF,PC_plus_IF,PC_minus_IF,PCMux_0_IF,PCMux_2_IF,PCMux_1_IF,PCMux_output_IF;
	wire[3:0] opcode_IF,one_IF,two_IF,three_IF;
	
	//ID WIRES
	wire[15:0] SE_offset_ID,SES_offset_ID,RD1_ID,RD2_ID,R0R_ID,PC_ID,WD1,R0D;
	wire[3:0] opcode_ID,RA1_ID,RA2_ID,FN_Offset_ID,WA1;
	wire R0W_WB,RegWrite_WB;
	
	//CONTROL WIRES
	wire regWrite_ID,r0Write_ID,Halt,alusource_ID,alusource2_ID,memRead_ID,memWrite_ID,memSource_ID;
	wire[1:0] PCSource;
	
	//EX WIRES
	wire[15:0] RD2_EX,RD1_EX,SE_offset_EX;
	wire[3:0] opcode_EX,RA1_EX,RA2_EX,FN_Offset_EX;
	wire regWrite_EX,r0Write_EX,alusource_EX,alusource2_EX,memRead_EX,memWrite_EX,memSource_EX;

	wire[15:0] FWD1Mux_output_EX,FWD2Mux_output_EX,RD1Mux_EX,RD2Mux_EX,ALUResult_EX,R0D_EX;
	wire[3:0] ALUop_EX;
	
	//MEM WIRES
	output[15:0] ALUResult_MEM,R0D_MEM,DataIn_MEM;
	output[3:0] RA1_MEM,opcode_MEM,FN_Offset_MEM;
	output regWrite_MEM,r0Write_MEM,memRead_MEM,memWrite_MEM,memSource_MEM;
	
	m3to1_16 PCMux(PCMux_0_IF,PCMux_1_IF,PCMux_2_IF,PCSource,PCMux_output_IF);
	PC PC_uut(PCMux_output_IF,PC_output_IF,Halt,clk,reset);
	add2 add2_uut(PC_output_IF,PC_plus_IF);
	sub2 sub2_uut(PC_output_IF,PC_minus_IF);
	m2to1_16 addOrSub(PC_plus_IF,PC_minus_IF,Hazard,PCMux_0_IF);
	im im_uut(PC_output_IF,opcode_IF,one_IF,two_IF,three_IF,reset,clk);
	
	IFIDBuffer IFID_uut(clk,Hazard,reset,PC_output_IF,opcode_IF,one_IF,two_IF,three_IF,opcode_ID,RA1_ID,RA2_ID,FN_Offset_ID,PC_ID);
	
	control control_uut(opcode_ID,FN_Offset_ID,regWrite_ID,r0Write_ID,PCSource,Halt,alusource_ID,alusource2_ID,memRead_ID,memWrite_ID,memSource_ID);
	
	registers registers_uut(RA1_ID,RA2_ID,WA1,WD1,R0D,RD1_ID,RD2_ID,R0R_ID,RegWrite_WB,R0W_WB,clk,reset);
	signextend SE_uut(opcode_ID,RA1_ID,RA2_ID,FN_Offset_ID,SE_offset_ID);
	shiftleft SL_uut(SE_offset_ID,SES_offset_ID);
	branch branch_uut(opcode_ID,RD1_ID,R0R_ID,PC_ID,SES_offset_ID,PCMux_2_IF);
	adder16bit add_uut(PC_ID,SES_offset_ID,PCMux_1_IF);
	
	IDEXBuffer IDEX_uut(clk,Hazard,reset,opcode_ID,RA1_ID,RA2_ID,FN_Offset_ID,RD1_ID,RD2_ID,SE_offset_ID,regWrite_ID,r0Write_ID,alusource_ID,alusource2_ID,memRead_ID,memWrite_ID,memSource_ID,opcode_EX,RA1_EX,RA2_EX,FN_Offset_EX,RD1_EX,RD2_EX,SE_offset_EX,regWrite_EX,r0Write_EX,alusource_EX,alusource2_EX,memRead_EX,memWrite_EX,memSource_EX);
	
	m4to1_16 FWD1_Mux(RD1_EX,16'b0,16'b0,16'b0,2'b0,FWD1Mux_output_EX);
	m4to1_16 FWD2_Mux(RD2_EX,16'b0,16'b0,16'b0,2'b0,FWD2Mux_output_EX);
	m2to1_16 RD1_Mux(FWD1Mux_output_EX,FWD2Mux_output_EX,alusource_EX,RD1Mux_EX);	
	m2to1_16 RD2_Mux(FWD2Mux_output_EX,SE_offset_EX,alusource2_EX,RD2Mux_EX);
	alucontrol alu_c(opcode_EX,FN_Offset_EX,ALUop_EX);
	alu alu_uut(ALUop_EX,RD1Mux_EX,RD2Mux_EX,ALUResult_EX,R0D_EX,overflow);
	
	EXMEMBuffer EXMEMBuffer_uut(clk,reset,regWrite_EX,r0Write_EX,memRead_EX,memWrite_EX,memSource_EX,RA1_EX,FN_Offset_EX,opcode_EX,ALUResult_EX,FWD1Mux_output_EX,R0D_EX,regWrite_MEM,r0Write_MEM,memRead_MEM,memWrite_MEM,memSource_MEM,RA1_MEM,FN_Offset_MEM,opcode_MEM,ALUResult_MEM,DataIn_MEM,R0D_MEM);
	
endmodule