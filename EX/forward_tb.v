`timescale 1ns / 1ps
`include "forward.v"

module forward_tb();
	reg[3:0] RA1_EX,RA2_EX,RA1_MEM,RA1_WB;
	reg R0W,RegWrite_MEM,RegWrite_WB;
	wire[1:0] FWD1,FWD2;
	
	forward uut(RA1_EX,RA2_EX,RA1_MEM,RA1_WB,R0W,RegWrite_MEM,RegWrite_WB,FWD1,FWD2);
 
	initial begin
		$vcdpluson; 
		RA1_EX = 5; //FWD RA1 from MEM
		RA2_EX = 0;
		RA1_MEM = 5;
		RA1_WB = 0;
		R0W = 0;
		RegWrite_MEM = 1;
		RegWrite_WB = 0;
		#20
		RA1_EX = 2; //FWD RA1 from WB
		RA2_EX = 0;
		RA1_MEM = 0;
		RA1_WB = 2;
		R0W = 0;
		RegWrite_MEM = 0;
		RegWrite_WB = 1;
		#20
		RA1_EX = 0; //FWD R0 to RA1 from WB
		RA2_EX = 2;
		RA1_MEM = 0;
		RA1_WB = 0;
		R0W = 1;
		RegWrite_MEM = 0;
		RegWrite_WB = 0;
		#20
		RA1_EX = 0; //Forward RA2 from MEM
		RA2_EX = 8;
		RA1_MEM = 8;
		RA1_WB = 0;
		R0W = 0;
		RegWrite_MEM = 1;
		RegWrite_WB = 0;
		#20
		RA1_EX = 0; //Forward RA2 from WB
		RA2_EX = 8;
		RA1_MEM = 0;
		RA1_WB = 8;
		R0W = 0;
		RegWrite_MEM = 0;
		RegWrite_WB = 1;
		#20	
		RA1_EX = 2; //Forward R0 to RA2 from WB
		RA2_EX = 0;
		RA1_MEM = 0;
		RA1_WB = 0;
		R0W = 1;
		RegWrite_MEM = 0;
		RegWrite_WB = 0;
		#20
		RA1_EX = 6; //Forward to both
		RA2_EX = 7;
		RA1_MEM = 6;
		RA1_WB = 7;
		R0W = 1;
		RegWrite_MEM = 1;
		RegWrite_WB = 1;
		#20
		$finish;
	end
endmodule