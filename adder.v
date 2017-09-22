// Adder circuit
`define AND and #50
`define OR or #50
`define NOT not #50
`define NAND nand #50
`define NOR nor #50
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
    output cout,
    input a,
    input b,
    input cin
);

    wire axb, ab, aorb, cin_aOb;
    //cin
    `AND cand0(ab, a, b);
    `OR cor0(aOb, a, b);
    `AND cand1(cin_aOb, cin, aOb);
    `OR cor1(cout, cin_aOb, ab);

    //s
    `XOR sxor0(axb, a, b);
    `XOR sxor1(sum, cin, axb);
endmodule
