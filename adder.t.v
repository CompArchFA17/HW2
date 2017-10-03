// define gates with delays
`define AND and #50
`define OR or #50
`define XOR xor #50

// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder();
    reg a, b, carryin;
    wire sum, carryout;

    structuralFullAdder dut(sum, carryout, a, b, carryin);

    initial begin
    $dumpfile("adder.vcd");
    $dumpvars(0, testFullAdder);
    $display("a | b | carryin | carryout | carryout expected | sum | sum expected | ");
    a=0;b=0;carryin=0;#200
    $display("%b | %b | %b       | %b        | %s                 | %b   | %s            | ", a, b, carryin, carryout, "0", sum, "0");
    a=0;b=0;carryin=1;#200
    $display("%b | %b | %b       | %b        | %s                 | %b   | %s            | ", a, b, carryin, carryout, "0", sum, "1");
    a=0;b=1;carryin=0;#200
    $display("%b | %b | %b       | %b        | %s                 | %b   | %s            | ", a, b, carryin, carryout, "0", sum, "1");
    a=0;b=1;carryin=1;#200
    $display("%b | %b | %b       | %b        | %s                 | %b   | %s            | ", a, b, carryin, carryout, "1", sum, "0");
    a=1;b=0;carryin=0;#200
    $display("%b | %b | %b       | %b        | %s                 | %b   | %s            | ", a, b, carryin, carryout, "0", sum, "1");
    a=1;b=0;carryin=1;#200
    $display("%b | %b | %b       | %b        | %s                 | %b   | %s            | ", a, b, carryin, carryout, "1", sum, "0");
    a=1;b=1;carryin=0;#200
    $display("%b | %b | %b       | %b        | %s                 | %b   | %s            | ", a, b, carryin, carryout, "1", sum, "0");
    a=1;b=1;carryin=1;#200
    $display("%b | %b | %b       | %b        | %s                 | %b   | %s            | ", a, b, carryin, carryout, "1", sum, "1");
    end
endmodule
