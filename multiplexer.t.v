// Multiplexer testbench
`timescale 1 ns / 1 ps
`include "multiplexer.v"

module testMultiplexer ();
  // Your test code here

	reg in0, in1, in2, in3;
	reg address0, address1;
	wire out;
	wire[1:0] address = {address1, address0};
    	wire[3:0] inputs = {in3, in2, in1, in0};

	behavioralMultiplexer multiplexer(out, address0, address1, in0, in1, in2, in3);
	
	wire naddress0;
	wire I0A0;
	wire naddress1;
	wire I0A1;
	wire I1A0;
	wire I1A1;
	wire I2A0;
	wire I2A1;
	wire I3A0;
	wire I3A1;

	structuralMultiplexer structural(address0, address1, in0, in1, in2, in3, structuralOut);
		
    initial begin

	$dumpfile("multiplexer.vcd");
	$dumpvars();

	$display("Behavioral Multiplexer");
    $display("A0 A1| I3 I2 I1 I0 | Output | Expected Output");
    address0=0; address1 = 0; in0=1; in1 = 0; in2 = 0; in3 = 0; #1000 
    $display("%b  %b |  %b  %b  %b  %b | %b | I0", address1, address0, in3, in2, in1, in0, out);
    address0=1; address1 = 0; in0=0; in1 = 1; in2 = 0; in3 = 0; #1000 
    $display("%b  %b |  %b  %b  %b  %b | %b | I1", address1, address0, in3, in2, in1, in0, out);
    address0=0; address1 = 1; in0=0; in1 = 0; in2 = 1; in3 = 0; #1000 
    $display("%b  %b |  %b  %b  %b  %b | %b | I2", address1, address0, in3, in2, in1, in0, out);
    address0=1; address1 = 1; in0=0; in1 = 0; in2 = 0; in3 = 1; #1000 
    $display("%b  %b |  %b  %b  %b  %b | %b | I3", address1, address0, in3, in2, in1, in0, out);

	$display("Structural Multiplexer");
    $display("A0 A1| I3 I2 I1 I0 | Output | Expected Output");
    address0=0; address1 = 0; in0=1; in1 = 0; in2 = 0; in3 = 0; #1000 
    $display("%b  %b |  %b  %b  %b  %b | %b | I0", address1, address0, in3, in2, in1, in0, structuralOut);
    address0=0; address1 = 0; in0=1'bX; in1 = 0; in2 = 0; in3 = 0; #1000 
    $display("%b  %b |  %b  %b  %b  %b | %b | I0", address1, address0, in3, in2, in1, in0, structuralOut);

    address0=1; address1 = 0; in0=0; in1 = 1; in2 = 0; in3 = 0; #1000 
	$display("%b  %b |  %b  %b  %b  %b | %b | I1", address1, address0, in3, in2, in1, in0, structuralOut);
    address0=1; address1 = 0; in0=0; in1 = 1'bX; in2 = 0; in3 = 0; #1000 
    $display("%b  %b |  %b  %b  %b  %b | %b | I1", address1, address0, in3, in2, in1, in0, structuralOut);
    
	address0=0; address1 = 1; in0=0; in1 = 0; in2 = 1; in3 = 0; #1000 
	$display("%b  %b |  %b  %b  %b  %b | %b | I2", address1, address0, in3, in2, in1, in0, structuralOut);
    address0=0; address1 = 1; in0=0; in1 = 0; in2 = 1'bX; in3 = 0; #1000 
    $display("%b  %b |  %b  %b  %b  %b | %b | I2", address1, address0, in3, in2, in1, in0, structuralOut);

    address0=1; address1 = 1; in0=0; in1 = 0; in2 = 0; in3 = 1; #1000 
	$display("%b  %b |  %b  %b  %b  %b | %b | I3", address1, address0, in3, in2, in1, in0, structuralOut);
    address0=1; address1 = 1; in0=0; in1 = 0; in2 = 0; in3 = 1'bX; #1000 
    $display("%b  %b |  %b  %b  %b  %b | %b | I3", address1, address0, in3, in2, in1, in0, structuralOut);
	end

endmodule
