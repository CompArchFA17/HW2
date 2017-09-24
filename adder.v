// Adder circuit
`define AND and #50
`define OR  or #50
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
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    // Your adder code here
    wire AandB;
    wire AandBandCin;
    wire AandCin;
    wire BandCin;
    wire AxorB;
    wire AxorB_xorCin;
    wire notCin;
    wire preCout1;
    wire preCout2;

    `AND andgate1(AandB, a, b);
    `AND andgate2(AandCin, a, carryin);
    `AND andgate2(BandCin, b, carryin);

    `AND s_andgate1(AandBandCin, AandB, carryin);
    `XOR xorgate1(AxorB, a, b);
    `XOR xorgate2(AxorB_xorCin, AxorB, carryin);
    `OR  s_orgate(sum, AandBandCin, AxorB_xorCin);

    `NOT not_cgate(notCin, carryin);
    `OR  cout_orgate1(preCout1, AandCin, BandCin); 
    `AND cout_andgate2(preCout2, notCin, AandB);
    `OR  cout_orgate2(carryout, preCout1, preCout2);

endmodule
