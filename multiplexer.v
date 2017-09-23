// Multiplexer circuit
`define AND and #50
`define NOT not #50
`define OR or #50

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
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    wire nA0, nA1;
    wire out0, out1, out2, out3;
    `NOT notA0(nA0, address0);
    `NOT notA1(nA1, address1);
    `AND outzero(out0, nA1, nA0, in0);
    `AND outone(out1, nA1, address0, in1);
    `AND outtwo(out2, address1, nA0, in2);
    `AND outthree(out3, address1, address0, in3);
    `OR outfinal(out, out0, out1, out2, out3);

endmodule

