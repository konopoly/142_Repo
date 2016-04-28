`timescale 1ns / 1ps
`include "mem.v"

module mem_tb();
	reg[15:0] din,addr;
	reg memRead,memWrite,rst,clk;
	wire[15:0] dataOut;
	
	mem uut(memRead,memWrite,addr,din,dataOut,rst,clk);
	
	initial clk=0;
	always #10 clk = ~clk;

	initial begin
		$vcdpluson;
		rst = 0;
		#55 rst = 1;
		#20
		memWrite = 1;
		memRead = 0;
		din = 16'h0FFF;
		addr = 16'h0AAA;
		#20
		memWrite = 0;
		memRead = 0;
		din = 0;
		addr = 0;
		#20
		memWrite = 0;
		memRead = 1;
		din = 0;
		addr = 16'h0AAA;
		#20
		memWrite = 0;
		memRead = 0;
		din = 16'h0CCC;
		addr = 16'h0DDD;
		#50
		rst = 0;
		#20
		rst = 1;
		#20
		memWrite = 0;
		memRead = 1;
		din = 0;
		addr = 16'h0AAA;
		#20
		$finish;
	end
endmodule