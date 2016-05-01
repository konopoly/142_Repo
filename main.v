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

`include "MUX/m3to1_16.v"
`include "MUX/m2to1_16.v"


module main(reset,clk,Hazard,RD2_EX,RD1_EX,SE_offset_EX,opcode_EX,RA1_EX,RA2_EX,FN_offset_EX,regWrite_EX,r0Write_EX,alusource_EX,memRead_EX,memWrite_EX,memSource_EX);
	//INPUTS
	input reset,clk,Hazard;
	
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
	
	//DEBUG OUTPUTS
	output[15:0] RD2_EX,RD1_EX,SE_offset_EX;
	output[3:0] opcode_EX,RA1_EX,RA2_EX,FN_offset_EX;
	output regWrite_EX,r0Write_EX,alusource_EX,memRead_EX,memWrite_EX,memSource_EX;

	
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
	
	IDEXBuffer IDEX_uut(clk,Hazard,reset,opcode_ID,RA1_ID,RA2_ID,FN_Offset_ID,RD1_ID,RD2_ID,SE_offset_ID,regWrite_ID,r0Write_ID,alusource_ID,memRead_ID,memWrite_ID,memSource_ID,opcode_EX,RA1_EX,RA2_EX,FN_offset_EX,RD1_EX,RD2_EX,SE_offset_EX,regWrite_EX,r0Write_EX,alusource_EX,memRead_EX,memWrite_EX,memSource_EX);
	
endmodule