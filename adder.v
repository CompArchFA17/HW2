// Adder circuit

// define gates with delays
`define AND and #50
`define NAND nand #50
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
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    wire AB, BC, AC;
    wire ABorBC;

    // put a one in carryout if at least 2 inputs are 1
    `AND ABgate (AB, a, b);
    `AND BCgate (BC, b, carryin);
    `AND ACgate (AC, a, carryin);
    `OR ABorBCgate (ABorBC, AB, BC);
    `OR COUTgate (carryout, ABorBC, AC);

    wire AorB, BorC, AorC, AorBBorC, AorBBorCAorC;
    wire nABC, twoTrue;
    wire nAorB, nBorC, nAorBorC;
    wire nsum;
    // test where two inputs are 1
    `OR AorBgate (AorB, a, b);
    `OR BorCgate (BorC, b, carryin);
    `OR AorCgate (AorC, a, carryin);
    `AND AorBBorCgate (AorBBorC, AorB, BorC);
    `AND AorBBorCAorCgate (AorBBorCAorC, AorBBorC, AorC);
    `NAND nABCgate (nABC, AB, BC);
    `AND twoTruegate (twoTrue, nABC, AorBBorCAorC);

    // test where no inputs are 1
    `NOT nAorBgate (nAorB, AorB);
    `NOT nBorCgate (nBorC, BorC);
    `AND nAorBorCgate (nAorBorC, nAorB, nBorC);

    // find the ones that should not have 1 in sum
    `OR notSUMgate (nsum, twoTrue, nAorBorC);
    `NOT SUMgate (sum, nsum);

endmodule
