// Adder circuit

`define AND and #50
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
    wire cout1;
    wire cout2;
    wire sumAB;

    xor AxorB(sumAB, a, b);
    xor sumABxorCin(sum, sumAB, carryin);

    and AandB(cout1, a, b);
    and sumABandCin(cout2, sumAB, carryin);

    or orcarries(carryout, cout1, cout2);
endmodule
