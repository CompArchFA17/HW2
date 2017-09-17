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
    input address0, address1,
    input enable
);
    wire naddress0;
    wire naddress1;
    wire pos0;
    wire pos1;
    wire pos2;
    wire pos3;
    not invaddress0(naddress0, address0);
    not invaddress1(naddress1, address1);
    and #50 (pos0, naddress0, naddress1);
    and #50 (pos1, address0, naddress1);
    and #50 (pos2, naddress0, address1);
    and #50 (pos3, address0, address1);
    and #50 (out0, pos0, enable);
    and #50 (out1, pos1, enable);
    and #50 (out2, pos2, enable);
    and #50 (out3, pos3, enable);
endmodule

