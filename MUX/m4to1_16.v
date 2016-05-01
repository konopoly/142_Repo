module m4to1_16(data1, data2, data3, data4, select, data_out);
	input [15:0] data1, data2, data3, data4;
	input [1:0] select;
	output reg [15:0] data_out;

	always @ (*) begin
		if (select == 0)
			data_out <= data1;
		else if (select == 1)
			data_out <= data2;
		else if (select == 2)
			data_out <= data3;
		else 
			data_out <= data4;
	end
endmodule
