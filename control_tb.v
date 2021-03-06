`timescale 1ns / 1ps
`include "control.v"

module control_tb();
	reg[3:0] opCode,functionCode;
	wire regWrite,r0Write,halt,aluSource,aluSource2,memRead,memWrite,memSource;
	wire[1:0] pcSource;
	
	control uut(opCode,functionCode,regWrite,r0Write,pcSource,halt,aluSource,aluSource2,memRead,memWrite,memSource);
 
	initial begin
		$vcdpluson;
		opCode=4'b0000;
		functionCode=4'b0000;
		#20
		opCode=4'b0000;
		functionCode=4'b0001;
		#20
		opCode=4'b0000;
		functionCode=4'b0010;
		#20
		opCode=4'b1000;
		#20
		opCode=4'b1011;
		#20
		opCode=4'b0100;
		#20
		opCode=4'b0101;
		#20
		opCode=4'b0110;
		#20
		opCode=4'b1100;
		#20
		opCode=4'b1111;
		#20
		$finish;
	end
endmodule