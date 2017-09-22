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
   wire   A0_;
   wire   A1_;
   wire   en0;
   wire   en1;
   wire   en2;
   wire   en3;
   wire   out0;
   wire   out1;
   wire   out2;
   wire   out3;
   wire   out01;
   wire   out23;
   
   
   

   `NOT nA0(A0_, address0);
   `NOT nA1(A1_, address1);
   `AND E00(en0, A0_, A1_);
   `AND E01(en1, address0, A1_);
   `AND E02(en2, A0_, address1);
   `AND E03(en3, address0, address1);
   `AND O0(out0, in0, en0);
   `AND O1(out1, in1, en1);
   `AND O2(out2, in2, en2);
   `AND O3(out3, in3, en3);
   `OR O01(out01, out0, out1);
   `OR O23(out23, out2, out3);
   `OR O0123(out, out01, out23);
   

endmodule

