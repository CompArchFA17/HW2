// Multiplexer testbench
`timescale 1 ns / 1 ps
`include "multiplexer.v"

module testMultiplexer ();
	reg address0, address1, in0, in1, in2, in3;
	wire out;

	structuralMultiplexer mult (out, address0, address1, in0, in1, in2, in3);

	initial begin
		$dumpfile("mult_trace.vcd");
    	$dumpvars;
        $display(" S0 S1 | in0 in1 in2 in3 | Out | Expected Output");
        address0=0; address1=0; in0=0; in1=0; in2=0; in3=0; #1000
        $display("  %b  %b |  %b   %b   %b   %b  |  %b  | False", address0, address1, in0, in1, in2, in3, out);
        address0=0; address1=0; in0=0; in1=1; in2=1; in3=1; #1000
        $display("  %b  %b |  %b   %b   %b   %b  |  %b  | False", address0, address1, in0, in1, in2, in3, out);
        address0=0; address1=0; in0=1; in1=0; in2=0; in3=0; #1000
        $display("  %b  %b |  %b   %b   %b   %b  |  %b  | True", address0, address1, in0, in1, in2, in3, out);
        address0=0; address1=0; in0=1; in1=1; in2=1; in3=1; #1000
        $display("  %b  %b |  %b   %b   %b   %b  |  %b  | True", address0, address1, in0, in1, in2, in3, out);
        address0=0; address1=1; in0=0; in1=0; in2=0; in3=0; #1000
        $display("  %b  %b |  %b   %b   %b   %b  |  %b  | False", address0, address1, in0, in1, in2, in3, out);
        address0=0; address1=1; in0=1; in1=0; in2=1; in3=1; #1000
        $display("  %b  %b |  %b   %b   %b   %b  |  %b  | False", address0, address1, in0, in1, in2, in3, out);
        address0=0; address1=1; in0=0; in1=1; in2=0; in3=0; #1000
        $display("  %b  %b |  %b   %b   %b   %b  |  %b  | True", address0, address1, in0, in1, in2, in3, out);
        address0=0; address1=1; in0=1; in1=1; in2=1; in3=1; #1000
        $display("  %b  %b |  %b   %b   %b   %b  |  %b  | True", address0, address1, in0, in1, in2, in3, out);
        address0=1; address1=0; in0=0; in1=0; in2=0; in3=0; #1000
        $display("  %b  %b |  %b   %b   %b   %b  |  %b  | False", address0, address1, in0, in1, in2, in3, out);
        address0=1; address1=0; in0=1; in1=1; in2=0; in3=1; #1000
        $display("  %b  %b |  %b   %b   %b   %b  |  %b  | False", address0, address1, in0, in1, in2, in3, out);
        address0=1; address1=0; in0=0; in1=0; in2=1; in3=0; #1000
        $display("  %b  %b |  %b   %b   %b   %b  |  %b  | True", address0, address1, in0, in1, in2, in3, out);
        address0=1; address1=0; in0=1; in1=1; in2=1; in3=1; #1000
        $display("  %b  %b |  %b   %b   %b   %b  |  %b  | True", address0, address1, in0, in1, in2, in3, out);
        address0=1; address1=1; in0=0; in1=0; in2=0; in3=0; #1000
        $display("  %b  %b |  %b   %b   %b   %b  |  %b  | False", address0, address1, in0, in1, in2, in3, out);
        address0=1; address1=1; in0=1; in1=1; in2=1; in3=0; #1000
        $display("  %b  %b |  %b   %b   %b   %b  |  %b  | False", address0, address1, in0, in1, in2, in3, out);
        address0=1; address1=1; in0=0; in1=0; in2=0; in3=1; #1000
        $display("  %b  %b |  %b   %b   %b   %b  |  %b  | True", address0, address1, in0, in1, in2, in3, out);
        address0=1; address1=1; in0=1; in1=1; in2=1; in3=1; #1000
        $display("  %b  %b |  %b   %b   %b   %b  |  %b  | True", address0, address1, in0, in1, in2, in3, out);
    end
endmodule
