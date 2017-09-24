`include "hw2.v"

module fourtoonemux_test ();

  // Instantiate device/module under test
  reg A, B, C, D, Pick0, Pick1;                // Primary test inputs
  wire Out;    // Test outputs

  fourtoonemux mux(.A (A),.B (B),.C (C),.D (D),.Pick0 (Pick0),.Pick1 (Pick1),.Out (Out));  // Module to be tested


  // Run sequence of test stimuli
  initial begin
    $display("A B C D Pick0 Pick1 | Out ");            // Prints header for truth table
    A=0;B=0;C=0;D=0;Pick0=0;Pick1=0; #1000                                 // Set A and B, wait for update (#1)
    $display("%b %b %b %b %b %b | %b", A,B,C,D,Pick0,Pick1,Out);
    A=1;B=0;C=0;D=0;Pick0=0;Pick1=0; #1000                                 // Set A and B, wait for update (#1)
    $display("%b %b %b %b %b %b | %b", A,B,C,D,Pick0,Pick1,Out);
    A=0;B=0;C=0;D=0;Pick0=0;Pick1=0; #1000                                 // Set A and B, wait for update (#1)
    $display("%b %b %b %b %b %b | %b", A,B,C,D,Pick0,Pick1,Out);
    A=0;B=0;C=0;D=0;Pick0=1;Pick1=0; #1000                                 // Set A and B, wait for update (#1)
    $display("%b %b %b %b %b %b | %b", A,B,C,D,Pick0,Pick1,Out);
    A=0;B=1;C=0;D=0;Pick0=1;Pick1=0; #1000                                 // Set A and B, wait for update (#1)
    $display("%b %b %b %b %b %b | %b", A,B,C,D,Pick0,Pick1,Out);
    A=0;B=1;C=0;D=0;Pick0=1;Pick1=0; #1000                                 // Set A and B, wait for update (#1)
    $display("%b %b %b %b %b %b | %b", A,B,C,D,Pick0,Pick1,Out);
    A=0;B=1;C=1;D=0;Pick0=1;Pick1=0; #1000                                 // Set A and B, wait for update (#1)
    $display("%b %b %b %b %b %b | %b", A,B,C,D,Pick0,Pick1,Out);
    A=0;B=1;C=1;D=0;Pick0=1;Pick1=1; #1000                                 // Set A and B, wait for update (#1)
    $display("%b %b %b %b %b %b | %b", A,B,C,D,Pick0,Pick1,Out);
    A=0;B=1;C=1;D=1;Pick0=1;Pick1=1; #1000                                 // Set A and B, wait for update (#1)
    $display("%b %b %b %b %b %b | %b", A,B,C,D,Pick0,Pick1,Out);
  end
endmodule    // End demorgan_test

module fulladder_test ();

  reg A,B,Cin;
  wire O,Cout;

  fulladder adder(.A (A),.B (B),.Cin (Cin),.O (O), .Cout (Cout));

  initial begin
    $display("A B Cin | O Cout");
    A=0;B=0;Cin=0; #1000
    $display("%b %b %b | %b %b", A,B,Cin,O,Cout);
    A=0;B=0;Cin=1; #1000
    $display("%b %b %b | %b %b", A,B,Cin,O,Cout);
    A=0;B=1;Cin=0; #1000
    $display("%b %b %b | %b %b", A,B,Cin,O,Cout);
    A=0;B=1;Cin=1; #1000
    $display("%b %b %b | %b %b", A,B,Cin,O,Cout);
    A=1;B=0;Cin=0; #1000
    $display("%b %b %b | %b %b", A,B,Cin,O,Cout);
    A=1;B=0;Cin=1; #1000
    $display("%b %b %b | %b %b", A,B,Cin,O,Cout);
    A=1;B=1;Cin=0; #1000
    $display("%b %b %b | %b %b", A,B,Cin,O,Cout);
    A=1;B=1;Cin=1; #1000
    $display("%b %b %b | %b %b", A,B,Cin,O,Cout);
  end
endmodule

module decoder_test ();

  reg A,B,En;
  wire O0,O1,O2,O3;

  decoder twoindecoder(.A (A),.B (B),.En (En),.O0 (O0),.O1 (O1),.O2 (O2),.O3 (O3));

  initial begin
    $display("A B En | Out3 Out2 Out1 Out0");
    A=0;B=0;En=0; #1000
    $display("%b %b %b | %b %b %b %b", A,B,En,O3,O2,O1,O0);
    A=0;B=0;En=1; #1000
    $display("%b %b %b | %b %b %b %b", A,B,En,O3,O2,O1,O0);
    A=0;B=1;En=0; #1000
    $display("%b %b %b | %b %b %b %b", A,B,En,O3,O2,O1,O0);
    A=0;B=1;En=1; #1000
    $display("%b %b %b | %b %b %b %b", A,B,En,O3,O2,O1,O0);
    A=1;B=0;En=0; #1000
    $display("%b %b %b | %b %b %b %b", A,B,En,O3,O2,O1,O0);
    A=1;B=0;En=1; #1000
    $display("%b %b %b | %b %b %b %b", A,B,En,O3,O2,O1,O0);
    A=1;B=1;En=0; #1000
    $display("%b %b %b | %b %b %b %b", A,B,En,O3,O2,O1,O0);
    A=1;B=1;En=1; #1000
    $display("%b %b %b | %b %b %b %b", A,B,En,O3,O2,O1,O0);
  end
endmodule