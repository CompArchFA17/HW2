// Adder circuit

`define Xor xor #50
`define And and #50
`define Or or #50

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
    input a, b, 
    input carryin
);
    wire axorb; 
    wire aandb; 
    wire candaxorb;	
	
	`Xor xor1(axorb, a, b); 
	`And and2(aandb, a, b);
	`Xor xor3(sum, axorb, carryin);
	`And and4(candaxorb, carryin, axorb); 
	`Or or5(carryout, aandb, candaxorb);


endmodule
