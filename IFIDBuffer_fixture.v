`include "IFIDBuffer.v"

module IFIDBuffer_fixture;
    // inputs
    reg clk;
		reg hazard;
    reg reset;
    reg [3:0] opcode;
		reg [3:0] one;
		reg [3:0] two;
		reg [3:0] three;
		reg [15:0] PC;

    // outputs
		wire [3:0] opcode_o;
        wire [3:0] one_o;
		wire [3:0] two_o;
		wire [3:0] three_o;
		wire [15:0] PC_o;

    IFIDBuffer uut (
        .clk(clk),
				.hazard(hazard),
        .reset(reset),
				.opcode(opcode),
				.one(one),
				.two(two),
				.three(three),
				.opcode_o(opcode_o),
				.one_o(one_o),
				.two_o(two_o),
      .three_o(three_o)
    );

    initial
      begin
        clk = 0; forever #10 clk = ~clk;
      end

    initial
      begin
		//	$vcdpluson;
        // Initialize Inputs
				reset = 1;
				hazard = 0;
				opcode = 2;
				one = 3;
				two = 4;
				three = 5;
				PC = 15;
				#20
				reset = 1;
				hazard = 0;
				opcode = 10;
				one = 11;
				two = 12;
				three = 13;
				PC = 17;
				#20
				reset = 0;
				hazard = 0;
				opcode = 10;
				one = 11;
				two = 12;
				three = 13;
				PC = 17;
				#20
        		$finish;
      end
endmodule
