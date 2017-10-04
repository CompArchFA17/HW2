// Multiplexer circuit
`define Not not #50
`define Nand nand #50
`define Or or #50

module behavioralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    // Join single-bit inputs into a bus, use address as index
    wire[3:0] inputs = {in3, in2, in1, in0};
    wire[1:0] address = {address1, address0};
    assign out = inputs[address];
endmodule


module structM
(
    output out,
    input S0, S1,
    input in0, in1, in2, in3
);
    
    wire nS0; 
    wire nS1; 

    wire out0; 
    wire out1; 
    wire out2; 
    wire out3; 


    `Not S0inv(nS0, S0);
    `Not S1inv(nS1, S1);

    `Nand n0(out0, nS0, nS1, in0);
    `Nand n1(out1, S0,  nS1, in1);
    `Nand n2(out2, nS0, S1, in2);
    `Nand n3(out3, S0,  S1, in3);

    `Nand addthem(out, out0, out1, out2, out3);


endmodule


