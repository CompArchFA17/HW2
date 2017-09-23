// Multiplexer circuit
`define NAND nand #50
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
    wire nA0, nA1;
    wire out0, out1, out2, out3;
    `NOT A0inv(nA0, address0); 
    `NOT A1inv(nA1, address1);
    `NAND AG0(out0, nA0, nA1, in0);
    `NAND AG1(out1, address0, nA1, in1);
    `NAND AG2(out2, address1, nA0, in2);
    `NAND AG3(out3, address0, address1, in3);
    `NAND AGT(out, out0, out1, out2, out3);

endmodule

