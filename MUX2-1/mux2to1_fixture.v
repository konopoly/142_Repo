//polyashenko

`include "mux2to1.v"
`timescale 1ns / 1ps
module mux2to1_16bit_tb;

	// Inputs
  reg [15:0] data1;
  reg [15:0] data2;
  reg select;

  // Outputs
  wire [15:0] data_out;

  // Instantiate the Unit Under Test (UUT)
  mux2to1 uut (
  	.data1(data1),
    .data2(data2),
    .select(select),
    .data_out(data_out)
  );

  initial begin
  	// Initialize Inputs
    data1 = 0; data2 = 0; select = 0;
    #10;
    data1 = 4095; data2 = 61455; select = 0;
    #10;
    $display("data1 = %d", data1);
    $display("data2 = %d", data2);
    $display("select bit = %d", select);
    $display("output = %d", data_out);
    select = 1;
		#10
    $display("data1 = %d", data1);
    $display("data2 = %d", data2);
    $display("select bit = %d", select);
    $display("output = %d", data_out);
  end
endmodule
