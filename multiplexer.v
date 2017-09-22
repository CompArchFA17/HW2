// Multiplexer circuit

`define NOT not #50
`define AND and #50
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
    wire A, B, _address0, _address1, in0sel, in1sel, in2sel, in3sel, Aout, Bout, A1lowout, A1highout;

    `NOT add0inv(_address0, address0);
    `NOT add1inv(_address1, address1);

    `AND in0sel (in0sel, in0, _address0);
    `AND in1sel (in1sel, in1, address0);
    `AND in2sel (in2sel, in2, _address0);
    `AND in3sel (in3sel, in3, address0);

    `OR A (Aout, in0sel, in1sel);
    `OR B (Bout, in2sel, in3sel);

    `AND A1low(A1lowout, Aout, _address1);
    `AND A1high(A1highout, Bout, address1);

    `OR out (out, A1lowout, A1highout);
endmodule
