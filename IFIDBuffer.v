//on posedge clock with reset, if/id buffer

module IFIDBuffer(clk,hazard,reset,PC,opcode,one,two,three,opcode_o,one_o,two_o,three_o,PC_o);
	input clk, hazard, reset;
	input[3:0] opcode, one, two, three;
	input[15:0] PC;
	output reg[3:0] opcode_o, one_o, two_o, three_o;
	output reg[15:0] PC_o;

	always @(posedge clk or negedge reset)
	begin
		if (!reset)
		begin
			opcode_o<=4'b0000;
			one_o<=4'b0000;
			two_o<=4'b0000;
			three_o<=4'b0000;
			PC_o<=0;
		end
		else if (!hazard)			//If FLUSH, then perform No operation
		begin
			opcode_o<=opcode;
			one_o<=one;
			two_o<=two;
			three_o<=three;
			PC_o<=PC;
		end
	end
endmodule
