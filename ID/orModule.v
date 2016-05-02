module orModule(in1,in2,out);
	input in1,in2;
	output reg out;
	always@(*) begin
		if(in1 || in2) out = 1;
		else out = 0;
	end
endmodule