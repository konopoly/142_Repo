module forward(RA1_EX,RA2_EX,RA1_MEM,RA1_WB,R0W,RegWrite_MEM,RegWrite_WB,FWD1,FWD2);
	input[3:0] RA1_EX,RA2_EX,RA1_MEM,RA1_WB;
	input R0W,RegWrite_MEM,RegWrite_WB;
	output[1:0] FWD1,FWD2;
	reg[1:0] FWD1,FWD2;
	
	always@(*)begin
		
		if(RegWrite_MEM && RA1_MEM==RA1_EX) FWD1 = 1; //Forward RA1 from MEM
		else if(RegWrite_WB && RA1_WB==RA1_EX) FWD1 = 2; //Forward RA1 from WB
		else if(R0W && RA1_EX==0) FWD1 = 3; //Forward R0 to RA1 from WB		
		else FWD1 = 0;
		
		if(RegWrite_MEM && RA1_MEM==RA2_EX) FWD2 = 1; //Forward RA2 from MEM
		else if(RegWrite_WB && RA1_WB==RA2_EX) FWD2 = 2; //Forward RA2 from WB
		else if(R0W && RA2_EX==0) FWD2 = 3; //Forward R0 to RA2 from WB
		else FWD2 = 0;
		
	end
endmodule