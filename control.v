module control(opCode,functionCode,regWrite,r0Write,ra1Source,ra2Source,pcSource,halt,aluSource,memRead,memWrite,memSource,fnOffset);
	input[3:0] opCode,functionCode;
	output regWrite,r0Write,ra1Source,ra2Source,halt,aluSource,memRead,memWrite,memSource,fnOffset;
	output[1:0] pcSource;
	reg[11:0] signals;
	
	always@(*)begin
		case(opCode)
			4'b0000: begin
				if(functionCode == 4'b0001 || functionCode == 4'b0010) begin
					signals=12'b110000000000; //Signed multiplication or signed division
				end else begin
					signals=12'b100000000000; //R type operation
				end
			end
			4'b1000: signals=12'b100000011011; //Load
			4'b1011: signals=12'b000000010101; //Store
			4'b0100: signals=12'b000110000001; //Branch less than
			4'b0101: signals=12'b000110000001; //Branch greater than
			4'b0110: signals=12'b000110000001; //Branch on equal
			4'b1100: signals=12'b001101000001; //Jump
			4'b1111: signals=12'b001101100001; //Halt
		endcase
	end
	
	assign regWrite = signals[11];
	assign r0Write = signals[10];
	assign ra1Source = signals[9];
	assign ra2Source = signals[8];
	assign pcSource = signals[7:6];
	assign halt = signals[5];
	assign aluSource = signals[4];
	assign memRead = signals[3];
	assign memWrite = signals[2];
	assign memSource = signals[1]; 
	assign fnOffset = signals[0];
	
endmodule