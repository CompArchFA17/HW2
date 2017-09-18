// Adder circuit

// define gates with delays
`define XOR xor #50
`define AND and #50
`define OR or #50
`define NOT not #50

module structuralFullAdder
(
    output sum,
    output carryout,
    input a,
    input b,
    input carryin
);
    wire aandb, aorb;
    wire s, _carryin;
    wire outputIfCarryin, outputIf_Carryin;
    `XOR(s, a, b);
    `XOR(sum, s, carryin);
    `AND(aandb, a, b);
    `OR(aorb, a, b);
    `NOT(_carryin, carryin);
    `AND(outputIfCarryin, aandb, _carryin);
    `AND(outputIf_Carryin, aorb, carryin);
    `OR(carryout, outputIfCarryin, outputIf_Carryin);
endmodule
