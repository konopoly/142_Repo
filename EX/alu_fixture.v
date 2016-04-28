//polyashenko

`include "alu.v"
`timescale 1ns / 1ps
module ALU_fixture;
	// Inputs
  reg [3:0] CTRL;
  reg [15:0] MUX_intop;
  reg [15:0] MUX_inbottom;

  // Outputs
  wire [15:0] ALU_Result;
  wire [15:0] Remainder;
  wire Overflow_flag;

  // Instantiate the Unit Under Test (UUT)
  alu uut (
    .CTRL(CTRL),
    .MUX_intop(MUX_intop),
    .MUX_inbottom(MUX_inbottom),
    .ALU_Result(ALU_Result),
    .Remainder(Remainder),
    .Overflow_flag(Overflow_flag)
    );

    task displaySignals();
    begin
      $display("Operation           = %d", CTRL);
      $display("data1               = %d", MUX_intop);
      $display("data2               = %d", MUX_inbottom);
      $display("ALUResult           = %d", ALU_Result);
      $display("Remainder           = %d", Remainder);
      $display("Overflow            = %d", Overflow_flag);
    end
  endtask

  initial begin
    // Initialize Inputs
    CTRL = 0;
    MUX_intop = 0;
    MUX_inbottom = 0;

    $display("\nOP1 + OP2\n"); //ADD
    CTRL = 0; MUX_intop = 1000; MUX_inbottom = 50;
    #10
    displaySignals();
    $display("\nOP1 - OP2\n"); // SUBTRACT
    CTRL = 1; MUX_intop = 1000; MUX_inbottom = 50;
    #10
    displaySignals();
    $display("\nOP1 & OP2\n"); // AND
    CTRL = 2; MUX_intop = 1000; MUX_inbottom = 50;
    #10
    displaySignals();
    $display("\nOP1 | OP2\n"); // OR
    CTRL = 3; MUX_intop = 1000; MUX_inbottom = 50;
    #10
    displaySignals();
    $display("\nOP1 * OP2\n"); // MULTIPLICATION
    CTRL = 4; MUX_intop = 32000; MUX_inbottom = 5;
    #10
    displaySignals();
    $display("\nOP1 / OP2\n"); // DIVISION
    CTRL = 5; MUX_intop = 25; MUX_inbottom = 6;
    #10
    displaySignals();
    $display("\nOP1 << OP2\n"); // SHIFT LEFT
    CTRL = 6; MUX_intop = 18; MUX_inbottom = 1;
    #10
    displaySignals();
    $display("\nOP1 >>> OP2\n"); // SHIFT RIGHT
    CTRL = 7; MUX_intop = 18; MUX_inbottom = 1;
    #10
    displaySignals();
    $display("\nOP1 rotate left by OP2\n"); // Rotate Left
    CTRL = 8; MUX_intop = 1000; MUX_inbottom = 50;
    #10
    displaySignals();
    $display("\nOP1 rotate right by OP2\n"); // Rotate Right
    CTRL = 9; MUX_intop = 1000; MUX_inbottom = 50;
    #10
    displaySignals();
    $display("\nHALT Program\n"); // Rotate Right
    CTRL = 10; MUX_intop = 1000; MUX_inbottom = 50;
    #10
    displaySignals();
  end
endmodule
