`include "16bitadder.v"
`timescale 1ns / 1ps
module adder16bit_tb;
	// Inputs
  reg [15:0] op1;
  reg [15:0] op2;
  // Outputs
  wire [15:0] result;
  // Instantiate the Unit Under Test (UUT)
  adder16bit uut (
  	.op1(op1),
    .op2(op2),
    .result(result)
  );

	initial begin
  	// Initialize Inputs
    op1 = 0;
    op2 = 0;
    #10;
		$display("op1 = %d", op1);
		$display("op2 = %d", op2);
		$display("result = %d", result);
		op1 = 10;
		op2 = 20;
		$display("op1 = %d", op1);
		$display("op2 = %d", op2);
		$display("result = %d", result);
  end
endmodule
