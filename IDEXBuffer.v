//stores all information given unless reset is called, had to declare ports like this again
module IDEXBuffer(
  input clk, hazard, reset,
  input [3:0] rd1, rd2,
  input [15:0] signex, PC_o,
  output reg [3:0] rd1out, rd2out,
  output reg[15:0] signexout, regout
);

	always @ (posedge clk)
	begin
		//if reset then set everything to 0 to NOP
		if (!reset)
		begin
			rd1out <= 0;
			rd2out <= 0;
      signexout <= 0;
      regout <= 0;
		end
		else
		begin
    rd1out 			 <= rd1;
    rd2out 			 <= rd2;
    signexout <= signex;
    regout <= PC_o;
		end
	end
endmodule
