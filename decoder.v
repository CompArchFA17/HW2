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
    input A, B,
    input enable
);
	wire nA;
	wire nB;
	wire AB;
	wire nAB;
	wire AnB;
	wire nAnB;
    not aInv(nA, A);
    not bInv(nB, B);
    and a1(nAnB, nA, nB);
    and a2(AnB, A, nB);
    and a3(nAB, nA, B);
    and a4(AB, A, B);
    and o1(out0, enable, nAnB);
    and o2(out1, enable, AnB);
    and o3(out2, enable, nAB);
    and o4(out3, enable, AB);
endmodule