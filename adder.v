// Adder circuit
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
    //wire axorb;
    wire ab;
    //`XOR aXORb(axorb, a, b);
    `AND aANDb(ab, a, b);
    //wire axorbc;
    //`AND aXORbc(axorbc, axorb, carryin);
    //`XOR aXORbXORc(sum, axorb, carryin);
    //`OR abORaXORbc(carryout, ab, axorbc);
    wire bc;
    wire ac;
    `AND bANDc(bc, b, carryin);
    `AND aANDc(ac, a, carryin);

    `OR cout(carryout, ab, bc, ac);
    `XOR sumout(sum, a, b, carryin);
    
endmodule
