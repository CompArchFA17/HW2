// Decoder circuit

// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50

module structuralDecoder
(
    output o0, o1, o2, o3,
    input a0, a1,
    input enable
);
    wire _a0, _a1;
    wire p0, p1, p2, p3;
    `NOT(_a0, a0);
    `NOT(_a1, a1);
    `AND(p0, _a0, _a1);
    `AND(p1, a0, _a1);
    `AND(p2, _a0, a1);
    `AND(p3, a0, a1);
    `AND(o0, p0, enable);
    `AND(o1, p1, enable);
    `AND(o2, p2, enable);
    `AND(o3, p3, enable);

endmodule
