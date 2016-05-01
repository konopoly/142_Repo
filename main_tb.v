`timescale 1ns / 1ps
`include "main.v"

module main_tb();
	wire overflow;

	reg reset,clk,Hazard;

	main main_uut(reset,clk,Hazard,overflow);
	
	initial clk=0;
	always #10 clk = ~clk;

	initial begin
		$vcdpluson;
		reset = 1;
		#20
		reset = 0;
		Hazard = 0;
		#20
		reset = 1;
		#250
		$finish;
	end
endmodule