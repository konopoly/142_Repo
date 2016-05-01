module sub2(op1,result);
	input [15:0] op1;
	output reg[15:0] result;

	always@(*) begin
		result = op1 - 2;
	end
endmodule
