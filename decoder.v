// Decoder circuit

`define AND and #50
`define OR or #50
`define NOT not #50
`define NAND nand #50
`define NOR nor #50
`define XOR xor #50

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
    wire A, B, _address0, _address1;

    `NOT add0inv(_address0, address0);
    `NOT add1inv(_address1, address1);

    `AND add1low(A, enable, _address1);
    `AND add1high(B, enable, address1);

    `AND add0lowlow(out0, A, _address0);
    `AND add0lowhigh(out1, A, address0);
    `AND add0highlow(out2, B, _address0);
    `AND add0highhigh(out3, B, address0);
endmodule
