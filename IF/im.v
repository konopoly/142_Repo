module im(pc,one,two,three,four,rst,clk);
	input rst,clk;
	input [15:0] pc;
	output [3:0] one,two,three,four;
	reg [3:0] one,two,three,four;
	reg [7:0] instMem [51:0];
	integer i;

	always@(posedge clk or negedge rst) begin
		if(!rst) begin
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
				instMem[22] <= 8'h67;
				instMem[23] <= 8'h04;
				instMem[24] <= 8'h0B;
				instMem[25] <= 8'h1F;
				instMem[26] <= 8'h47;
				instMem[27] <= 8'h05;
				instMem[28] <= 8'h0B;
				instMem[29] <= 8'h2F;
				instMem[30] <= 8'h57;
				instMem[31] <= 8'h02;
				instMem[32] <= 8'h02;
				instMem[33] <= 8'h1F;
				instMem[34] <= 8'h02;
				instMem[35] <= 8'h1F;
				instMem[36] <= 8'h88;
				instMem[37] <= 8'h90;
				instMem[38] <= 8'h08;
				instMem[39] <= 8'h5F;
				instMem[40] <= 8'hB8;
				instMem[41] <= 8'h92;
				instMem[42] <= 8'h8A;
				instMem[43] <= 8'h92;
				instMem[44] <= 8'h0C;
				instMem[45] <= 8'hCF;
				instMem[46] <= 8'h0D;
				instMem[47] <= 8'hDE;
				instMem[48] <= 8'h0C;
				instMem[49] <= 8'hDF;
				instMem[50] <= 8'hF0;
				instMem[51] <= 8'h00;
		end
	end
	
	always@(*) begin
		one <= instMem[pc][7:4];
		two <= instMem[pc][3:0];
		three <= instMem[pc+1][7:4];
		four <= instMem[pc+1][3:0];
	end
	
endmodule