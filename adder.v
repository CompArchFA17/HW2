// Adder circuit
// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50



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



// define XOR gate from primatives
// No delay is necessary since primatives already contain delay
module XOR
(
    output out,
    input in,
    input in1
);

wire nA;
wire nB;
wire AnB;
wire BnA;
`NOT(nA,in);
`NOT(nB,in1);
`AND(AnB,in,nB);
`AND(BnA,nA,in1);
`OR(out,AnB,BnA);
endmodule



module structuralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    wire BCin;
    wire ACin;
    wire AB;

    wire BxorCin;

    `AND(BCin,b,carryin);
    `AND(ACin,a,carryin);
    `AND(AB, a, b);
    `OR(carryout,BCin,ACin,AB);

   XOR xor0(BxorCin,b,carryin);
   XOR xor1(sum,a,BxorCin);

endmodule
