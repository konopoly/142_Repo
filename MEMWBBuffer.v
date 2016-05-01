//either you store data in the buffer or its cleared
module MEMWBBuffer(
  input clk, hazard, reset,
  input [15:0] aluOut,
  input [15:0] result, dataIn, R0,
  output reg [15:0] resultOut, dataOut, R0out
	);

	always @ (posedge clk)

	begin
		//if reset then all ports are set to zero
		if (!reset)
		begin
;
      resultOut <= 0;
      dataOut <= 0;
      R0out <= 0;
		end
		else
		//otherwise store data
		begin
    resultOut <= result;
    dataOut <= dataIn;
    R0out <= R0;
		end
	end
endmodule
