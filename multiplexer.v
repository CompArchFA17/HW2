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
    wire in0nadd0;
    wire in1add0;
    wire in2nadd0;
    wire in3add0;
    wire or0;
    wire or1;
    wire int0nadd1;
    wire int1add1;
    wire naddress0;
    wire naddress1;
    not #(50) invaddress0(naddress0, address0);
    not #(50) invaddress1(naddress1, address1);
    and #(50) andin0nadd0(in0nadd0, in0, naddress0);
    and #(50) andin1add0(in1add0, in1, address0);
    and #(50) andin2nadd0(in2nadd0, in2, naddress0);
    and #(50) andin3add0(in3add0, in3, address0);
    or #(50) ornadd1(or0, in0nadd0, in1add0);
    or #(50) oradd1(or1, in2nadd0, in3add0);
    and #(50) andint0nadd1(int0nadd1, or0, naddress1);
    and #(50) andint1add1(int1add1, or1, address1);
    or #(50) ans(out, int0nadd1, int1add1);
endmodule

