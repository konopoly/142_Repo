//on posedge clock with reset, if/id buffer

module IFIDBuffer(
	input clk, hazard, reset,
	input[3:0] opcode, one, two, three,
	output reg[3:0] opcode_o, one_o, two_o, three_o
	);

always @(posedge clk or negedge reset)
begin
	if (reset)
	begin
		opcode_o=4'h0000;
		one_o=4'h0000;
		two_o=4'h0000;
		three_o=4'h0000;
	end
	else if (hazard)			//If FLUSH, then perform No operation
	begin
		opcode_o=4'h0000;
		one_o=4'h0000;
		two_o=4'h0000;
		three_o=4'h0000;
	end
	else // else write the address and instruction.
	begin
		opcode_o=opcode;
		one_o=one;
		two_o=two;
		three_o=three;
	end
end
endmodule
