//polyashenko

`timescale 1ns / 1ps
module alu(
	input [3:0] CTRL,
	input signed [15:0] MUX_intop, MUX_inbottom,
	output reg signed [15:0] ALU_Result, Remainder,
	output reg Overflow_flag
  );

	reg [15:0] temp_store_rotation; // for rotation
	integer i;
	reg [31:0] temp_store_mult; // for multiplication 16bit * 16bit
	/* For overflow:
	// If the sum of two positive numbers yields a negative result, the sum has overflowed.
	//	If the sum of two negative numbers yields a positive result, the sum has overflowed.
	//	Otherwise, the sum has not overflowed.
	*/
	always @(*)
	begin
		if (CTRL == 4'b1111) begin //ADD
			ALU_Result = (MUX_intop + MUX_inbottom);
		if (MUX_intop[15] ~^ MUX_inbottom[15])
			if (((MUX_inbottom[15] == 0) && (ALU_Result[15] == 0) && (MUX_intop[15] == 0)) || ((MUX_inbottom[15] == 1) && (ALU_Result[15] == 1) && (MUX_intop[15] == 1)))
				Overflow_flag = 0; // same signs for bit 15 = no overflow
			else begin
				ALU_Result = 0;
				Overflow_flag = 1; // overflow occurs
			end
		else begin
			Overflow_flag = 0; // no overflow for one (+) & one (-) number
			Remainder = 0;
		end
	end

	else if (CTRL == 4'b1110) begin // SUBTRACT
		ALU_Result = (MUX_intop - MUX_inbottom);
			if (MUX_intop[15] ~^ MUX_inbottom[15]) // XNOR - if bits are same = true
				if (((MUX_inbottom[15] == 0) && (ALU_Result[15] == 0) && (MUX_intop[15] == 0)) || ((MUX_inbottom[15] == 1) && (ALU_Result[15] == 1) && (MUX_intop[15] == 1)))
					Overflow_flag = 0; // same signs for bit 15 = no overflow
				else begin
					ALU_Result = 0;
					Overflow_flag = 1; // overflow occurs
				end
			else begin
				Overflow_flag = 0; // no overflow for one (+) & one (-) number
				Remainder = 0;
			end
		end
	else if (CTRL == 4'b1101) begin // AND
		ALU_Result = (MUX_intop & MUX_inbottom);
		Overflow_flag = 0; Remainder = 0;
	end
	else if (CTRL == 4'b1100) begin // OR
		ALU_Result = (MUX_intop | MUX_inbottom);
		Overflow_flag = 0; Remainder = 0;
	end
	else if (CTRL == 4'b0001) begin // MULTIPLICATION
		temp_store_mult = (MUX_intop * MUX_inbottom); // store FULL result
		ALU_Result = temp_store_mult[15:0]; // result stores lower half
		Overflow_flag = 0; Remainder = temp_store_mult[31:16]; // remainder stores lower half
	end
	else if (CTRL == 4'b0010) begin // DIVISION
		ALU_Result = (MUX_intop / MUX_inbottom); // stores result
		Overflow_flag = 0;
		Remainder = (MUX_intop % MUX_inbottom); // stores remainder
	end
	else if (CTRL == 4'b1010) begin // SHIFT LEFT
		ALU_Result = (MUX_intop << MUX_inbottom);
		Overflow_flag = 0; Remainder = 0;
	end
	else if (CTRL == 4'b1011) begin // SHIFT RIGHT
		ALU_Result = (MUX_intop >>> MUX_inbottom); // fill with value of sign bit if expression is signed, otherwise 0's
		Overflow_flag = 0; Remainder = 0;
	end
	else if (CTRL == 4'b1000) begin // Rotate Left
		temp_store_rotation = MUX_intop;
		repeat(MUX_inbottom)
			temp_store_rotation = {temp_store_rotation[14:0], temp_store_rotation[15]}; // rotate op1 by op2 bits left
		ALU_Result = temp_store_rotation;
		Overflow_flag = 0; Remainder = 0;
	end
	else if (CTRL == 4'b1001) begin // Rotate Right
		temp_store_rotation = MUX_intop;
		repeat(MUX_inbottom)
			temp_store_rotation = {temp_store_rotation[0], temp_store_rotation[15:1]}; // rotate op1 by op2 bits right
		ALU_Result = temp_store_rotation;
		Overflow_flag = 0; Remainder = 0;
	end
	else if (CTRL == 4'b1010) begin // HALT
		Overflow_flag = 0; Remainder = 0; ALU_Result = 0;
	end
	else begin // CTRL == up to 16 , results in NOP
		Overflow_flag = 0; Remainder = 0; ALU_Result = 0;
	end
end
endmodule
