// Multiplexer circuit

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
    wire nA0;
    wire nA1;

    wire isenabled0;
    wire isenabled1;
    wire isenabled2;
    wire isenabled3;

    wire enablein0;
    wire enablein1;
    wire enablein2;
    wire enablein3;

    wire out01;
    wire out23;

    `NOT A0inv(nA0, address0);
    `NOT A1inv(nA1, address1);

    `AND nA0andnA1(isenabled0, nA0, nA1);
    `AND A0andnA1(isenabled1, address0, nA1);
    `AND nA0andA1(isenabled2, nA0, address1);
    `AND A0andA1(isenabled3, address0, address1);

    `AND choose0(enablein0, isenabled0, in0);
    `AND choose1(enablein1, isenabled1, in1);
    `AND choose2(enablein2, isenabled2, in2);
    `AND choose3(enablein3, isenabled3, in3);

    `OR in0orin1(out01, enablein0, enablein1);
    `OR in2orin3(out23, enablein2, enablein3);
    `OR finalout(out, out01, out23);
endmodule

