module mem(memRead,memWrite,address,dataIn,dataOut,rst,clk);
	input memRead,memWrite,clk,rst;
	input [15:0] address,dataIn;
	output [15:0] dataOut;
	reg [7:0] dataMem [4095:0];
	reg [15:0] addressReg;
	integer i;

	always@(posedge clk or negedge rst) begin
		if(!rst)
			 for (i=0; i<4096; i=i+1) dataMem[i] <= 8'b00000000;
		if(memWrite)
			{dataMem[address],dataMem[address+1]} <= dataIn;
		if(memRead)
			addressReg <= address;
	end
	assign dataOut = {dataMem[addressReg],dataMem[addressReg+1]};
endmodule