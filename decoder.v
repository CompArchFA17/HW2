// Decoder circuit
//define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50
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
    input address0, address1,
    input enable
);
   wire   A0_;
   wire   A1_;
   wire   en0;
   wire   en1;
   wire   en2;
   wire   en3;
   

   `NOT nA0(A0_, address0);
   `NOT nA1(A1_, address1);
   `AND E00(en0, A0_, A1_);
   `AND E01(en1, address0, A1_);
   `AND E02(en2, A0_, address1);
   `AND E03(en3, address0, address1);
   `AND O0(out0, enable, en0);
   `AND O1(out1, enable, en1);
   `AND O2(out2, enable, en2);
   `AND O3(out3, enable, en3);   
   
endmodule

