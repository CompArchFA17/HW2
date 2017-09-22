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

module myHalfAdder(
    output sum,
    output carryout,
    input a,
    input b
);
    `XOR axorb(sum,a,b);
    `AND aandb(carryout,a,b);
endmodule

module structuralFullAdder
(
    output sum,
    output carryout,
    input a,
    input b,
    input carryin
);
    wire s1;
    wire c1;
    wire c2;
    myHalfAdder a1(s1,c1,a,b);
    myHalfAdder a2(sum, c2, s1, carryin);
    `OR (carryout, c1, c2);
endmodule
