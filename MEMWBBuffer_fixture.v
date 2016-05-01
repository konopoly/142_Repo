`include "MEMWBBuffer.v"
module mem_wb_tb;
//label all inputs and outputs
	reg 		clk;
	reg 		hazard;
  reg     reset;
	reg [15:0]	aluOut;
	reg [15:0] 	result, dataIn, R0;

	wire [15:0] resultOut;
	wire [15:0] dataOut;
	wire  [3:0] R0Out;

	// Initialize mod
  MEMWBBuffer testing (clk,hazard,reset,aluOut,result,dataIn,R0,resultOut,dataOut,R0out);

	initial
	begin
		clk = 0; forever #10 clk = ~clk;
	end

	task ControlStatus();
	begin
	//display method for all signals
		$display("\nCLCK:%b reset:%b hazard:%b", clk, reset, hazard);
		$display("alu: %b", aluOut);
		$display("result: %b", result);

		$display("data1: %b", dataIn);
		$display("register: %b", R0);
		$display("result out: %b", resultOut);

		$display("data2: %b", dataOut);
		$display("register out: %b", R0Out);
	end
	endtask

	initial begin
		// empty all ports
		reset = 0;
		aluOut = 0;
		result = 0;
		dataIn = 0;
		R0 = 0;

		#30;
        ControlStatus();
		//for reset
		reset = 1;
		aluOut = 16'b0001111011011111;
		result = 16'b0111111011110011;
		dataIn = 16'b0111111011110011;
		R0 = 16'b0111111011110000;
		#30
		ControlStatus();
		$finish;
	end
endmodule
