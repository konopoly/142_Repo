`timescale 1ns / 1ps
`include "MEMWBBuffer.v"

module MEMWBBuffer_tb;
	reg clk,reset,regWrite,r0Write,memSource;
	reg[3:0] RA1;
	reg[15:0] ALUResult,DataIn,R0D;

	wire regWrite_o,r0Write_o,memSource_o;
	wire[3:0] RA1_o;
	wire[15:0] ALUResult_o,DataIn_o,R0D_o;

	MEMWBBuffer uut(clk,reset,regWrite,r0Write,memSource,RA1,ALUResult,DataIn,R0D,regWrite_o,r0Write_o,memSource_o,RA1_o,ALUResult_o,DataIn_o,R0D_o);

	initial clk=0;
	always #10 clk = ~clk;

	initial begin
	reset = 0;
	regWrite = 1;
	r0Write = 1;
	memSource = 1;
	RA1 = 1;
	ALUResult = 1;
	DataIn = 1;
	R0D = 1;
	#20
	reset = 0;
	#20
	$finish;
	end
endmodule