// Adder circuit
// an adder is a type of snake!

// Multiplexer circuit
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

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
    input a, 
    input b, 
    input carryin,
    output structsum, Cout
);

	wire AxorB;
	wire AandB;
	wire CAxorB;	

	`XOR xorgate1(AxorB, a, b);
	`XOR xorgate2(structsum, AxorB, carryin);

	`AND andgate1(AandB, a, b);
	`AND andgate2(CAxorB, carryin, AxorB);
	`OR orgate1(Cout, AandB, CAxorB);	

endmodule
