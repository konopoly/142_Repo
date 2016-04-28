module registers(RA1,RA2,WA1,WD1,R0D,RD1,RD2,R0R,RegWrite,R0W,clk,rst);
	input[15:0] WD1,R0D;
	input[3:0] RA1,RA2,WA1;
	input R0W,RegWrite,clk,rst;
	output[15:0] RD1,RD2,R0R;
	reg[15:0] RD1,RD2,R0R;
	reg [15:0] regMem [15:0];
	integer i;
	
	always@(posedge clk or negedge rst) begin
		if(!rst) begin
			for (i=0; i<=15; i=i+1) regMem[i] <= 0;
			regMem[1] <= 16'h0F00;
			regMem[2] <= 16'h0050;
			regMem[3] <= 16'hFF0F;
			regMem[4] <= 16'hF0FF;
			regMem[5] <= 16'h0040;
		end
		
		R0R <= regMem[0];
		RD1 <= regMem[RA1];
		RD2 <= regMem[RA2];
		
		if(RegWrite) begin
			regMem[WA1] <= WD1;
		end
		if(R0W) begin
			regMem[0] <= R0D;
		end
	end
		
endmodule