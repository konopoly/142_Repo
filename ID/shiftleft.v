//polyashenko

`timescale 1ns / 1ps
module shiftleft(
	input [15:0] mux3output,
	output [15:0] shift_out
  );

	assign shift_out = mux3output << 1;

endmodule
