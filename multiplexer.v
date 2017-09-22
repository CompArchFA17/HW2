// Multiplexer circuit
`define AND and #50
`define OR or #50
`define NOT not #50
`define NAND nand #50
`define NOR nor #50
`define XOR xor #50

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

module bitMultiplexer
(
    output out,
    input addr,
    input in0, in1
);
    wire naddr;
    `NOT n_addr(naddr, addr);
    `AND and_0(o0, in0, naddr);
    `AND and_1(o1, in1, addr);
    `OR or_out(out, o0, o1);
endmodule

module structuralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    wire mux0, mux1;
    bitMultiplexer mux_0(mux0, address0, in0, in1);
    bitMultiplexer mux_1(mux1, address0, in2, in3);
    bitMultiplexer mux_out(out, address1, mux0, mux1);
endmodule
