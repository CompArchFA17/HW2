// Decoder circuit

// define gates with delays
`define AND and #100
`define OR or #100
`define NOT not #100

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
	wire _0, _1;
	`NOT inv0(_0, address0);
	`NOT inv1(_1, address1);
	wire choose0, choose1, choose2, choose3;
	`AND _0AND_1(choose0, _0, _1);
	`AND a0AND_1(choose1, address0, _1);
	`AND _0ANDa1(choose2, _0, address1);
	`AND a0ANDa1(choose3, address0, address1);
    `AND ifEnable0(out0, enable, choose0);
    `AND ifEnable1(out1, enable, choose1);
    `AND ifEnable2(out2, enable, choose2);
    `AND ifEnable3(out3, enable, choose3);
endmodule

