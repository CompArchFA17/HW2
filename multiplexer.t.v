// Multiplexer testbench
`timescale 1 ns / 1 ps
`include "multiplexer.v"

module testMultiplexer ();
    reg addr0, addr1;
    reg in0, in1, in2, in3;
    reg na;
    wire out;
    //behavioralMultiplexer decoder (out, addr0, addr1, in0, in1, in2, in3);
    structuralMultiplexer decoder (out, addr0, addr1, in0, in1, in2, in3); // Swap after testing

    initial begin
    $dumpfile("multiplexer.vcd");
    $dumpvars(0, addr0, addr1, in0, in1, in2, in3, out);
    $display("A0 A1 | I0 I1 I2 I3 | Out ");
    addr0=0;addr1=0; #1000
    $display(" %b  %b |  %b  %b  %b  %b |   %b ", addr0, addr1, in0, in1, in2, in3, out);
    in0 = 0;
    addr0=0;addr1=0; #1000
    $display(" %b  %b |  %b  %b  %b  %b |   %b ", addr0, addr1, in0, in1, in2, in3, out);
    in0 = 1;
    addr0=0;addr1=0; #1000
    $display(" %b  %b |  %b  %b  %b  %b |   %b ", addr0, addr1, in0, in1, in2, in3, out);
    in0 = na;
    in1 = 0;
    addr0=1;addr1=0; #1000
    $display(" %b  %b |  %b  %b  %b  %b |   %b ", addr0, addr1, in0, in1, in2, in3, out);
    in1 = 1;
    addr0=1;addr1=0; #1000
    $display(" %b  %b |  %b  %b  %b  %b |   %b ", addr0, addr1, in0, in1, in2, in3, out);
    in1 = na;
    in2 = 0;
    addr0=0;addr1=1; #1000
    $display(" %b  %b |  %b  %b  %b  %b |   %b ", addr0, addr1, in0, in1, in2, in3, out);
    in2 = 1;
    addr0=0;addr1=1; #1000
    $display(" %b  %b |  %b  %b  %b  %b |   %b ", addr0, addr1, in0, in1, in2, in3, out);
    in2 = na;
    in3 = 0;
    addr0=1;addr1=1; #1000
    $display(" %b  %b |  %b  %b  %b  %b |   %b ", addr0, addr1, in0, in1, in2, in3, out);
    in3 = 1;
    addr0=1;addr1=1; #1000
    $display(" %b  %b |  %b  %b  %b  %b |   %b ", addr0, addr1, in0, in1, in2, in3, out);
    end
endmodule
