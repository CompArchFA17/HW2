// Adder circuit

// define gates with delays
`define AND and #50
`define OR or #50
`define XOR xor #50
`define NOT not #50

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

    wire ab;
    `XOR aXORb(ab, a, b);
    `XOR abXORc(sum, ab, carryin);

    wire aAndb, oneAndC;
    `AND aANDb(aAndb, a, b);
    `AND aXORbANDc(oneAndC, ab, carryin);
    `OR aorborc(carryout, aAndb, oneAndC);
    
endmodule
