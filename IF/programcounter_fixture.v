`include "programcounter.v"
module programcounter_fixture;

	// Inputs
  reg PCWrite;
  reg clk;
  reg reset;
  reg [15:0] address_in;

  // Outputs
  wire [15:0] address_out;

  // Instantiate the Unit Under Test (UUT)
  programcounter uut (
    .PCWrite(PCWrite),
    .clk(clk),
    .reset(reset),
    .address_in(address_in),
    .address_out(address_out)
    );

  	initial begin
    	// Initialize Inputs
      reset=1; PCWrite = 1; clk = 0; address_in = 16'h0000;
      #10
      reset=0; PCWrite = 1; clk = 0; address_in = 16'h0000;
      $display("PCWrite                 = %d", PCWrite);
      $display("input address         = %d", address_in);
      $display("output_address        = %d", address_out);
      #10
      clk = 1; address_in = 16'h0000;
      $display("PCWrite                 = %d", PCWrite);
      $display("input address         = %d", address_in);
      $display("output_address        = %d", address_out);
      #10
      clk = 0; address_in = 16'h0011;
      $display("PCWrite                 = %d", PCWrite);
      $display("input address         = %d", address_in);
      $display("output_address        = %d", address_out);
      #10
      PCWrite = 1; clk = 1; address_in = 16'h01C1;
      $display("PCWrite                 = %d", PCWrite);
      $display("input address         = %d", address_in);
      $display("output_address        = %d", address_out);
      #10
      PCWrite = 0; address_in = 16'h0FF1; clk = 0;
      $display("PCWrite                 = %d", PCWrite);
      $display("input address         = %d", address_in);
      $display("output_address        = %d", address_out);
      #10
      clk = 1;
      #10 $finish;
    end
endmodule
