// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder();

    reg a, b, carryin;
    wire sum, carryout;

    structuralFullAdder adder (sum, carryout, a, b, carryin);

    initial begin
        $dumpfile("adder_trace.vcd");
        $dumpvars;
        $display(" A B Cin | S Cout | Expected Output");
        a=0;b=0;carryin=0; #1000
        $display(" %b %b  %b  | %b   %b  | All False", a, b, carryin, sum, carryout);
        a=0;b=0;carryin=1; #1000
        $display(" %b %b  %b  | %b   %b  | S Only", a, b, carryin, sum, carryout);
        a=0;b=1;carryin=0; #1000
        $display(" %b %b  %b  | %b   %b  | S Only", a, b, carryin, sum, carryout);
        a=0;b=1;carryin=1; #1000
        $display(" %b %b  %b  | %b   %b  | Cout Only", a, b, carryin, sum, carryout);
        a=1;b=0;carryin=0; #1000
        $display(" %b %b  %b  | %b   %b  | S Only", a, b, carryin, sum, carryout);
        a=1;b=0;carryin=1; #1000
        $display(" %b %b  %b  | %b   %b  | Cout Only", a, b, carryin, sum, carryout);
        a=1;b=1;carryin=0; #1000
        $display(" %b %b  %b  | %b   %b  | Cout Only", a, b, carryin, sum, carryout);
        a=1;b=1;carryin=1; #1000
        $display(" %b %b  %b  | %b   %b  | All True", a, b, carryin, sum, carryout);
    end
endmodule
