module mem(memRead,memWrite,address,dataIn,dataOut,rst,clk);
	input memRead,memWrite,clk,rst;
	input [15:0] address,dataIn;
	output reg [15:0] dataOut;
	reg [7:0] dataMem [127:0];
	integer i;

	always@(posedge clk or negedge rst) begin
		if(!rst) begin
			for (i=0; i<127; i=i+1) dataMem[i] <= 8'b00000000;
			 	dataMem[0] <= 8'hAB;
				dataMem[1] <= 8'h99;
			end
		if(memWrite) begin
			{dataMem[address],dataMem[address+1]} <= dataIn;
		end
	end
	always@(*) begin
		dataOut = {dataMem[address],dataMem[address+1]};
	end
endmodule