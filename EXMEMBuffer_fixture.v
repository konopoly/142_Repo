`include "EXMEMBuffer.v"

`timescale 1ns / 1ps
module ex_mem_tb;
	reg 		clk;
	reg 		reset;
  reg     hazard;
	reg [3:0] 	rd1;
	reg [15:0] 	regout, alu, R0;

	wire [15:0] result, R0out, aluOut;
  wire [3:0] rd1Out;

	// Initialize mod
  EXMEMBuffer testing (clk,hazard,reset,rd1,regout,alu,R0,result,R0out,rd1Out,aluOut);

	initial
	begin
		clk = 0; forever #10 clk = ~clk;
	end

	task changes();
	begin
		//all data to be displayed, using binary to hex
		$display("\nCLCK:%b reset:%b hazard:%b", clk, reset, hazard);
		$display("data1: %hh", rd1);
		$display("register %hh", regout);
		$display("alu: %hh", alu);

		$display("remainder: %b", R0);
		$display("result: %b", result);

		$display("remainder out: %b", R0out);
		$display("alu output: %b", aluOut);
		$display("data1 out: %b", rd1Out);
	end
	endtask

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		rd1 = 0;
		regout = 0;
		alu = 0;
		R0 = 0;
//used a larger time in between, had issued with a smaller one
		#40;
        changes();

		//reset starts

		reset = 1;
		rd1 = 4'b0011;
		regout = 16'b0000000000000010;
		alu = 16'b0000000000000011;
		R0 = 16'b0000000000000110;
		#40
		changes();
		$finish;
	end
endmodule
