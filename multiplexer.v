// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50

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
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    wire nadd0, nadd1, en0, en1, en2, en3, selen0, selen1, selen2, selen3, out0, out1;

    `NOT add0inv (nadd0, address0);
    `NOT add1inv (nadd1, address1);

    `AND nadd0nadd1 (en0, nadd0, nadd1);
    `AND add0nadd1 (en1, address0, nadd1);
    `AND nadd0add1 (en2, nadd0, address1);
    `AND add0nadd1 (en3, address0, address1);

    `AND selector0 (selen0, en0, in0);
    `AND selector1 (selen1, en1, in1);
    `AND selector3 (selen2, en2, in2);
    `AND selector4 (selen3, en3, in3);

    `OR in0orin1 (out0, selen1, selen2);
    `OR in2orin3 (out1, selen0, selen3);

    `OR out (out, out0, out1);
endmodule
