// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder();
    reg a, b, carryin;
    wire sum, carryout;

    behavioralFullAdder adder (sum, carryout, a, b, carryin);

    initial begin
      $display("A B Cin | Cout Sum ");
      $monitor("%b %b  %b  |  %b   %b", a, b, carryin, carryout, sum);
      a=0;b=0;carryin=0; #1000;
      a=1;b=0;carryin=0; #1000;
      a=0;b=1;carryin=0; #1000;
      a=1;b=1;carryin=0; #1000;
      a=0;b=0;carryin=1; #1000;
      a=1;b=0;carryin=1; #1000;
      a=0;b=1;carryin=1; #1000;
      a=1;b=1;carryin=1; #1000;
    end
endmodule
