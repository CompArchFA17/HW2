// Multiplexer circuit

// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50

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
    wire n0, n1;
    wire sel0, sel1, sel2, sel3;
    wire out0, out1, out2, out3;
    wire out01, out23;

    `NOT n0gate (n0, address0);
    `NOT n1gate (n1, address1);

    `AND sel0gate (sel0, n0, n1);
    `AND sel1gate (sel1, address0, n1);
    `AND sel2gate (sel2, n0, address1);
    `AND sel3gate (sel3, address0, address1);

    `AND out0gate (out0, sel0, in0);
    `AND out1gate (out1, sel1, in1);
    `AND out2gate (out2, sel2, in2);
    `AND out3gate (out3, sel3, in3);

    `OR out01gate (out01, out0, out1);
    `OR out23gate (out23, out2, out3);
    `OR outgate (out, out01, out23);

endmodule

