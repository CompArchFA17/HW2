// Multiplexer testbench
`timescale 1 ns / 1 ps
`include "multiplexer.v"

module testMultiplexer ();
  reg in0, in1, in2, in3;
  reg addr0, addr1;
  wire out;

  //behavioralMultiplexer mux(out, addr0, addr1, in0, in1, in2, in3);
  structuralMultiplexer mux(in0, in1, in2, in3, addr0, addr1, out);

  initial begin
    $display("A0 A1| in0 in1 in2 in3 | Out | Expected Output");
    in0=1;in1=0;in2=0;in3=0;addr0=0;addr1=0; #1000 
    $display("%b  %b  | %b  %b  %b  %b  |  %b  | 1", addr0, addr1, in0, in1, in2, in3, out);
    in0=0;in1=1;in2=0;in3=0;addr0=1;addr1=0; #1000 
    $display("%b  %b  | %b  %b  %b  %b  |  %b  | 1", addr0, addr1, in0, in1, in2, in3, out);
    in0=0;in1=0;in2=1;in3=0;addr0=0;addr1=1; #1000 
    $display("%b  %b  | %b  %b  %b  %b  |  %b  | 1", addr0, addr1, in0, in1, in2, in3, out);
    in0=0;in1=0;in2=0;in3=1;addr0=1;addr1=1; #1000 
    $display("%b  %b  | %b  %b  %b  %b  |  %b  | 1", addr0, addr1, in0, in1, in2, in3, out);
    end

endmodule
