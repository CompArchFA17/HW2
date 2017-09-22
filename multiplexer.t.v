// Multiplexer testbench
`define AND and #50
`define OR or #50
`define NOT not #50
`timescale 1 ns / 1 ps
`include "multiplexer.v"

module testMultiplexer ();
  reg address0, address1;
  reg in0, in1, in2, in3;
  wire out;

  structuralMultiplexer dut(out, address0, address1, in0, in1, in2, in3);
  initial begin
  $dumpfile("mux.vcd");
  $dumpvars(0, testMultiplexer);
  $display("address0 | address1 | in0 | in1 | in2 | in3 | out | out expected | ");
  address0=0;address1=0;in0=0;in1=0;in2=0;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=0;address1=0;in0=0;in1=0;in2=0;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=0;address1=0;in0=0;in1=0;in2=1;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=0;address1=0;in0=0;in1=0;in2=1;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=0;address1=0;in0=0;in1=1;in2=0;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=0;address1=0;in0=0;in1=1;in2=0;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=0;address1=0;in0=0;in1=1;in2=1;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=0;address1=0;in0=0;in1=1;in2=1;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=0;address1=0;in0=1;in1=0;in2=0;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=0;address1=0;in0=1;in1=0;in2=0;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=0;address1=0;in0=1;in1=0;in2=1;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=0;address1=0;in0=1;in1=0;in2=1;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=0;address1=0;in0=1;in1=1;in2=0;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=0;address1=0;in0=1;in1=1;in2=0;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=0;address1=0;in0=1;in1=1;in2=1;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=0;address1=0;in0=1;in1=1;in2=1;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=0;address1=1;in0=0;in1=0;in2=0;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=0;address1=1;in0=0;in1=0;in2=0;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=0;address1=1;in0=0;in1=0;in2=1;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=0;address1=1;in0=0;in1=0;in2=1;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=0;address1=1;in0=0;in1=1;in2=0;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=0;address1=1;in0=0;in1=1;in2=0;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=0;address1=1;in0=0;in1=1;in2=1;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=0;address1=1;in0=0;in1=1;in2=1;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=0;address1=1;in0=1;in1=0;in2=0;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=0;address1=1;in0=1;in1=0;in2=0;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=0;address1=1;in0=1;in1=0;in2=1;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=0;address1=1;in0=1;in1=0;in2=1;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=0;address1=1;in0=1;in1=1;in2=0;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=0;address1=1;in0=1;in1=1;in2=0;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=0;address1=1;in0=1;in1=1;in2=1;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=0;address1=1;in0=1;in1=1;in2=1;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=1;address1=0;in0=0;in1=0;in2=0;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=1;address1=0;in0=0;in1=0;in2=0;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=1;address1=0;in0=0;in1=0;in2=1;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=1;address1=0;in0=0;in1=0;in2=1;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=1;address1=0;in0=0;in1=1;in2=0;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=1;address1=0;in0=0;in1=1;in2=0;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=1;address1=0;in0=0;in1=1;in2=1;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=1;address1=0;in0=0;in1=1;in2=1;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=1;address1=0;in0=1;in1=0;in2=0;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=1;address1=0;in0=1;in1=0;in2=0;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=1;address1=0;in0=1;in1=0;in2=1;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=1;address1=0;in0=1;in1=0;in2=1;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=1;address1=0;in0=1;in1=1;in2=0;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=1;address1=0;in0=1;in1=1;in2=0;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=1;address1=0;in0=1;in1=1;in2=1;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=1;address1=0;in0=1;in1=1;in2=1;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=1;address1=1;in0=0;in1=0;in2=0;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=1;address1=1;in0=0;in1=0;in2=0;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=1;address1=1;in0=0;in1=0;in2=1;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=1;address1=1;in0=0;in1=0;in2=1;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=1;address1=1;in0=0;in1=1;in2=0;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=1;address1=1;in0=0;in1=1;in2=0;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=1;address1=1;in0=0;in1=1;in2=1;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=1;address1=1;in0=0;in1=1;in2=1;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=1;address1=1;in0=1;in1=0;in2=0;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=1;address1=1;in0=1;in1=0;in2=0;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=1;address1=1;in0=1;in1=0;in2=1;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=1;address1=1;in0=1;in1=0;in2=1;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=1;address1=1;in0=1;in1=1;in2=0;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=1;address1=1;in0=1;in1=1;in2=0;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  address0=1;address1=1;in0=1;in1=1;in2=1;in3=0;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "0");
  address0=1;address1=1;in0=1;in1=1;in2=1;in3=1;#1000
  $display("%b        | %b        | %b   | %b   | %b   | %b   | %b   | %s            | ", address0, address1, in0, in1, in2, in3, out, "1");
  end
endmodule
