`timescale 1ns / 1ps
`include "EXMEMBuffer.v"

module EXMEMBuffer_tb;
	reg clk,reset,regWrite,r0Write,memRead,memWrite,memSource;
	reg[3:0] RA1;
	reg[15:0] ALUResult,DataIn,R0D;

	wire regWrite_o,r0Write_o,memRead_o,memWrite_o,memSource_o;
	wire[3:0] RA1_o;
	wire[15:0] ALUResult_o,DataIn_o,R0D_o;

	EXMEMBuffer uut(clk,reset,regWrite,r0Write,memRead,memWrite,memSource,RA1,ALUResult,DataIn,R0D,regWrite_o,r0Write_o,memRead_o,memWrite_o,memSource_o,RA1_o,ALUResult_o,DataIn_o,R0D_o);

	initial clk=0;
	always #10 clk = ~clk;

	initial begin
	reset = 1;
	regWrite = 2;
	r0Write = 3;
	memRead = 4;
	memWrite = 5;
	memSource = 6;
	RA1 = 7;
	ALUResult = 8;
	DataIn = 9;
	R0D = 10;
	#20
	reset = 0;
	#20
	$finish;
	end
endmodule
