`timescale 1ns / 1ps
`include "im.v"

module im_tb();
	reg[15:0] pc;
	reg rst,clk;
	wire[3:0] one,two,three,four;
	
	im uut(pc,one,two,three,four,rst,clk);
	
	initial clk=0;
	always #10 clk = ~clk;

	initial begin
		$vcdpluson;
		rst = 0;
		#20;
		rst = 1;
		#20
		pc = 0;
		#20
		pc = 2;
		#20
		pc = 4;
		#20
		pc = 6;
		#20
		pc = 8;
		#20
		$finish;
	end
endmodule