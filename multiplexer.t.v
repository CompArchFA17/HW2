// Multiplexer testbench
`timescale 1 ns / 1 ps
`include "multiplexer.v"

module testMultiplexer ();
  wire out;
  reg addr0, addr1;
  reg in0, in1, in2, in3;

  structuralMultiplexer multiplexer (out,addr0,addr1,in0,in1,in2,in3);

  initial begin
    // test when all wires are 0
    $display("A0 A1 | I0 I1 I2 I3 | Out | Expected Behaviour");
    addr0=0;addr1=0;in0=0;in1=0;in2=0;in3=0; #1000
    $display("%b  %b  | %b  %b  %b  %b  |  %b  | I0 Only (low)", addr0, addr1, in0, in1, in2, in3, out);
    addr0=0;addr1=0;in0=1;in1=0;in2=0;in3=0; #1000
    $display("%b  %b  | %b  %b  %b  %b  |  %b  | I0 Only (high)", addr0, addr1, in0, in1, in2, in3, out);
    addr0=1;addr1=0;in0=0;in1=0;in2=0;in3=0; #1000
    $display("%b  %b  | %b  %b  %b  %b  |  %b  | I1 Only (low)", addr0, addr1, in0, in1, in2, in3, out);
    addr0=1;addr1=0;in0=0;in1=1;in2=0;in3=0; #1000
    $display("%b  %b  | %b  %b  %b  %b  |  %b  | I1 Only (high)", addr0, addr1, in0, in1, in2, in3, out);
    addr0=0;addr1=1;in0=0;in1=0;in2=0;in3=0; #1000
    $display("%b  %b  | %b  %b  %b  %b  |  %b  | I2 Only (low)", addr0, addr1, in0, in1, in2, in3, out);
    addr0=0;addr1=1;in0=0;in1=0;in2=1;in3=0; #1000
    $display("%b  %b  | %b  %b  %b  %b  |  %b  | I2 Only (high)", addr0, addr1, in0, in1, in2, in3, out);
    addr0=1;addr1=1;in0=0;in1=0;in2=0;in3=0; #1000
    $display("%b  %b  | %b  %b  %b  %b  |  %b  | I3 Only (low)", addr0, addr1, in0, in1, in2, in3, out);
    addr0=1;addr1=1;in0=0;in1=0;in2=0;in3=1; #1000
    $display("%b  %b  | %b  %b  %b  %b  |  %b  | I3 Only (high)", addr0, addr1, in0, in1, in2, in3, out);
    end
endmodule
