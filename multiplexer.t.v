// Multiplexer testbench
`timescale 1 ns / 1 ps
`include "multiplexer.v"

module testMultiplexer ();
  wire out;
  reg address0, address1;
  reg in0, in1, in2, in3;

  // behavioralMultiplexer mux(out, address0, address1, in0, in1, in2, in3);
  structuralMultiplexer mux(out, address0, address1, in0, in1, in2, in3);


// kind of a random error but I tried to test in a different order and this was the only one that didn't compile in errors - assuming it's due to order of assignments

  initial begin
    $dumpfile("multiplexer.vcd");
    $dumpvars(0, address0, address1, in0, in1, in2, in3, out);

    $display("A0 A1 | in0 in1 in2 in3 | Out | Expected Output");
    address0=0;address1=0;in0=1'b0;in1='bx;in2='bx;in3='bx; #1000
    $display(" %b  %b |  %b   %b   %b   %b  |  %b  |         0", address0, address1, in0, in1, in2, in3, out);
    address0=1;address1=0;in0='bx;in1=1'b0;in2='bx;in3='bx; #1000
    $display(" %b  %b |  %b   %b   %b   %b  |  %b  |         0", address0, address1, in0, in1, in2, in3, out);
    address0=0;address1=1;in0='bx;in1='bx;in2=1'b0;in3='bx; #1000
    $display(" %b  %b |  %b   %b   %b   %b  |  %b  |         0", address0, address1, in0, in1, in2, in3, out);
    address0=1;address1=1;in0='bx;in1='bx;in2='bx;in3=1'b0; #1000
    $display(" %b  %b |  %b   %b   %b   %b  |  %b  |         0", address0, address1, in0, in1, in2, in3, out);
    address0=0;address1=0;in0=1'b1;in1=1'bx;in2=1'bx;in3=1'bx; #1000
    $display(" %b  %b |  %b   %b   %b   %b  |  %b  |         1", address0, address1, in0, in1, in2, in3, out);
    address0=1;address1=0;in0=1'bx;in1=1'b1;in2=1'bx;in3=1'bx; #1000
    $display(" %b  %b |  %b   %b   %b   %b  |  %b  |         1", address0, address1, in0, in1, in2, in3, out);
    address0=0;address1=1;in0=1'bx;in1=1'bx;in2=1'b1;in3=1'bx; #1000
    $display(" %b  %b |  %b   %b   %b   %b  |  %b  |         1", address0, address1, in0, in1, in2, in3, out);
    address0=1;address1=1;in0=1'bx;in1=1'bx;in2=1'bx;in3=1'b1; #1000
    $display(" %b  %b |  %b   %b   %b   %b  |  %b  |         1", address0, address1, in0, in1, in2, in3, out);

    $finish();
  end

endmodule
