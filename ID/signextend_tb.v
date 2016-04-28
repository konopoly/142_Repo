`timescale 1ns / 1ps
`include "signextend.v"

module reg_tb();
	reg[3:0] opcode,one,two,three;
	wire[15:0] extendOutput;
	
	signextend uut(opcode,one,two,three,extendOutput);

	initial begin
		$vcdpluson;
		opcode = 4'b1000;
		one = 1;
		two = 2;
		three = 3;
		#20
		opcode = 4'b0101;
		one = 1;
		two = 2;
		three = 3;
		#20
		opcode = 4'b1100;
		one = 1;
		two = 2;
		three = 3;
		#20
		$finish;
	end
endmodule