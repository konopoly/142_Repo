`timescale 1ns / 1ps
`include "main.v"

module main_tb();
	reg reset,clk;

	main main_uut(reset,clk);
	
	initial clk=0;
	always #10 clk = ~clk;

	initial begin
		$vcdpluson;
		reset = 0;
		#20
		reset = 1;
		#610
		$finish;
	end
endmodule