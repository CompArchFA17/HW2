// Multiplexer circuit
`define AND and #50
`define OR or #50
`define NOT not #50

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
    input address0, address1,
    input in0, in1, in2, in3,
    output structuralOut 
);
	wire naddress0;
	wire I0A0;
	wire naddress1;

	wire I1A0;
	wire I1A1;
	
	wire I2A0;
	wire I2A1;

	wire I3A0;
	wire I3A1;


//Go through all four inputs

//Input 0 is (I0 & ~S0) & ((I0 & ~S0) & ~S1)
	`NOT A0inv(naddress0, address0);
	`AND andgate1(I0A0, in0, naddress0);
	`NOT A1inv(naddress1, address1);
	`AND andgate2(I0A1, naddress1, I0A0);
	
//Input 1 is (I1 & S0) & ((I1 & S0) & ~S1)
    	`AND andgate3(I1A0, in1, address0);
	`AND andgate4(I1A1, I1A0, naddress1);

//Input 2 is (I2 & ~S0) & ((I2 & ~S0) & S1)
	`AND andgate5(I2A0, in2, naddress0);
	`AND andgate6(I2A1, I2A0, address1);

//Input 3 is (I3 & S0) & ((I3 & S0) & S1)
	`AND andgate7(I3A0, in3, address0);
	`AND andgate8(I3A1, I3A0, address1);

//Final Or Gate

	`OR orgate(structuralOut, I0A1, I1A1, I2A1, I3A1);

endmodule
