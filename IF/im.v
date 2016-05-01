module im(pc,one,two,three,four,rst,clk);
	input rst,clk;
	input [15:0] pc;
	output [3:0] one,two,three,four;
	reg [3:0] one,two,three,four;
	reg [7:0] instMem [22:0];
	integer i;

	always@(posedge clk or negedge rst) begin
		if(!rst) begin
			for (i=0; i<=22; i=i+1) instMem[i] <= 8'b00000000;
				instMem[0] <= 8'h01;
				instMem[1] <= 8'h2F;
				instMem[2] <= 8'h01;
				instMem[3] <= 8'h2E;
				instMem[4] <= 8'h03;
				instMem[5] <= 8'h4C;
				instMem[6] <= 8'h03;
				instMem[7] <= 8'h2D;
				instMem[8] <= 8'h05;
				instMem[9] <= 8'h61;
				instMem[10] <= 8'h01;
				instMem[11] <= 8'h52;
				instMem[12] <= 8'h00;
				instMem[13] <= 8'h0E;
				instMem[14] <= 8'h04;
				instMem[15] <= 8'h3A;
				instMem[16] <= 8'h04;
				instMem[17] <= 8'h2B;
				instMem[18] <= 8'h06;
				instMem[19] <= 8'h38;
				instMem[20] <= 8'h06;
				instMem[21] <= 8'h29;
		end
	end
	
	always@(*) begin
		one <= instMem[pc][7:4];
		two <= instMem[pc][3:0];
		three <= instMem[pc+1][7:4];
		four <= instMem[pc+1][3:0];
	end
	
endmodule