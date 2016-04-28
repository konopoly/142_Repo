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

    // outputs
		wire [3:0] opcode_o;
    wire [3:0] one_o;
		wire [3:0] two_o;
		wire [3:0] three_o;

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

    initial begin
        clk = 0; forever #10 clk = ~clk;
    end

    task displaySignals();
    begin
        $display("Output of opcode_o         = %d ", opcode_o);
				$display("Output of one_o         = %d ", one_o);
				$display("Output of two_o         = %d ", two_o);
				$display("Output of three_o         = %d ", three_o);
    end
    endtask

    initial begin
        // Initialize Inputs
        clk = 0; hazard = 0; reset = 1; opcode = 0; one = 0; two = 0; three = 0;
        #10
        displaySignals();
      	hazard = 1; reset = 0; opcode = 64; one = 64; two = 64; three = 64;
        #10
        displaySignals();
        hazard = 0;
        #10
        displaySignals();
        #10
        $finish;
    end
endmodule
