// Multiplexer testbench
`timescale 1 ns / 1 ps
`include "multiplexer.v"

module testMultiplexer ();
  // Your test code here
  	reg addr0, addr1;
    reg in0, in1, in2, in3;
    wire out;

    structuralMultiplexer multiplexer (out, addr0, addr1, in0, in1, in2, in3);

    initial begin
		$dumpfile("multiplexer.vcd");
		$dumpvars(0, testMultiplexer);
    	$display("addr0 addr1 in0 in1 in2 in3 | out | Expected Output");
    	addr0=0;addr1=0; in0=0; in1=0; in2=0; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=0;addr1=0; in0=0; in1=0; in2=0; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=0;addr1=0; in0=0; in1=0; in2=1; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=0;addr1=0; in0=0; in1=0; in2=1; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=0;addr1=0; in0=0; in1=1; in2=0; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=0;addr1=0; in0=0; in1=1; in2=0; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=0;addr1=0; in0=0; in1=1; in2=1; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=0;addr1=0; in0=0; in1=1; in2=1; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=0;addr1=0; in0=1; in1=0; in2=0; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=0;addr1=0; in0=1; in1=0; in2=0; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=0;addr1=0; in0=1; in1=0; in2=1; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=0;addr1=0; in0=1; in1=0; in2=1; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=0;addr1=0; in0=1; in1=1; in2=0; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=0;addr1=0; in0=1; in1=1; in2=0; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=0;addr1=0; in0=1; in1=1; in2=1; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=0;addr1=0; in0=1; in1=1; in2=1; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);

    	addr0=0;addr1=1; in0=0; in1=0; in2=0; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=0;addr1=1; in0=0; in1=0; in2=0; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=0;addr1=1; in0=0; in1=0; in2=1; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=0;addr1=1; in0=0; in1=0; in2=1; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=0;addr1=1; in0=0; in1=1; in2=0; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=0;addr1=1; in0=0; in1=1; in2=0; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=0;addr1=1; in0=0; in1=1; in2=1; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=0;addr1=1; in0=0; in1=1; in2=1; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=0;addr1=1; in0=1; in1=0; in2=0; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=0;addr1=1; in0=1; in1=0; in2=0; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=0;addr1=1; in0=1; in1=0; in2=1; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=0;addr1=1; in0=1; in1=0; in2=1; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=0;addr1=1; in0=1; in1=1; in2=0; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=0;addr1=1; in0=1; in1=1; in2=0; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=0;addr1=1; in0=1; in1=1; in2=1; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=0;addr1=1; in0=1; in1=1; in2=1; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);

    	addr0=1;addr1=0; in0=0; in1=0; in2=0; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=1;addr1=0; in0=0; in1=0; in2=0; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=1;addr1=0; in0=0; in1=0; in2=1; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=1;addr1=0; in0=0; in1=0; in2=1; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=1;addr1=0; in0=0; in1=1; in2=0; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=1;addr1=0; in0=0; in1=1; in2=0; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=1;addr1=0; in0=0; in1=1; in2=1; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=1;addr1=0; in0=0; in1=1; in2=1; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=1;addr1=0; in0=1; in1=0; in2=0; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=1;addr1=0; in0=1; in1=0; in2=0; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=1;addr1=0; in0=1; in1=0; in2=1; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=1;addr1=0; in0=1; in1=0; in2=1; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=1;addr1=0; in0=1; in1=1; in2=0; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=1;addr1=0; in0=1; in1=1; in2=0; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=1;addr1=0; in0=1; in1=1; in2=1; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=1;addr1=0; in0=1; in1=1; in2=1; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);

    	addr0=1;addr1=1; in0=0; in1=0; in2=0; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=1;addr1=1; in0=0; in1=0; in2=0; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=1;addr1=1; in0=0; in1=0; in2=1; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=1;addr1=1; in0=0; in1=0; in2=1; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=1;addr1=1; in0=0; in1=1; in2=0; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=1;addr1=1; in0=0; in1=1; in2=0; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=1;addr1=1; in0=0; in1=1; in2=1; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=1;addr1=1; in0=0; in1=1; in2=1; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=1;addr1=1; in0=1; in1=0; in2=0; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=1;addr1=1; in0=1; in1=0; in2=0; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=1;addr1=1; in0=1; in1=0; in2=1; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=1;addr1=1; in0=1; in1=0; in2=1; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=1;addr1=1; in0=1; in1=1; in2=0; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=1;addr1=1; in0=1; in1=1; in2=0; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=1;addr1=1; in0=1; in1=1; in2=1; in3=0; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | false", addr0, addr1, in0, in1, in2, in3, out);
    	addr0=1;addr1=1; in0=1; in1=1; in2=1; in3=1; #1000
    	$display("%b     %b     %b   %b   %b   %b   |   %b | true", addr0, addr1, in0, in1, in2, in3, out);
    end
endmodule
