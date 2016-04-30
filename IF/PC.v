module PC(address_in,address_out,halt,clk,reset);
	input halt,clk,reset;
	input [15:0] address_in;
	output reg [15:0] address_out;

	always@(posedge clk or negedge reset) begin
		if (!reset) begin 
			address_out<=0;
		end else if(halt) begin
			address_out <= 16'hFFFF;
		end else begin
			address_out <= address_in;
		end
	end
endmodule