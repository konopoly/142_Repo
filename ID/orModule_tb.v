`timescale 1ns / 1ps
`include "add2.v"

module orModule_tb();
	reg in1,in2;
	wire out;

	orModule uut(in1,in2,out);

	initial begin
		$vcdpluson;
		in1 = 0;
		in2 = 1;
		#20
		in1 = 1;
		in2 = 1;
		#20
		in1 = 0;
		in2 = 0;
		#20
		$finish;
	end
endmodule