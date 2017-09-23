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
    // Your adder code here
    wire AandB;
    wire AorB;
    wire AandBandCin;
    wire AxorB;
    wire AxorB_xorCin;
    wire notCin;
    wire preCout1;
    wire preCout2;

    and #50 andgate1(AandB, a, b);
    or #50 orgate1(AorB, a, b);
    and #50 s_andgate1(AandBandCin, AandB, carryin);
    xor #50 xorgate1(AxorB, a, b);
    xor #50 xorgate2(AxorB_xorCin, AxorB, carryin);
    or #50 s_orgate(sum, AandBandCin, AxorB_xorCin);

    not #50 not_cgate(notCin, carryin);
    and #50 cout_andgate1(preCout1, carryin, AorB);
    and #50 cout_andgate2(preCout2, notCin, AandB);
    or #50 cout_orgate(carryout, preCout1, preCout2);

endmodule
