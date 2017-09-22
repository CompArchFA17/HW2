// Adder circuit
//define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50
module behavioralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    // Uses concatenation operator and built-in '+'
    assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
   wire   absum;
   wire   abcarry;
   wire   carrycarry;
   
   
   `XOR xorab(absum, a, b);
   `XOR xorsum(sum, absum, carryin);
   `AND andab(abcarry, a, b);
   `AND andcc(carrycarry, absum, carryin);
   `OR  orcarry(carryout, carrycarry, abcarry);
   
endmodule
