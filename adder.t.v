// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder();
    reg a, b, carryin;
    wire sum, carryout;

    // behavioralFullAdder adder (sum, carryout, a, b, carryin);
    structuralFullAdder adder (sum, carryout, a, b, carryin); // Swap after testing

    initial begin
    $dumpfile("adder.vcd");
    $dumpvars();
    $display("A B Cin | Cout S | Expected Output");
    a=0;b=0;carryin=0; #1000
    $display("%b %b  %b  |   %b  %b | Both false, total = 0", a, b, carryin, carryout, sum);
    a=1;b=0;carryin=0; #1000
    $display("%b %b  %b  |   %b  %b | S only,     total = 1", a, b, carryin, carryout, sum);
    a=0;b=1;carryin=0; #1000
    $display("%b %b  %b  |   %b  %b | S only,     total = 1", a, b, carryin, carryout, sum);
    a=0;b=0;carryin=1; #1000
    $display("%b %b  %b  |   %b  %b | S only,     total = 1", a, b, carryin, carryout, sum);
    a=1;b=1;carryin=0; #1000
    $display("%b %b  %b  |   %b  %b | Cout only,  total = 2", a, b, carryin, carryout, sum);
    a=1;b=0;carryin=1; #1000
    $display("%b %b  %b  |   %b  %b | Cout only,  total = 2", a, b, carryin, carryout, sum);
    a=0;b=1;carryin=1; #1000
    $display("%b %b  %b  |   %b  %b | Cout only,  total = 2", a, b, carryin, carryout, sum);
    a=1;b=1;carryin=1; #1000
    $display("%b %b  %b  |   %b  %b | Both true,  total = 3", a, b, carryin, carryout, sum);
    $finish();
    end
endmodule
