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

wire naddress0;
wire naddress1;
wire d0;
wire d1;
wire d2;
wire d3;

`NOT(naddress0,address0);
`NOT(naddress1,address1);
`AND(d0,in0,naddress0,naddress1);
`AND(d1,in1,address0,naddress1);
`AND(d2,in2,naddress0,address1);
`AND(d3,in3,address0,address1);
`OR(out,d0,d1,d2,d3);


endmodule

