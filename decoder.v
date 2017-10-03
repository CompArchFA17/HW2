// Decoder circuit

module behavioralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
    // Uses concatenation and shift operators
    assign {out3,out2,out1,out0}=enable<<{address1,address0};
endmodule


module oneBitDecoder(
  output out0, out1,
  input address,
  input enable
);
wire _address;
`NOT nAd(_address, address);
`AND o0(out0, _address, enable);
`AND o1(out1,  address, enable);
endmodule //#100

module structuralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
    wire w0,w1;
    oneBitDecoder d1(w0,w1,address1,enable); //#100
    oneBitDecoder d2(out0, out1, address0, w0); //#200
    oneBitDecoder d3(out2, out3, address0, w1); //#200
endmodule
