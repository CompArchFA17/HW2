// Multiplexer circuit
`define AND and #50
`define OR  or #50
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
    // Your multiplexer code here
    wire notAddr0;
    wire notAddr1;
    wire andAddr0;
    wire andAddr1;
    wire andAddr2;
    wire andAddr3;

    wire postIn0;
    wire postIn1;
    wire postIn2;
    wire postIn3;
    wire preOut0;
    wire preOut1;

    `NOT not_addr0(notAddr0, address0);
    `NOT not_addr1(notAddr1, address1);
    `AND addr_andgate0(andAddr0, notAddr0, notAddr1);
    `AND addr_andgate1(andAddr2, notAddr0, address1);
    `AND addr_andgate2(andAddr1, address0, notAddr1);
    `AND addr_andgate3(andAddr3, address0, address1);
    `AND in0_andgate(postIn0, in0, andAddr0);
    `AND in1_andgate(postIn1, in1, andAddr1);
    `AND in2_andgate(postIn2, in2, andAddr2);
    `AND in3_andgate(postIn3, in3, andAddr3);
    `OR  orgate1(preOut0, postIn0, postIn1);
    `OR  orgate2(preOut1, postIn2, postIn3);
    `OR  orgate3(out, preOut0, preOut1);

endmodule

