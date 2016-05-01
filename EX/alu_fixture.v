`timescale 1ns / 1ps
`include "alu.v"
module alu_fixture;
	reg [3:0] CTRL;
	reg [15:0] MUX_intop, MUX_inbottom;
	wire [15:0] ALU_Result, Remainder;
	wire Overflow_flag;

	alu alu_uut(CTRL,MUX_intop,MUX_inbottom,ALU_Result,Remainder,Overflow_flag);

  initial begin
    $vcdpluson;
    CTRL = 1; MUX_intop = 1000; MUX_inbottom = 50; // Mult
    #10
    CTRL = 2; MUX_intop = 1000; MUX_inbottom = 50; // Div
    #10
    CTRL = 8; MUX_intop = 1000; MUX_inbottom = 50; // ROL
    #10
    CTRL = 9; MUX_intop = 1000; MUX_inbottom = 50; // ROR
    #10
    CTRL = 10; MUX_intop = 32000; MUX_inbottom = 5; // SLL
    #10
    CTRL = 11; MUX_intop = 25; MUX_inbottom = 6; // SLR
    #10 
    CTRL = 12; MUX_intop = 16'hFF0F; MUX_inbottom = 16'hFF0F; // OR
    #10
    CTRL = 13; MUX_intop = 18; MUX_inbottom = 1; // AND
    #10
    CTRL = 14; MUX_intop = 1000; MUX_inbottom = 50; //SUB
    #10
    CTRL = 15; MUX_intop = 1000; MUX_inbottom = 50; // ADD
    #10
    CTRL = 6; MUX_intop = 1000; MUX_inbottom = 50; //NOP
    #10
	$finish;
	end
endmodule
