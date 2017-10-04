// Multiplexer testbench
`timescale 1 ns / 1 ps
`include "multiplexer.v"

module testMultiplexer ();
    wire out;
    reg S0, S1;
    reg in0, in1, in2, in3; 

    // behavioralMultiplexer potato(out, S0, S1, in0, in1, in2, in3); 
    structM newpotato(out, S0, S1, in0, in1, in2, in3); 

initial begin

    	$dumpfile("Multiplexer.vcd");
    	$dumpvars();

    $display("S0 S1| O0 O1 O2 O3 |output| Expected Output");
    in0=1;in1=0;in2=0;in3=0;S0=0;S1=0; #1000 
    $display("%b  %b |  %b  %b  %b  %b |  %b   | in0", S0, S1, in0, in1, in2, in3, out);
    in0=0;in1=1;in2=0;in3=0;S0=1;S1=0; #1000
    $display("%b  %b |  %b  %b  %b  %b |  %b   | in1", S0, S1, in0, in1, in2, in3, out);
    in0=0;in1=0;in2=1;in3=0;S0=0;S1=1; #1000 
    $display("%b  %b |  %b  %b  %b  %b |  %b   | in2", S0, S1, in0, in1, in2, in3, out);
    in0=0;in1=0;in2=0;in3=1;S0=1;S1=1; #1000 
    $display("%b  %b |  %b  %b  %b  %b |  %b   | in3", S0, S1, in0, in1, in2, in3, out);
    
    in0=0;in1=1;in2=1;in3=1;S0=0;S1=0; #1000 
    $display("%b  %b |  %b  %b  %b  %b |  %b   | in0", S0, S1, in0, in1, in2, in3, out);
    in0=1;in1=0;in2=1;in3=1;S0=1;S1=0; #1000
    $display("%b  %b |  %b  %b  %b  %b |  %b   | in1", S0, S1, in0, in1, in2, in3, out);
    in0=1;in1=1;in2=0;in3=1;S0=0;S1=1; #1000 
    $display("%b  %b |  %b  %b  %b  %b |  %b   | in2", S0, S1, in0, in1, in2, in3, out);
    in0=1;in1=1;in2=1;in3=0;S0=1;S1=1; #1000 
    $display("%b  %b |  %b  %b  %b  %b |  %b   | in3", S0, S1, in0, in1, in2, in3, out);
    
    end


endmodule
