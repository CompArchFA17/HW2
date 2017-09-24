// Decoder circuit

// define gates with delays
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
    wire n0, n1;
    wire use0, use1, use2, use3;

    `NOT n0gate (n0, address0);
    `NOT n1gate (n1, address1);

    `AND use0gate (use0, n0, n1);
    `AND use1gate (use1, address0, n1);
    `AND use2gate (use2, n0, address1);
    `AND use3gate (use3, address0, address1);

    `AND out0gate (out0, enable, use0);
    `AND out1gate (out1, enable, use1);
    `AND out2gate (out2, enable, use2);
    `AND out3gate (out3, enable, use3);

endmodule

