// Multiplexer circuit

// define gates with delays
`define AND and #100
`define OR or #100
`define NOT not #100

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
    // First, set the selectors and their inverses
    wire _address0, _address1;
    `NOT invA0(_address0, address0);
    `NOT invA1(_address1, address1);

    // Next, disregard half the inputs with address1
    wire MI0, MI1, MI2, MI3;
    `AND maybeI0(MI0, _address1, in0);
    `AND maybeI1(MI1, address1, in1);
    `AND maybeI2(MI2, _address1, in2);
    `AND maybeI3(MI3, address1, in3);

    // I0+I1, I2+I3
    wire I01, I23;
    `OR i0or1(I01, MI0, MI1);
    `OR i2or3(I23, MI2, MI3);

    // Next selector
    wire M01, M23;
    `AND maybe01(M01, _address0, I01);
    `AND maybe23(M23, address0, I23);

    // Finally, OR them together for the result
    `OR eithertrue(out, M01, M23);

endmodule

