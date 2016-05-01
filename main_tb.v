`timescale 1ns / 1ps
`include "main.v"

module main_tb();
	wire[15:0] ALUResult_MEM,R0D_MEM,DataIn_MEM;
	wire[3:0] RA1_MEM,opcode_MEM,FN_Offset_MEM;
	wire regWrite_MEM,r0Write_MEM,memRead_MEM,memWrite_MEM,memSource_MEM;
	wire overflow;

	reg reset,clk,Hazard;

	main main_uut(reset,clk,Hazard,overflow,ALUResult_MEM,R0D_MEM,DataIn_MEM,RA1_MEM,opcode_MEM,FN_Offset_MEM,regWrite_MEM,r0Write_MEM,memRead_MEM,memWrite_MEM,memSource_MEM);
	
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