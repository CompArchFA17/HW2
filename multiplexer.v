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
    input addr0, addr1,
    input in0, in1, in2, in3
);
    // Your multiplexer code here
not notaddr0(naddr0, addr0);
not notaddr1(naddr1, addr1);

and getin0(in0, naddr1, naddr0);
and getin1(in1, naddr1, addr0);
and getin2(in2, addr1, naddr0);
and getin3(in3, addr1, addr0);

// getting the nin0 nin1, nin2, and nin3 values just in case
not getnin0(nin0, in0);
not getnin1(nin1, in1);
not getnin2(nin2, in2);
not getnin3(nin3, in3);

// getting values to pass into output orgate
and geto1(and1, in0, in1);
and geto2(and2, in2, in3);





// Still unsure about how to get out value. and -> the 1s become Xs. or -> 0s
// become Xs


endmodule

