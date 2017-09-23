// Multiplexer testbench
`timescale 1 ns / 1 ps
`include "multiplexer.v"

module testMultiplexer ();
  reg addr0, addr1;
  reg in0, in1, in2, in3;
  wire out;
  input A;

  structuralMultiplexer multiplexer (out, addr0, addr1, in0, in1, in2, in3);
  
  initial begin
  $dumpfile("multiplexer.vcd");
  $dumpvars();

  $display("|    input s    ||  select   |expected|actual|");
  $display("|in0|in1|in2|in3||addr1|addr0|| out  || out  |");
  $display("+---+---+---+---++-----+-----++------++------+");
  in0=0;
  addr0=0; addr1=0; #1000
  $display("| %b | %b | %b | %b ||  %b  |  %b  || in0  ||  %b   |",
	in0, in1,  in2, in3, addr1, addr0, out);
  in0=1; #1000
  $display("| %b | %b | %b | %b ||  %b  |  %b  || in0  ||  %b   |",
	in0, in1,  in2, in3, addr1, addr0, out);
  in1=0;in0=1'dx;
  addr0=1; addr1=0; #1000
  $display("| %b | %b | %b | %b ||  %b  |  %b  || in1  ||  %b   |",
	in0, in1,  in2, in3, addr1, addr0, out);
  in1=1; #1000
  $display("| %b | %b | %b | %b ||  %b  |  %b  || in1  ||  %b   |",
	in0, in1,  in2, in3, addr1, addr0, out);
  in2=0;in1=1'dx;
  addr0=0; addr1=1; #1000
  $display("| %b | %b | %b | %b ||  %b  |  %b  || in2  ||  %b   |",
	in0, in1,  in2, in3, addr1, addr0, out);
  in2=1; #1000
  $display("| %b | %b | %b | %b ||  %b  |  %b  || in2  ||  %b   |",
	in0, in1,  in2, in3, addr1, addr0, out);
  in3=0;in2=1'dx;
  addr0=1; addr1=1; #1000
  $display("| %b | %b | %b | %b ||  %b  |  %b  || in3  ||  %b   |",
	in0, in1,  in2, in3, addr1, addr0, out);
  in3=1; #1000
  $display("| %b | %b | %b | %b ||  %b  |  %b  || in3  ||  %b   |",
	in0, in1,  in2, in3, addr1, addr0, out);
  end
endmodule
