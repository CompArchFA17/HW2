// Multiplexer circuit

module behavioralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    // Join single-bit inputs into a bus, use address as index
    wire[3:0] inputs = {in3, in2, in1, in0};
    wire[1:0] address = {address1, address0};
    assign out = inputs[address];
endmodule


module structuralMultiplexer
(
    input in0, in1, in2, in3,
    input A, B,
    output out
);
    wire nA;
    wire nB;
    wire AB;
    wire nAB;
    wire AnB;
    wire nAnB;
    wire or1;
    wire or2;
    wire o0, o1, o2, o3;
    not(nA, A);
    not(nB, B);
    and(nAnB, nA, nB);
    and(AnB, A, nB);
    and(nAB, nA, B);
    and(AB, A, B);
    and(o0, in0, nAnB);
    and(o1, in1, AnB);
    and(o2, in2, nAB);
    and(o3, in3, AB);

    or(or1, o0, o1);
    or(or2, o2, o3);
    or(out, or1, or2);

endmodule

