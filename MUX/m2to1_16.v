module m2to1_16(data0,data1,select,data_out);
	input [15:0] data0, data1;
	input select;
	output reg [15:0] data_out;

	always @ (*) begin
		if (select == 0)
			data_out <= data0;
		else
			data_out <= data1;
	end
endmodule
