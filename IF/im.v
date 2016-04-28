module im(pc,one,two,three,four,rst,clk);
	input rst,clk;
	input [15:0] pc;
	output [3:0] one,two,three,four;
	reg [3:0] one,two,three,four;
	reg [7:0] instMem [10:0];
	integer i;

	always@(posedge clk or negedge rst) begin
		if(!rst) begin
			for (i=0; i<=10; i=i+1) instMem[i] <= 8'b00000000;
			instMem[0] <= 8'h00;
			instMem[1] <= 8'h91;
			instMem[2] <= 8'h82;
			instMem[3] <= 8'h73;
			instMem[4] <= 8'h64;
			instMem[5] <= 8'h55;
			instMem[6] <= 8'h46;
			instMem[7] <= 8'h37;
			instMem[8] <= 8'h28;
			instMem[9] <= 8'h19;
		end
		one <= instMem[pc][7:4];
		two <= instMem[pc][3:0];
		three <= instMem[pc+1][7:4];
		four <= instMem[pc+1][3:0];
	end
endmodule