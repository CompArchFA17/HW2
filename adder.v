// Adder circuit
`define AND and #50
`define OR or #50
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
    wire XORout, ANDout1, ANDout2;
    `XOR XOR1(XORout, a, b);
    `XOR XOR2(sum, XORout, carryin);
    `AND AND1(ANDout1, XORout, carryin);
    `AND AND2(ANDout2, a, b);
    `OR ORgate(carryout, ANDout1, ANDout2);
endmodule
