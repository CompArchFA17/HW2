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

module oneBitMux(
  output out,
  input address,
  input in0, in1
);
  wire _address, w0, w1;
  `NOT nAd(_address, address);
  `AND a1(w0, in0, _address);
  `AND a2(w1, in1, address);
  `OR   o(out, w0, w1);
endmodule

module structuralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    wire w0, w1;
    oneBitMux m1(w0, address0, in0, in1);
    oneBitMux m2(w1, address0, in2, in3);
    oneBitMux m3(out, address1, w0, w1);
endmodule
