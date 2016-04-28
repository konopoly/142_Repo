module hazard(RA1_ID,RA2_ID,RA1_EX,memRead_EX,hazard);
	input[3:0] RA1_ID,RA2_ID,RA1_EX;
	input memRead_EX;
	output hazard;
	reg hazard;
	
	always@(*)begin
		if((RA1_EX == RA1_ID || RA1_EX == RA2_ID) && memRead_EX) begin
			hazard = 1;
		end else begin
			hazard = 0;
		end
	end
endmodule