// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder();
    reg a, b, carryin;
    wire sum, carryout;
	wire structsum, AxorB, AandB, CAxorB, Cout;

	behavioralFullAdder adder (sum, carryout, a, b, carryin);

	structuralFullAdder structural(a, b, carryin, structsum, Cout);

    initial begin

	$dumpfile("adder.vcd");
	$dumpvars();

	$display("Behavioral Full Adder");
    $display("A B CarryIn| Sum CarryOut | ExpectedSum ExpectedCarryOut");
    a=0; b = 0; carryin = 0; #1000 
    $display("%b  %b  %b | %b  %b  | 0 0", a, b, carryin, sum, carryout);
    a=0; b = 0; carryin = 1; #1000 
    $display("%b  %b  %b | %b  %b  | 1 0", a, b, carryin, sum, carryout);
    a=0; b = 1; carryin = 0; #1000 
    $display("%b  %b  %b | %b  %b  | 1 0", a, b, carryin, sum, carryout);
    a=0; b = 1; carryin = 1; #1000 
    $display("%b  %b  %b | %b  %b  | 0 1", a, b, carryin, sum, carryout);
    a=1; b = 0; carryin = 0; #1000 
    $display("%b  %b  %b | %b  %b  | 1 0", a, b, carryin, sum, carryout);
    a=1; b = 0; carryin = 1; #1000 
    $display("%b  %b  %b | %b  %b  | 0 1", a, b, carryin, sum, carryout);
    a=1; b = 1; carryin = 0; #1000 
    $display("%b  %b  %b | %b  %b  | 0 1", a, b, carryin, sum, carryout);
    a=1; b = 1; carryin = 1; #1000 
    $display("%b  %b  %b | %b  %b  | 1 1", a, b, carryin, sum, carryout);

	$display("Structural Full Adder");
    $display("A B CarryIn| Sum CarryOut | ExpectedSum ExpectedCarryOut");
    a=0; b = 0; carryin = 0; #1000 
    $display("%b  %b  %b | %b  %b  | 0 0", a, b, carryin, structsum, Cout);
    a=0; b = 0; carryin = 1; #1000 
    $display("%b  %b  %b | %b  %b  | 1 0", a, b, carryin, structsum, Cout);
    a=0; b = 1; carryin = 0; #1000 
    $display("%b  %b  %b | %b  %b  | 1 0", a, b, carryin, structsum, Cout);
    a=0; b = 1; carryin = 1; #1000 
    $display("%b  %b  %b | %b  %b  | 0 1", a, b, carryin, structsum, Cout);
    a=1; b = 0; carryin = 0; #1000 
    $display("%b  %b  %b | %b  %b  | 1 0", a, b, carryin, structsum, Cout);
    a=1; b = 0; carryin = 1; #1000 
    $display("%b  %b  %b | %b  %b  | 0 1", a, b, carryin, structsum, Cout);
    a=1; b = 1; carryin = 0; #1000 
    $display("%b  %b  %b | %b  %b  | 0 1", a, b, carryin, structsum, Cout);
    a=1; b = 1; carryin = 1; #1000 
    $display("%b  %b  %b | %b  %b  | 1 1", a, b, carryin, structsum, Cout);

    end
endmodule
