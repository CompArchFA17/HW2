`define AND and #50
`define NOT not #50

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

	wire nA;
	wire nB;
	
	`NOT (nA, address0);
	`NOT (nB, address1);
	`AND (out0, nA, nB, enable);
	`AND (out1, address0, nB, enable);
	`AND (out2, nA, address1, enable);
	`AND (out3, address0, address1, enable);

endmodule

