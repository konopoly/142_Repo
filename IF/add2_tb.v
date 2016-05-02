`timescale 1ns / 1ps
`include "add2.v"

module add2_tb();
	reg [15:0] op1;
	wire[15:0] result;

	add2 uut(op1,result);

	initial begin
		$vcdpluson;
		op1 = 10;
		#20
		$finish;
	end
endmodule