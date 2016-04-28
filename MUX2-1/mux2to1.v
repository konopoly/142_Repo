//polyashenko

`timescale 1ns / 1ps
module mux2to1(
	input [15:0] data1, data2,
	input select,
	output reg [15:0] data_out
	);

	always @ (*)
	begin
		if (select == 0)
			data_out <= data1;
		else if (select == 1)
			data_out <= data2;
		else
			data_out <= 0;
	end
endmodule
