`timescale 1ns / 1ps
`include "main.v"

module main_tb();
	wire overflow;

	reg reset,clk;

	main main_uut(reset,clk,overflow);
	
	initial clk=0;
	always #10 clk = ~clk;

	initial begin
		$vcdpluson;
		reset = 1;
		#20
		reset = 0;
		#20
		reset = 1;
		#1000
		$finish;
	end
endmodule