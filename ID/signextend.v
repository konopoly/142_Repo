module signextend(opcode,one,two,three,extendOutput);
	input[3:0] opcode,one,two,three;
	output[15:0] extendOutput;
	reg[15:0] extendOutput;
	
	always @ (*)
	begin
		if(opcode==4'b1000 || opcode==4'b1011) begin //B types
			if(three[3] == 1'b0) // if it's 0, extend with 0's
				extendOutput = {12'h0, three[3:0]}; // concatenate & extend to 16 bits with 0's
			else // else extend with 1's
				extendOutput = {12'h1, three[3:0]}; // concatenate & extend to 16 bits with 1's
		end else if (opcode==4'b0100 || opcode==4'b0101 || opcode==4'b0110) begin //C type
			if(two[3] == 1'b0) // if it's 0, extend with 0's
				extendOutput = {8'h0, two[3:0],three[3:0]}; // concatenate & extend to 16 bits with 0's
			else // else extend with 1's
				extendOutput = {8'h1, two[3:0],three[3:0]}; // concatenate & extend to 16 bits with 1's
		end else if (opcode==4'b1100 || opcode==4'b1111)  begin //D type
			if(one[3] == 1'b0) // if it's 0, extend with 0's
					extendOutput = {4'h0,one[3:0],two[3:0],three[3:0]}; // concatenate & extend to 16 bits with 0's
				else // else extend with 1's
					extendOutput = {4'h1,one[3:0],two[3:0],three[3:0]}; // concatenate & extend to 16 bits with 1's
		end else begin
			extendOutput = 0;
		end
	end
endmodule