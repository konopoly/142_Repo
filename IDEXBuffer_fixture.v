`include "IDEXBuffer.v"
module idex_test;
  reg clk;
  reg hazard;
  reg reset;
  reg [3:0] rd1, rd2;
  reg [15:0] signex, PC_o;

  wire [3:0] rd1out, rd2out;
  wire [15:0] signexout, regout;

	// Initialize module
	IDEXBuffer testing (clk, hazard, reset, rd1, rd2, signex, PC_o);

	initial
	begin
		clk = 0; forever #10 clk = ~clk;
	end

	//large method to display all changes in data
	task changes();
	begin
		$display("\nCLCK:%b reset:%b", clk, reset);
		$display("data1: %b", rd1);
		$display("data2: %b", rd2);
		//decide to show everything in binary
		$display("data1R: %b", rd1out);
		$display("data2R: %b", rd2out);
		$display("dataO1: %b", signex);
		$display(" dataO2: %b", PC_o);
		$display("dataO1R: %b", signexout);
		$display("dataO2R: %b", regout);
	end
	endtask

	initial begin
	//everything is set to zero at first
		reset = 0;
		rd1 = 0;
		rd2 = 0;
	  signex = 0;
    PC_o = 0;

		#20;
        changes();

		$display("resetted all data output:");
		reset = 1;
		//16 bit data in and out
		rd1 = 4'b0011;
		rd2 = 4'b1011;
    signex =16'b0001111011101111;
    PC_o = 16'b0001111011000011;
		#20
		changes();
		$finish;
	end
endmodule
