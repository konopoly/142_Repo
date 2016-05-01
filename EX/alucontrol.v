module alucontrol(opcode,functionCode,operation);
	input [3:0] opcode;
	input [3:0] functionCode;
	output reg [3:0] operation;

	always @ (*) begin
		if (opcode==4'b0000) begin	// A Type
			case (functionCode)
			1: operation = 4'b0001; // Multiplication
			2: operation = 4'b0010; // Division
			8: operation = 4'b1000; // Rotate Left
			9: operation = 4'b1001; // Rotate Right
			10: operation = 4'b1010; // Shift Left
			11: operation = 4'b1011; // Shift Right
			12: operation = 4'b1100; // OR
			13: operation = 4'b1101; // AND
			14: operation = 4'b1110; // Subtract
			15: operation = 4'b1111; // Add
			default: operation = 4'b0110; //NOP
			endcase
		end else if(opcode==1000 || opcode==1011) begin // B Type
			operation = 4'b1111;
		end else begin // C or D type
			operation=4'b0110; //NOP
		end
	end
endmodule