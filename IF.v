`timescale 1ns / 1ps
`include "IF/im.v"
`include "IF/PC.v"
`include "IF/add2.v"
`include "IF/sub2.v"
`include "IFIDBuffer.v"

`include "MUX/m3to1_16.v"
`include "MUX/m2to1_16.v"


module IF(opcode_ID,one_ID,two_ID,three_ID,PC_ID,PCMux_2_IF,PCMux_1_IF,Hazard,PCSource,reset,clk,Halt);
	output[3:0] opcode_ID,one_ID,two_ID,three_ID;
	output[15:0] PC_ID; 
	wire[15:0] PC_output_IF,PC_plus_IF,PC_minus_IF,PCMux_0_IF,PCMux_output_IF;
	wire[3:0] opcode_IF,one_IF,two_IF,three_IF;
	
	input[15:0] PCMux_2_IF,PCMux_1_IF;
	input[1:0] PCSource;
	input reset,clk,Halt,Hazard;
	
	m3to1_16 PCMux(PCMux_0_IF,PCMux_1_IF,PCMux_2_IF,PCSource,PCMux_output_IF);
	PC PC_uut(PCMux_output_IF,PC_output_IF,Halt,clk,reset);
	add2 add2_uut(PC_output_IF,PC_plus_IF);
	sub2 sub2_uut(PC_output_IF,PC_minus_IF);
	m2to1_16 addOrSub(PC_plus_IF,PC_minus_IF,Hazard,PCMux_0_IF);
	im im_uut(PC_output_IF,opcode_IF,one_IF,two_IF,three_IF,reset,clk);
	
	IFIDBuffer IFID_uut(clk,Hazard,reset,PC_output_IF,opcode_IF,one_IF,two_IF,three_IF,opcode_ID,one_ID,two_ID,three_ID,PC_ID);
	
endmodule