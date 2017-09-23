`define AND and #50
`define OR or #50
`define XOR xor #50

// Adder circuit

module behavioralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    // Uses concatenation operator and built-in '+'
    assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);

    wire AxorB;
	wire AandB;
	wire AxorBandCarryIn;
	
	`XOR (AxorB, a, b);
	`XOR (sum, AxorB, carryin);
	`AND (AandB, a, b);
	`AND (AxorBandCarryIn, AxorB, carryin);
	`OR (carryout, AxorBandCarryIn, AandB);
	
endmodule
