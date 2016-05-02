module branch(opCode,RD1,R0R,pc,offset,branch,hazard,clk);
	input clk;
	input[3:0] opCode;
	input[15:0] RD1,R0R,pc,offset;
	output reg[15:0] branch;
	output reg hazard;
	
	always@(*)begin
		case(opCode)
			4'b0100: begin //Branch less than
				if(RD1<R0R) begin
					branch = pc + offset + 2;
				end else begin
					branch = pc + 4;
				end
			end
			4'b0101: begin //Branch greater than
				if(RD1>R0R) begin
					branch = pc + offset +2;
				end else begin
					branch = pc + 4;
				end
			end
			4'b0110: begin //Branch on equal
				if(RD1==R0R) begin
					branch = pc + offset+2;
				end else begin
					branch = pc + 4;
				end
			end
		endcase
	end
	always@(posedge clk) begin
		if(branch > pc+4) begin
			hazard <= 1;
		end else begin
			hazard <= 0;
		end
	end
endmodule