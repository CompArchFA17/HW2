// Decoder circuit
`define AND and #50
`define OR or #50
`define NOT not #50

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
    // Your decoder code here
    wire wire0;
    wire wire1;
    wire wire2;
    wire wire3;
    wire nA0;
    wire nA1;
    `NOT invA0(nA0, address0);
    `NOT invA1(nA1, address1);
    `AND and0(wire0, nA0, nA1);
    `AND and1(wire1, address0, nA1);
    `AND and2(wire2, nA0, address1);
    `AND and3(wire3, address0, address1);
    `AND enableAnd0(out0, enable, wire0);
    `AND enableAnd1(out1, enable, wire1);
    `AND enableAnd2(out2, enable, wire2);
    `AND enableAnd3(out3, enable, wire3);
endmodule

