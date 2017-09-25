// define gates with delays

`define AND and #50
`define OR or #50
`define NOT not #50
`define NAND nand #50
`define NOR nor #50
`define XOR xor #50

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

//Getting the output:
or getoutput(out, in0, in1, in2, in3);


endmodule

