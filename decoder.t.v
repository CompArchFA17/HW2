// Decoder testbench
`timescale 1 ns / 1 ps
`include "decoder.v"

module testDecoder (); 
    wire out0,out1,out2,out3;
	wire Sout0, Sout1, Sout2, Sout3;
    reg addr0, addr1;
    reg enable;


    behavioralDecoder decoder (out0,out1,out2,out3,addr0,addr1,enable);
    structuralDecoder structuraltest(Sout0,Sout1,Sout2,Sout3,addr0,addr1,enable); 

    initial begin

	$dumpfile("decoder.vcd");
	$dumpvars();

	$display("Behavioral Decoder");
    $display("En A0 A1| O0 O1 O2 O3 | Expected Output");
    enable=0;addr0=0;addr1=0; #1000 
    $display("%b  %b  %b |  %b  %b  %b  %b | All false", enable, addr0, addr1, out0, out1, out2, out3);
    enable=0;addr0=1;addr1=0; #1000
    $display("%b  %b  %b |  %b  %b  %b  %b | All false", enable, addr0, addr1, out0, out1, out2, out3);
    enable=0;addr0=0;addr1=1; #1000 
    $display("%b  %b  %b |  %b  %b  %b  %b | All false", enable, addr0, addr1, out0, out1, out2, out3);
    enable=0;addr0=1;addr1=1; #1000 
    $display("%b  %b  %b |  %b  %b  %b  %b | All false", enable, addr0, addr1, out0, out1, out2, out3);
    enable=1;addr0=0;addr1=0; #1000 
    $display("%b  %b  %b |  %b  %b  %b  %b | O0 Only", enable, addr0, addr1, out0, out1, out2, out3);
    enable=1;addr0=1;addr1=0; #1000 
    $display("%b  %b  %b |  %b  %b  %b  %b | O1 Only", enable, addr0, addr1, out0, out1, out2, out3);
    enable=1;addr0=0;addr1=1; #1000 
    $display("%b  %b  %b |  %b  %b  %b  %b | O2 Only", enable, addr0, addr1, out0, out1, out2, out3);
    enable=1;addr0=1;addr1=1; #1000 
    $display("%b  %b  %b |  %b  %b  %b  %b | O3 Only", enable, addr0, addr1, out0, out1, out2, out3);

	$display("Structural Decoder");
    $display("En A0 A1| O0 O1 O2 O3 | Expected Output");
    enable=0;addr0=0;addr1=0; #1000 
    $display("%b  %b  %b |  %b  %b  %b  %b | All false", enable, addr0, addr1, Sout0, Sout1, Sout2, Sout3);
    enable=0;addr0=1;addr1=0; #1000
    $display("%b  %b  %b |  %b  %b  %b  %b | All false", enable, addr0, addr1, Sout0, Sout1, Sout2, Sout3);
    enable=0;addr0=0;addr1=1; #1000 
    $display("%b  %b  %b |  %b  %b  %b  %b | All false", enable, addr0, addr1, Sout0, Sout1, Sout2, Sout3);
    enable=0;addr0=1;addr1=1; #1000 
    $display("%b  %b  %b |  %b  %b  %b  %b | All false", enable, addr0, addr1, Sout0, Sout1, Sout2, Sout3);
    enable=1;addr0=0;addr1=0; #1000 
    $display("%b  %b  %b |  %b  %b  %b  %b | O0 Only", enable, addr0, addr1, Sout0, Sout1, Sout2, Sout3);
    enable=1;addr0=1;addr1=0; #1000 
    $display("%b  %b  %b |  %b  %b  %b  %b | O1 Only", enable, addr0, addr1, Sout0, Sout1, Sout2, Sout3);
    enable=1;addr0=0;addr1=1; #1000 
    $display("%b  %b  %b |  %b  %b  %b  %b | O2 Only", enable, addr0, addr1, Sout0, Sout1, Sout2, Sout3);
    enable=1;addr0=1;addr1=1; #1000 
    $display("%b  %b  %b |  %b  %b  %b  %b | O3 Only", enable, addr0, addr1, Sout0, Sout1, Sout2, Sout3);
    end
endmodule
