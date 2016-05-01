//stores all information given unless reset is called, had to declare ports like this again
`timescale 1ns / 1ps
module EXMEMBuffer(
  input clk, hazard, reset,
  input [3:0] rd1,
  input [15:0] regout,
  input [15:0] alu, R0,
  output reg [15:0] result, R0out,
  output reg [3:0] rd1Out,
  output reg [15:0] aluOut
	);

	always @ (posedge clk)
	begin
		//if reset then set everything to 0 to NOP
		if (!reset)
		begin

      result <= 0;
      R0out <= 0;
      rd1Out <= 0;
      aluOut <= 0;
		end
		else
		begin
    result <= alu;
    R0out <= R0;
    rd1Out <= rd1;
    aluOut <= regout;
    end
	end
endmodule
