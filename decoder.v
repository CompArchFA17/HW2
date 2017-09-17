// Decoder circuit
`define AND and #50
`define OR or #50
`define NOT not #50
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
    input A, B,
    input enable
);
	wire nA;
	wire nB;
	wire AB;
	wire nAB;
	wire AnB;
	wire nAnB;
    `NOT(nA, A);
    `NOT(nB, B);
    `AND(nAnB, nA, nB);
    `AND(AnB, A, nB);
    `AND(nAB, nA, B);
    `AND(AB, A, B);
    `AND(out0, enable, nAnB);
    `AND(out1, enable, AnB);
    `AND(out2, enable, nAB);
    `AND(out3, enable, AB);
endmodule