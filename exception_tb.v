`timescale 1ns / 1ps
`include "exception.v"

module exception_tb;
	reg [3:0] opcode;
	reg overflow;
	wire halt;

	exeception uut(opcode,overflow,halt);

	initial begin
	opcode = 4'hB;
	overflow = 0;
	#20
	opcode = 4'h1;
	overflow = 0;
	#20
	opcode = 4'h1;
	overflow = 1;
	#20
	$finish;
	end
endmodule