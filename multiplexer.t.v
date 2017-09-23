// Multiplexer testbench
`timescale 1 ns / 1 ps
`include "multiplexer.v"

module testMultiplexer ();
    reg addr0, addr1;
    reg in0, in1, in2, in3;
    wire out0;

    //behavioralMultiplexer bmux(out, addr0, addr1, in0, in1, in2, in3);
    structuralMultiplexer smux(out, addr0, addr1, in0, in1, in2, in3);

    initial begin
    $dumpfile("multiplexer.vcd");
	$dumpvars;
    $display("A0 A1 O0 O1 O2 O3 | out | Expected Output");
    //Change in0
    addr0=0;addr1=0;in0=0;in1=0;in2=0;in3=0; #1000 
    $display("%b  %b  %b  %b  %b  %b | %b | in0:0", addr0, addr1, in0, in1, in2, in3, out);
    addr0=0;addr1=0;in0=1; #1000    
    $display("%b  %b  %b  %b  %b  %b | %b | in0:1", addr0, addr1, in0, in1, in2, in3, out);
    //Change in1
    addr0=1;addr1=0;in0=0; #1000 
    $display("%b  %b  %b  %b  %b  %b | %b | in1:0", addr0, addr1, in0, in1, in2, in3, out);
    addr0=1;addr1=0;in1=1; #1000 
    $display("%b  %b  %b  %b  %b  %b | %b | in1:1", addr0, addr1, in0, in1, in2, in3, out);
    //Change in2
    addr0=0;addr1=1;in1=0; #1000 
    $display("%b  %b  %b  %b  %b  %b | %b | in2:0", addr0, addr1, in0, in1, in2, in3, out);
    addr0=0;addr1=1;in2=1; #1000 
    $display("%b  %b  %b  %b  %b  %b | %b | in2:1", addr0, addr1, in0, in1, in2, in3, out);
    //Change in3
    addr0=1;addr1=1;in2=0; #1000 
    $display("%b  %b  %b  %b  %b  %b | %b | in3:0", addr0, addr1, in0, in1, in2, in3, out);
    addr0=1;addr1=1;in3=1; #1000 
    $display("%b  %b  %b  %b  %b  %b | %b | in3:1", addr0, addr1, in0, in1, in2, in3, out);
    //Other cases
    addr0=0;addr1=0;in0=1;in1=1;in2=1;in3=1; #1000 
    $display("%b  %b  %b  %b  %b  %b | %b | in0:1", addr0, addr1, in0, in1, in2, in3, out);
    addr0=0;addr1=0;in0=0;in1=1;in2=1;in3=1; #1000 
    $display("%b  %b  %b  %b  %b  %b | %b | in0:0", addr0, addr1, in0, in1, in2, in3, out);
    $display("Assume the other inputs work like in0, etc.. Because the logic is symmetric.");
    end
endmodule
