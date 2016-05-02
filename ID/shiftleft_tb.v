//polyashenko

`include "shiftleft.v"
`timescale 1ns / 1ps
module shiftleft_tb;

	// Inputs
  reg [15:0] mux3output;

  // Outputs
  wire [15:0] shift_out;

  // Instantiate the Unit Under Test (UUT)
  shiftleft uut (
    .mux3output(mux3output),
    .shift_out(shift_out)
  );

  initial begin
    // Initialize Inputs
    mux3output = 0;
    #10
    mux3output = 10;
    $display("input             = %d", mux3output);
    $display("shiftedoutput = %d", shift_out);
    #10
    mux3output = 12;
    $display("\ninput             = %d", mux3output);
    $display("shiftedoutput = %d", shift_out);
  end
endmodule
