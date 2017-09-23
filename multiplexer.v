`define AND and #50
`define OR or #50
`define NOT not #50

// Multiplexer circuit

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

	wire nA;
	wire nB;
	wire nAandnBandin0;
	wire AandnBandin1;
	wire nAandBandin2;
	wire AandBandin3;
	
	`NOT (nA, address0);
	`NOT (nB, address1);
	`AND (nAandnBandin0, nA, nB, in0);
	`AND (AandnBandin1, address0, nB, in1);
	`AND (nAandBandin2, nA, address1, in2);
	`AND (AandBandin3, address0, address1, in3);
	`OR (out, nAandnBandin0, AandnBandin1, nAandBandin2, AandBandin3);

endmodule