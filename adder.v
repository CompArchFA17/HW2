// define gates with delays
`define AND and #50
`define OR or #50
`define XOR xor #50


// Adder circuit

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
    wire axorb, axorb_Cin, ab;

    `XOR abxorgate (axorb, a, b);
    `XOR sumxorgate (sum, carryin, axorb);
    `AND abandgate (ab, a, b);
    `AND axorbCinandgate (axorb_Cin, axorb, carryin);
    `OR Coutorgate (carryout, ab, axorb_Cin);
endmodule
