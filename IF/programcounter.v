//polyashenko

module programcounter(
	input PCWrite, clk,reset,
	input [15:0] address_in,
	output reg [15:0] address_out
	);

	reg [15:0] current;   // Temporary wire

	always@(posedge clk or posedge reset)
	begin
		if (reset)
			address_out<=16'h0000;	// If reset, set to 0.
		else if(PCWrite)		// Check PCWrite signal
			begin
				address_out <= address_in;	// Write the next address
				current=address_in;	//Storing used address-in
			end
		else
			address_out <= current;	// Outputing the same address again
	end
endmodule
