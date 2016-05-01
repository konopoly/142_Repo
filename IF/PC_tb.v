`timescale 1ns / 1ps
`include "PC.v"

module PC_tb();
	reg halt,clk,reset;
	reg [15:0] address_in;
	wire [15:0] address_out;

    PC uut(address_in,address_out,halt,clk,reset);

    initial clk=0;
	always #10 clk = ~clk;

    initial begin
		$vcdpluson;
        // Initialize Inputs
		halt = 0;
		reset = 1;
		address_in = 0;
		#20
		halt = 0;
		reset = 1;
		address_in = 2;
		#20
		halt = 0;
		reset = 1;
		address_in = 4;
		#20
		halt = 0;
		reset = 0;
		address_in = 6;
		#20
		halt = 0;
		reset = 1;
		address_in = 0;
		#20
		halt = 0;
		reset = 0;
		address_in = 2;
		#20
		halt = 1;
		reset = 1;
		address_in = 2;
		#40	
		$finish;
    end
endmodule