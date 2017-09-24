// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder();
    reg a, b, carryin;
    wire sum, carryout;

    structuralFullAdder adder (sum, carryout, a, b, carryin);

    initial begin
        // Your test code here
		$dumpfile("adder.vcd");
		$dumpvars(0, testFullAdder);
	    $display("a b cin| sum cout | Expected Output");
	    a=0;b=0;carryin=0; #1000 
	    $display("%b %b %b  |   %b    %b | All false", a, b, carryin, sum, carryout);
	    a=0;b=1;carryin=0; #1000
	    $display("%b %b %b  |   %b    %b | sum Only", a, b, carryin, sum, carryout);
	    a=0;b=0;carryin=1; #1000 
	    $display("%b %b %b  |   %b    %b | sum Only", a, b, carryin, sum, carryout);
	    a=0;b=1;carryin=1; #1000 
	    $display("%b %b %b  |   %b    %b | carryout Only", a, b, carryin, sum, carryout);
	    a=1;b=0;carryin=0; #1000 
	    $display("%b %b %b  |   %b    %b | sum Only", a, b, carryin, sum, carryout);
	    a=1;b=1;carryin=0; #1000 
	    $display("%b %b %b  |   %b    %b | carryout Only", a, b, carryin, sum, carryout);
	    a=1;b=0;carryin=1; #1000 
	    $display("%b %b %b  |   %b    %b | carryout Only", a, b, carryin, sum, carryout);
	    a=1;b=1;carryin=1; #1000 
	    $display("%b %b %b  |   %b    %b | All true", a, b, carryin, sum, carryout);

    end
endmodule
