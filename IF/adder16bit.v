`timescale 1ns / 1ps
module adder16bit(
	input [15:0] op1, op2,
	output [15:0] result
  );

	assign result = op1 + op2;

endmodule
