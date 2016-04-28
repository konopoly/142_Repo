`timescale 1ns / 1ps
`include "registers.v"

module reg_tb();
	reg[15:0] WD1,R0D;
	reg[3:0] RA1,RA2,WA1;
	reg R0W,RegWrite,clk,rst;
	wire[15:0] RD1,RD2,R0R;
	
	registers uut(RA1,RA2,WA1,WD1,R0D,RD1,RD2,R0R,RegWrite,R0W,clk,rst);
 
	initial clk=0;
	always #10 clk = ~clk;

	initial begin
		$vcdpluson;
		rst = 1;
		WD1 = 0;
		R0D = 0;
		RA1 = 0;
		RA2 = 0;
		WA1 = 0;
		R0W = 0;
		RegWrite = 0;
		#20
		rst = 0;
		WD1 = 0;
		R0D = 0;
		RA1 = 0;
		RA2 = 0;
		WA1 = 0;
		R0W = 0;
		RegWrite = 0;
		#20 //Write 4's into Reg 4.
		rst = 1;
		WD1 = 16'h4444;
		R0D = 0;
		RA1 = 1;
		RA2 = 2;
		WA1 = 4;
		R0W = 0;
		RegWrite = 1;
		#20 //Write 5's into Reg 5.
		rst = 1;
		WD1 = 16'h5555;
		R0D = 0;
		RA1 = 0;
		RA2 = 0;
		WA1 = 5;
		R0W = 0;
		RegWrite = 1;
		#20 //Read Regs 4 and 5
		rst = 1;
		WD1 = 0;
		R0D = 0;
		RA1 = 4;
		RA2 = 5;
		WA1 = 0;
		R0W = 0;
		RegWrite = 0;
		#20 //Write into R0.
		rst = 1;
		WD1 = 0;
		R0D = 16'h0001;
		RA1 = 0;
		RA2 = 0;
		WA1 = 0;
		R0W = 1;
		RegWrite = 0;
		#20 //Read reg 15
		rst = 1;
		WD1 = 0;
		R0D = 0;
		RA1 = 15;
		RA2 = 0;
		WA1 = 0;
		R0W = 0;
		RegWrite = 0;
		#40
		$finish;
	end
endmodule