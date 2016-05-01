module adder16bit(op1,op2,result);
	input [15:0] op1, op2;
	output reg[15:0] result;

	always@(*) begin
		result = op1 + op2;
	end

endmodule
