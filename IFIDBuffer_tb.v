`timescale 1ns / 1ps
`include "IFIDBuffer.v"

module IFIDBuffer_tb();
	reg clk, hazard, reset;
	reg[3:0] opcode, one, two, three;
	reg[15:0] PC;
	wire[3:0] opcode_o, one_o, two_o, three_o;
	wire[15:0] PC_o;

    IFIDBuffer uut(clk,hazard,reset,PC,opcode,one,two,three,opcode_o,one_o,two_o,three_o,PC_o);

    initial clk=0;
	always #10 clk = ~clk;

    initial begin
		$vcdpluson;
        // Initialize Inputs
		reset = 1;
		hazard = 0;
		opcode = 2;
		one = 3;
		two = 4;
		three = 5;
		PC = 15;
		#20
		reset = 1;
		hazard = 0;
		opcode = 10;
		one = 11;
		two = 12;
		three = 13;
		PC = 17;
		#20
		reset = 0;
		hazard = 0;
		opcode = 10;
		one = 11;
		two = 12;
		three = 13;
		PC = 17;
		#20
		$finish;
    end
endmodule
