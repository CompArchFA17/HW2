// Multiplexer testbench
`timescale 1 ns / 1 ps
`include "multiplexer.v"

module testMultiplexer ();
  reg addr0, addr1;
  reg in0, in1, in2, in3;
  wire out;
  integer i;
  integer j;
  integer k;
  integer l;
  integer m;
  integer n;
    
  structuralMultiplexer multiplexer1 (out,addr0,addr1,in0,in1,in2,in3);

    initial begin

    $dumpfile("multiplexer.vcd");
    $dumpvars;

    $display("Expected Value = in3 for addr = 00");
    $display("Expected Value = in2 for addr = 01");
    $display("Expected Value = in1 for addr = 10");
    $display("Expected Value = in0 for addr = 11");


    $display("addr0 addr1 | in0  in1  in2  in3  |  out");

    for(i=0; i<2; i=i+1) begin
    	for(j=0; j<2; j=j+1) begin
    		for(k=0; k<2; k=k+1) begin
    			for(l=0; l<2; l=l+1) begin
    				for(m=0; m<2; m=m+1) begin
    					for(n=0; n<2; n=n+1) begin

addr1=i; addr0=j; in3=k; in2=l; in1=m; in0=n; #1000
$display("  %b     %b   |  %b    %b    %b    %b   |   %b", addr1, addr0, in3, in2,  in1, in0, out);

    					end
    				end
    			end
    		end
    		$display("");
    		$display(""); //split up each address into separate truth tables for easier reading
    	end
    end

end

endmodule
