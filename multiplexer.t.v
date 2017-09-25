// Multiplexer testbench
`timescale 1 ns / 1 ps
`include "multiplexer.v"

module testMultiplexer ();
  // Your test code here
    reg addr0, addr1;
    reg in0, in1, in2, in3;
    wire out;

    //behavioralMultiplexer mux (out, addr0, addr1, in0, in1, in2, in3);
    structuralMultiplexer mux (out, addr0, addr1, in0, in1, in2, in3); // Swap after testing

    initial begin
    $dumpfile("multiplexer.vcd");
    $dumpvars(0,mux);
    $display("addr1 addr0| in0 in1 in2 in3 | Expected Output | Actual Output");
// First 2 by 2 cases with in2 and in3
    
    addr1=0;addr0=0;in0=1; in1=0; in2=0; in3=0; #1000
    $display("%b     %b    | %b   %b   %b   %b   | %b               | %b ", addr1, addr0, in0, in1, in2, in3, in0, out);
    addr1=0;addr0=1;in0=0; in1=1; in2=0; in3=0; #1000
    $display("%b     %b    | %b   %b   %b   %b   | %b               | %b ", addr1, addr0, in0, in1, in2, in3, in1, out);
    addr1=1;addr0=0;in0=0; in1=0; in2=1; in3=0; #1000
    $display("%b     %b    | %b   %b   %b   %b   | %b               | %b ", addr1, addr0, in0, in1, in2, in3, in2, out);
    addr1=1;addr0=1;in0=0; in1=0; in2=0; in3=1; #1000
    $display("%b     %b    | %b   %b   %b   %b   | %b               | %b ", addr1, addr0, in0, in1, in2, in3, in3, out);

    // $display(""); 
    // addr1=0;addr0=0;in0=0; in1=1'bX; in2=1'bX; in3=1'bX; #1000
    // $display("%b     %b    | %b   %b   %b   %b   | %b               | %b ", addr1, addr0, in0, in1, in2, in3, in0, out);
    // addr1=0;addr0=1;in0=1'bX; in1=0; in2=1'bX; in3=1'bX; #1000
    // $display("%b     %b    | %b   %b   %b   %b   | %b               | %b ", addr1, addr0, in0, in1, in2, in3, in1, out);
    // addr1=1;addr0=0;in0=1'bX; in1=1'bX; in2=0; in3=1'bX; #1000
    // $display("%b     %b    | %b   %b   %b   %b   | %b               | %b ", addr1, addr0, in0, in1, in2, in3, in2, out);
    // addr1=1;addr0=1;in0=1'bX; in1=1'bX; in2=1'bX; in3=0; #1000
    // $display("%b     %b    | %b   %b   %b   %b   | %b               | %b ", addr1, addr0, in0, in1, in2, in3, in3, out);
    

    // $display("");
    // addr1=0;addr0=0;in0=1; in1=1'bX; in2=1'bX; in3=1'bX; #1000
    // $display("%b     %b    | %b   %b   %b   %b   | %b               | %b ", addr1, addr0, in0, in1, in2, in3, in0, out);
    // addr1=0;addr0=1;in0=1'bX; in1=1; in2=1'bX; in3=1'bX; #1000
    // $display("%b     %b    | %b   %b   %b   %b   | %b               | %b ", addr1, addr0, in0, in1, in2, in3, in1, out);
    // addr1=1;addr0=0;in0=1'bX; in1=1'bX; in2=1; in3=1'bX; #1000
    // $display("%b     %b    | %b   %b   %b   %b   | %b               | %b ", addr1, addr0, in0, in1, in2, in3, in2, out);
    // addr1=1;addr0=1;in0=1'bX; in1=1'bX; in2=1'bX; in3=1; #1000
    // $display("%b     %b    | %b   %b   %b   %b   | %b               | %b ", addr1, addr0, in0, in1, in2, in3, in3, out);

end
  
endmodule
