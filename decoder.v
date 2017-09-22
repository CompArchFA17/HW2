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


module structuralDecoder
(
    output out0, out1, out2, out3,
    input A0, A1,
    input Enable
);

// Your decoder code here
not A0inv(nA0, A0);
not A1inv(nA1, A1);
and andnA0nA1(nA0andnA1, nA0, nA1);   // and nA0 and nA1
and andA0andnA1(A0andnA1, A0, nA1);   // and A0 and nA1
and andnA0andA1(nA0andA1, nA0, A1);   // and nA0 and A1
and andA0andA1(A0andA1, A0, A1);      // and A0 and A1

and getout0(out0, Enable, nA0andnA1); // out0 obtained from nA0andnA1
and getout1(out1, Enable, A0andnA1);  // out1 obtained from A0andnA1
and getout2(out2, Enable, nA0andA1);  // out2 obtained from nA0andA1
and getout3(out3, Enable, A0andA1);   // out3 obtained from A0andA1

endmodule

