// Decoder circuit
`define AND and #50
`define OR or #50
`define NOT not #50
`define NAND nand #50
`define NOR nor #50
`define XOR xor #50
module behavioralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
    // Uses concatenation and shift operators
    assign {out3,out2,out1,out0}=enable<<{address1,address0};
endmodule


module structuralDecoder
(
    output out0, out1, out2, out3,
    input in0, in1,
    input enable
);
  wire in0, in1;
  `NOT Nin0(nin0, in0);
  `NOT Nin1(nin1, in1);
  `AND preo0(preout0, nin0, nin1);
  `AND preo1(preout1, nin1, in0);
  `AND preo2(preout2, nin0, in1);
  `AND preo3(preout3, in0, in1);
  `AND o0(out0, preout0, enable);
  `AND o1(out1, preout1, enable);
  `AND o2(out2, preout2, enable);
  `AND o3(out3, preout3, enable);
endmodule
