`timescale 1ns / 1ps
`include "hazard.v"

module hazard_tb();
	reg[3:0] RA1_ID,RA2_ID,RA1_EX;
	reg memRead_EX;
	wire hazard;
	
	hazard uut(RA1_ID,RA2_ID,RA1_EX,memRead_EX,hazard);
 
	initial begin
		$vcdpluson;
		RA1_ID = 0; //2 no load
		RA2_ID = 1;
		RA1_EX = 1;
		memRead_EX = 0;
		#20
		RA1_ID = 1; //1 no load
		RA2_ID = 2;
		RA1_EX = 1;
		memRead_EX = 0;
		#20
		RA1_ID = 0; //Load no dependance
		RA2_ID = 1;
		RA1_EX = 2;
		memRead_EX = 1;
		#20
		RA1_ID = 1; //Load with dependance on 1
		RA2_ID = 2;
		RA1_EX = 1;
		memRead_EX = 1;
		#20
		RA1_ID = 1; //Load with dependance on 2
		RA2_ID = 2;
		RA1_EX = 2;
		memRead_EX = 1;
		#20
		$finish;
	end
endmodule