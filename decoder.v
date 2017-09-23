// Decoder circuit
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
	wire nA0, nA1;
	`NOT A0inv(nA0, address0); 
	`NOT A1inv(nA1, address1);
	`AND AG0(out0, enable, nA0, nA1);
	`AND AG1(out1, enable, address0, nA1);
	`AND AG2(out2, enable, nA0, address1);
	`AND AG3(out3, enable, address0, address1);
endmodule

