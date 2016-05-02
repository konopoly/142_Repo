module exception(opcode,overflow,halt);
	input [3:0] opcode;
	input overflow;
	output reg halt;

	always@(*) begin
		if(opcode==4'h0 || opcode==4'h4 || opcode==4'h5 || opcode==4'h6 || opcode==4'h8 || opcode==4'hB || opcode==4'hF || opcode==4'hC) begin
			halt = 0;
		end else begin
			halt = 1;
			$display("Wrong Opcode");
		end
		if(overflow) begin
			halt = 1;
			$display("Overflow");
		end else begin
			halt = 0;
		end
	end
endmodule
