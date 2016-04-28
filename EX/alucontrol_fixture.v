`include "alucontrol.v"
module alucontrol_fixture;
	// Inputs
  reg [1:0] ALUop;
  reg [3:0] functionCode;

  // Outputs
  wire [3:0] operation;

  // Instantiate the Unit Under Test (UUT)
  alucontrol uut (
  	.ALUop(ALUop),
    .functionCode(functionCode),
    .operation(operation)
  );

  task displaySignals();
  	begin
  		$display("\nALUop = %d ", ALUop);
    	$display("Function Code = %d ", functionCode);
    	$display("Operation = %d ", operation);
  	end
  endtask

  initial begin
  	// Initialize Inputs
    ALUop = 0; functionCode = 0;
    #10;
    ALUop = 0; functionCode = 4'b1001;
    #10;
    displaySignals();
    ALUop = 0; functionCode = 4'b0001;
    #10;
    displaySignals();
    ALUop = 1; functionCode = 4'b0001;
    #10;
    displaySignals();
    ALUop = 2; functionCode = 4'b1111;
    #10;
    displaySignals();
  	ALUop = 2; functionCode = 0010;
    #10;
    displaySignals();
    $finish;
  end
endmodule
