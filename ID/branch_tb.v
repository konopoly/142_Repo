`timescale 1ns / 1ps
`include "branch.v"

module branch_tb();
	reg clk;
	reg[3:0] opCode;
	reg[15:0] RD1,R0R,pc,offset;
	wire[15:0] branch;
	wire hazard;
	
	branch uut(opCode,RD1,R0R,pc,offset,branch,hazard,clk);
 
	initial clk=0;
	always #10 clk = ~clk;

	initial begin
		$vcdpluson;
		pc = 0; //NO
		offset = 4;
		opCode = 4'b0100;
		RD1 = 2;
		R0R = 1;
		#20 //YES
		pc = 0;
		offset = 4;
		opCode = 4'b0100;
		RD1 = 1;
		R0R = 2;
		#20 //NO
		pc = 0;
		offset = 4;
		opCode = 4'b0101;
		RD1 = 1;
		R0R = 2;
		#20 //YES
		pc = 0;
		offset = 4;
		opCode = 4'b0101;
		RD1 = 2;
		R0R = 1;
		#20 //NO
		pc = 0;
		offset = 4;
		opCode = 4'b0110;
		RD1 = 1;
		R0R = 2;
		#20 //YES
		pc = 0;
		offset = 4;
		opCode = 4'b0110;
		RD1 = 1;
		R0R = 1;
		$finish;
	end
endmodule