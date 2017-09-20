// Decoder circuit
// define gates with delays
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
    wire n0;
    wire n1;

    `NOT a0(n0, address0);
    `NOT a1(n1, address1);
    `AND n0n1(out0,n0,n1,enable);
    `AND a0n1(out1,address0,n1,enable);
    `AND n0a1(out2,n0,address1,enable);
    `AND a0a1(out3,address0,address1,enable);
endmodule

