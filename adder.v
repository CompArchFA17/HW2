// Adder circuit
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
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    // Your adder code here
    wire axorb;
    wire nCarryIn;
    wire notaxorb;
    wire sumWire0;
    wire sumWire1;
    
    `XOR abxorgate(axorb, a, b);
    `AND andgate0(sumWire0, axorb, nCarryIn);
    `NOT invCarryIn(nCarryIn, carryin);
    `NOT invaxorb(notaxorb, axorb);
    `AND andgate1(sumWire1, carryin, notaxorb);
    `OR orgate0(sum, sumWire0, sumWire1);

    wire aandb;
    wire aorb;
    wire carryOutWire;
    
    `AND abandgate(aandb, a, b);
    `OR orgate1(aorb, a, b);
    `AND andgate2(carryOutWire, carryin, aorb);
    `OR orgate2(carryout, aandb, carryOutWire);
endmodule
