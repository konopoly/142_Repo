`timescale 1ns / 1ps
`include "IF.v"

module IF_tb();
	wire[3:0] opcode_ID,one_ID,two_ID,three_ID;
	wire[15:0] PC_ID;
	
	reg[15:0] PCMux_2_IF,PCMux_1_IF;
	reg[1:0] PCSource;
	reg reset,clk,Halt,Hazard;

	IF uut(opcode_ID,one_ID,two_ID,three_ID,PC_ID,PCMux_2_IF,PCMux_1_IF,Hazard,PCSource,reset,clk,Halt);
	
	initial clk=0;
	always #10 clk = ~clk;

	initial begin
		$vcdpluson;
		PCMux_1_IF = 0;
		PCMux_2_IF = 0;
		PCSource = 0;
		reset = 0;
		Halt = 0;
		Hazard = 0;
		#20
		PCMux_1_IF = 0;
		PCMux_2_IF = 0;
		PCSource = 0;
		reset = 1;
		Halt = 0;
		Hazard = 0;
		#100
		reset = 0;
		#20
		reset = 1;
		#80
		Halt = 1;
		#40
		reset = 0;
		Halt = 0;
		#20
		reset = 1;
		#80
		Hazard = 1;
		#20
		Hazard = 0;
		#100

		
		$finish;
	end
endmodule