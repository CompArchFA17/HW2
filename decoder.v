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
    // Your decoder code here
    wire notAddr0;
    wire notAddr1;
    wire preOut0;
    wire preOut1;
    wire preOut2;
    wire preOut3;

    not #50 not_addr0(notAddr0, address0);
    not #50 not_addr1(notAddr1, address1);
    and #50 addr_andgate3(preOut0, notAddr0, notAddr1);
    and #50 addr_andgate1(preOut1, address0, notAddr1);
    and #50 addr_andgate2(preOut2, notAddr0, address1);
    and #50 addr_andgate0(preOut3, address0, address1);
    and #50 out_andgate0(out0, enable, preOut0);
    and #50 out_andgate1(out1, enable, preOut1);
    and #50 out_andgate2(out2, enable, preOut2);
    and #50 out_andgate3(out3, enable, preOut3);

endmodule

