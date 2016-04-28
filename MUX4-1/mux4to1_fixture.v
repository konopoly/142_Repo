//polyashenko

`include "mux4to1.v"
`timescale 1ns / 1ps
module mux4to1_fixture;

	// Inputs
  reg [15:0] data1;
  reg [15:0] data2;
  reg [15:0] data3;
  reg [15:0] data4;
	reg [1:0] select;

  // Outputs
  wire [15:0] data_out;

  // Instantiate the Unit Under Test (UUT)
  mux4to1 uut (
    .data1(data1),
    .data2(data2),
    .data3(data3),
    .data4(data4),
    .select(select),
    .data_out(data_out)
  );

	initial begin
    // Initialize Inputs
    data1 = 0; data2 = 0; data3 = 0; data4 = 0; select = 0;
    #10;
    data1 = 4095; data2 = 61455; data3 = 12345; data4 = 85733; select = 0;
    #10;
    $display("\ndata1 = %d", data1);
    $display("data2 = %d", data2);
    $display("data3 = %d", data3);
    $display("data4 = %d", data4);
    $display("select bit = %d", select);
    $display("output = %d", data_out);
    select = 1;
    #10
    $display("\ndata1 = %d", data1);
    $display("data2 = %d", data2);
    $display("data3 = %d", data3);
    $display("data4 = %d", data4);
    $display("select bit = %d", select);
    $display("output = %d", data_out);
    select = 2;
    #10
    $display("\ndata1 = %d", data1);
    $display("data2 = %d", data2);
    $display("data3 = %d", data3);
    $display("data4 = %d", data4);
    $display("select bit = %d", select);
    $display("output = %d", data_out);
    select = 3;
    #10
    $display("\ndata1 = %d", data1);
    $display("data2 = %d", data2);
    $display("data3 = %d", data3);
    $display("data4 = %d", data4);
    $display("select bit = %d", select);
    $display("output = %d", data_out);
  end
endmodule
