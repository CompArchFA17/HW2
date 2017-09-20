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
    wire axorb, axorb_andcarryin, aandb;

    `XOR xorab (axorb, a, b);
    `XOR xorsumout (sum, carryin, axorb);
    `AND andab (aandb, a, b);
    `AND andaxorbcarryin (axorb_andcarryin, axorb, carryin);
    `OR orcarryout (carryout, aandb, axorb_andcarryin);

endmodule
