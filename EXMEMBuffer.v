module EXMEMBuffer(clk,reset,regWrite,r0Write,memRead,memWrite,memSource,RA1,ALUResult,DataIn,R0D,regWrite_o,r0Write_o,memRead_o,memWrite_o,memSource_o,RA1_o,ALUResult_o,DataIn_o,R0D_o);
	input clk,reset,regWrite,r0Write,memRead,memWrite,memSource;
	input[3:0] RA1;
	input[15:0] ALUResult,DataIn,R0D;

	output reg regWrite_o,r0Write_o,memRead_o,memWrite_o,memSource_o;
	output reg[3:0] RA1_o;
	output reg[15:0] ALUResult_o,DataIn_o,R0D_o;

	always @(posedge clk or negedge reset) begin
		if (!reset) begin
			regWrite_o <= 0;
			r0Write_o <= 0;
			memRead_o <= 0;
			memWrite_o <= 0;
			memSource_o <= 0;
			RA1_o <= 0;
			ALUResult_o <= 0;
			DataIn_o <= 0;
			R0D_o <= 0;
		end
		else begin
			regWrite_o <= regWrite;
			r0Write_o <= r0Write;
			memRead_o <= memRead;
			memWrite_o <= memWrite;
			memSource_o <= memSource;
			RA1_o <= RA1;
			ALUResult_o <= ALUResult;
			DataIn_o <= DataIn;
			R0D_o <= R0D;
		end
	end
endmodule