`timescale 1ns / 1ps
`include "m4to1_16.v"

module m4to1_16_tb();
	reg [15:0] data1, data2, data3, data4;
	reg [1:0] select;
	wire [15:0] data_out;
	
	m4to1_16 uut(data1, data2, data3, data4, select, data_out);

	initial begin
		$vcdpluson;
		data1 = 1;
		data2 = 2;
		data3 = 3;
		data4 = 4;
		#20
		select = 0;
		#20
		select = 1;
		#20
		select = 2;
		#20
		select = 3;
		#20
		$finish;
	end
endmodule