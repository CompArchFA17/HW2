// Decoder circuit
`define And and #50
`define Not not #50

module behavioralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
    assign {out3,out2,out1,out0}=enable<<{address1,address0};
endmodule

///////////////////////////////////////  My decoder  /////////////////////////////////////////////////


module structuralDecoder
(
    output out0, out1, out2, out3, 
    input A0, A1,
    input enable
);
    wire nA0;  
    wire nA1; 
    wire nA0andnA1; 
    wire A0andnA1; 
    wire nA0andA1; 
    wire A0andA1; 

    `Not A0inv(nA0, A0);  
    `Not A1inv(nA1, A1); 

    `And and0(nA0andnA1, nA0, nA1);
    `And and1(A0andnA1 , A0 , nA1);
    `And and2(nA0andA1 , nA0, A1);
    `And and3(A0andA1  , A0 , A1);

    `And and_0(out0, nA0andnA1, enable); 
    `And and_1(out1, A0andnA1 , enable); 
    `And and_2(out2, nA0andA1 , enable); 
    `And and_3(out3, A0andA1  , enable); 

endmodule

