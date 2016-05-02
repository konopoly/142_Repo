`timescale 1ns / 1ps
`include "m2to1_16.v"

module m2to1_16_tb();
	reg [15:0] data1, data2;
	reg select;
	wire [15:0] data_out;
	
	m4to1_16 uut(data1, data2, select, data_out);

	initial begin
		$vcdpluson;
		data1 = 1;
		data2 = 2;
		#20
		select = 0;
		#20
		select = 1;
		#20
		$finish;
	end
endmodule