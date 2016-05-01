module control(opCode,functionCode,regWrite,r0Write,pcSource,halt,aluSource,aluSource2,memRead,memWrite,memSource);
	input[3:0] opCode,functionCode;
	output regWrite,r0Write,halt,aluSource,aluSource2,memRead,memWrite,memSource;
	output[1:0] pcSource;
	reg[9:0] signals;
	
	always@(*)begin
		case(opCode)
			4'b0000: begin
				if(functionCode == 4'b0001 || functionCode == 4'b0010) begin
					signals=10'b1100000000; //Signed multiplication or signed division
				end else if (functionCode == 4'b1010 || functionCode == 4'b1011 || functionCode == 4'b1000 || functionCode == 4'b1001) begin
					signals=10'b1000001000;
				end else begin
					signals=10'b1000000000; //R type operation
				end
			end
			4'b1000: signals=10'b1000011101; //Load
			4'b1011: signals=10'b0000011010; //Store
			4'b0100: signals=10'b0010000000; //Branch less than
			4'b0101: signals=10'b0010000000; //Branch greater than
			4'b0110: signals=10'b0010000000; //Branch on equal
			4'b1100: signals=10'b0001000000; //Jump
			4'b1111: signals=10'b0000100000; //Halt
		endcase
	end
	
	assign regWrite = signals[9];
	assign r0Write = signals[8];
	assign pcSource = signals[7:6];
	assign halt = signals[5];
	assign aluSource = signals[4];
	assign aluSource2 = signals[3];
	assign memRead = signals[2];
	assign memWrite = signals[1];
	assign memSource = signals[0];
	
endmodule