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
    wire AxorB;
    wire CAxorB;
    wire AB;
    `XOR(AxorB, a, b);
    `XOR(sum, AxorB, carryin);
    `AND(AB, a, b);
    `AND(CAxorB, carryin, AxorB);
    `OR(carryout, AB, CAxorB);

endmodule
