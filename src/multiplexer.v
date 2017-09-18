// Multiplexer circuit

`include "decoder.v"

// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50

module structuralMultiplexer
(
    output out,
    input a0, a1,
    input in0, in1, in2, in3
);
    wire b0, b1, b2, b3;
    wire m0, m1, m2, m3;
    wire n0, n1;
    structuralDecoder decoder(b0, b1, b2, b3, a0, a1, 1);
    `AND(m0, b0, in0);
    `AND(m1, b1, in1);
    `AND(m2, b2, in2);
    `AND(m3, b3, in3);
    `OR(n0, m0, m1);
    `OR(n1, m2, m3);
    `OR(out, n0, n1);
endmodule
