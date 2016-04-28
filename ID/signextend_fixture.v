//polyashenko

`include "signextend8bit.v"
`timescale 1ns / 1ps
module signExtend7to0_tb;

	// Inputs
  reg [15:0] C_type_offset;

  // Outputs
  wire [15:0] C_type_extended;

  // Instantiate the Unit Under Test (UUT)
  signextend8bit uut (
  	.C_type_offset(C_type_offset),
    .C_type_extended(C_type_extended)
  );

  initial begin
  	// Initialize Inputs
  	C_type_offset = 0;
    #10
    C_type_offset = 255;
    #10
    $display("\ninput", C_type_offset);
    $display("sign_extended_output ", C_type_extended);
    C_type_offset = 50;
    #10
    $display("\ninput", C_type_offset);
    $display("sign_extended_output ", C_type_extended);
  end
endmodule
