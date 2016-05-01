module branch(opCode,RD1,R0R,pc,offset,branch);
	input[3:0] opCode;
	input[15:0] RD1,R0R,pc,offset;
	output[15:0] branch;
	reg[15:0] branch;
	
	always@(*)begin
		case(opCode)
			4'b0100: begin //Branch less than
				if(RD1<R0R) begin
					branch = pc + offset;
				end else begin
					branch = pc + 2;
				end
			end
			4'b0101: begin //Branch greater than
				if(RD1>R0R) begin
					branch = pc + offset;
				end else begin
					branch = pc + 2;
				end
			end
			4'b0110: begin //Branch on equal
				if(RD1==R0R) begin
					branch = pc + offset;
				end else begin
					branch = pc + 4;
				end
			end
		endcase
	end
endmodule