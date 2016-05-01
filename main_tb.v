`timescale 1ns / 1ps
`include "main.v"

module main_tb();
	wire[15:0] RD1_EX,RD2_EX,SE_offset_EX;
	wire[3:0] opcode_EX,RA1_EX,RA2_EX,FN_offset_EX;
	wire regWrite_EX,r0Write_EX,alusource_EX,memRead_EX,memWrite_EX,memSource_EX;
	
	reg reset,clk,Hazard;

	main main_uut(reset,clk,Hazard,RD2_EX,RD1_EX,SE_offset_EX,opcode_EX,RA1_EX,RA2_EX,FN_offset_EX,regWrite_EX,r0Write_EX,alusource_EX,memRead_EX,memWrite_EX,memSource_EX);
	
	initial clk=0;
	always #10 clk = ~clk;

	initial begin
		$vcdpluson;
		reset = 1;
		#20
		reset = 0;
		Hazard = 0;
		#20
		reset = 1;
		#200
		$finish;
	end
endmodule