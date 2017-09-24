// define gates with delays
`define AND and #50
`define NOT not #50

// Decoder circuit

module behavioralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
    // Uses concatenation and shift operators
    assign {out3,out2,out1,out0}=enable<<{address1,address0};
endmodule


module structuralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
    wire nadd0, nadd1, add0add1, nadd0nadd1, nadd0add1, add0nadd1;

    `NOT add0inv (nadd0, address0);
    `NOT add1inv (nadd1, address1);

    `AND nadd0nadd1andgate (nadd0nadd1, nadd0, nadd1);
    `AND add0nadd1andgate (add0nadd1, address0, nadd1);
    `AND nadd0add1andgate (nadd0add1, nadd0, address1);
    `AND add0add1andgate (add0add1, address0, address1);

    `AND Eadd0add1andgate (out0, nadd0nadd1, enable);
    `AND Enadd0nadd1andgate (out1, add0nadd1, enable);
    `AND Enadd0add1andgate (out2, nadd0add1, enable);
    `AND Eadd0nadd1andgate (out3, add0add1, enable);
endmodule
