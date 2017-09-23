// Decoder circuit
`define AND and #50
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
wire nA0, nA1;
`NOT notA0(nA0, address0);
`NOT notA1(nA1, address1);
`AND outzero(out0, nA1, nA0, enable);
`AND outzero(out1, nA1, address0, enable);
`AND outzero(out2, address1, nA0, enable);
`AND outzero(out3, address1, address0, enable);

endmodule

