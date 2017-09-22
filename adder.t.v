// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder();
    reg a, b, carryin;
    wire sum, carryout;

    structuralFullAdder adder1 (sum, carryout, a, b, carryin);
    behavioralFullAdder adder2 (expectedsum, expectedcarryout, a, b, carryin);

    initial begin
    // Your test code here
    $display("   Inputs   |  Expected:   |   Circuit:  ");
    $display("a b carryin | sum carryout | sum carryout");
    a=0;b=0;carryin=0; #1000
    $display("%b %b %b       | %b   %b        | %b   %b   ", a, b, carryin, expectedsum, expectedcarryout, sum, carryout);
    a=1;b=0;carryin=0; #1000
    $display("%b %b %b       | %b   %b        | %b   %b   ", a, b, carryin, expectedsum, expectedcarryout, sum, carryout);
    a=0;b=1;carryin=0; #1000
    $display("%b %b %b       | %b   %b        | %b   %b   ", a, b, carryin, expectedsum, expectedcarryout, sum, carryout);
    a=1;b=1;carryin=0; #1000
    $display("%b %b %b       | %b   %b        | %b   %b   ", a, b, carryin, expectedsum, expectedcarryout, sum, carryout);


    a=0;b=0;carryin=1; #1000
    $display("%b %b %b       | %b   %b        | %b   %b   ", a, b, carryin, expectedsum, expectedcarryout, sum, carryout);
    a=1;b=0;carryin=1; #1000
    $display("%b %b %b       | %b   %b        | %b   %b   ", a, b, carryin, expectedsum, expectedcarryout, sum, carryout);
    a=0;b=1;carryin=1; #1000
    $display("%b %b %b       | %b   %b        | %b   %b   ", a, b, carryin, expectedsum, expectedcarryout, sum, carryout);
    a=1;b=1;carryin=1; #1000
    $display("%b %b %b       | %b   %b        | %b   %b   ", a, b, carryin, expectedsum, expectedcarryout, sum, carryout);

    end
endmodule
