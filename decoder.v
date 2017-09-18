// Decoder circuit

`define AND and #50
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
    
    wire nA0;
    wire nA1;
    wire nA0andnA1;
    wire A0andnA1;
    wire nA0andA1;
    wire A0andA1;

    `NOT A0inv(nA0, address0);
    `NOT A1inv(nA1, address1);

    `AND andgate00(nA0andnA1, nA0, nA1);
    `AND andgate01(A0andnA1, address0, nA1);
    `AND andgate02(nA0andA1, nA0, address1);
    `AND andgate03(A0andA1, address0, address1);

    `AND andgateout0(out0, enable, nA0andnA1);
    `AND andgateout1(out1, enable, A0andnA1);
    `AND andgateout2(out2, enable, nA0andA1);
    `AND andgateout3(out3, enable, A0andA1);

endmodule

