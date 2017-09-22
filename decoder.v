// Decoder circuit
`define AND and #50
`define OR or #50
`define NOT not #50
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
    output Sout0, Sout1, Sout2, Sout3,
    input address0, address1,
    input enable
);
    // Your decoder code here
	wire naddress0;
	wire naddress1;
	wire nA0nA1;
	wire A0nA1;
	wire nA0A1;
	wire A0A1;

	`NOT A0inv(naddress0, address0);
	`NOT A1inv(naddress1, address1);
	`AND andgate1(nA0nA1, naddress0, naddress1);
	`AND andgate2(Sout0, enable, nA0nA1);

	`AND andgate3(A0nA1, address0, naddress1);
	`AND andgate4(Sout1, enable, A0nA1);

	`AND andgate5(nA0A1, naddress0, address1);
	`AND andgate6(Sout2, enable, nA0A1);

	`AND andgate7(A0A1, address0, address1);
	`AND andgate8(Sout3, enable, A0A1);

endmodule
