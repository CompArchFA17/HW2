`define AND and #50
`define OR or #50
`define NOT not #50
`define XNOR xnor #50
`define XOR xor #50

module fourtoonemux(A,B,C,D,Pick0,Pick1,Out);

  input A;
  input B;
  input C;
  input D;
  input Pick0;
  input Pick1;
  output Out;

  wire nPick0;
  wire nPick1;
  wire isA;
  wire isB;
  wire isC;
  wire isD;
  wire Out;
  
  `NOT Pick0inv(nPick0, Pick0);
  `NOT Pick1inv(nPick1, Pick1);
  `AND andA(isA, nPick0, nPick1, A);
  `AND andB(isB, Pick0, nPick1, B);
  `AND andC(isC, nPick0, Pick1, C);
  `AND andD(isD, Pick0, Pick1, D);
  `OR orgate(Out, isA, isB, isC, isD);

endmodule

module fulladder(A,B,Cin,O,Cout);

  input A;
  input B;
  input Cin;
  output O;
  output Cout;

  wire AxorB;
  wire AxnorB;
  wire AandB;
  wire CinandAxorB;
  wire nCin;
  wire nCinandAxorB;
  wire CinandAxnorB;

  `XOR ABxor(AxorB, A, B);
  `AND CinAxorBand(CinandAxorB, AxorB, Cin);
  `AND AB(AandB, A, B);
  `OR Carryout(Cout, AandB, CinandAxorB);
  `NOT invCin(nCin, Cin);
  `NOT nAxorB(AxnorB,AxorB);
  `AND CinAxnorB(CinandAxnorB, AxnorB, Cin);
  `AND nCinAxorB(nCinandAxorB, AxorB, nCin);
  `OR orout(O, CinandAxnorB, nCinandAxorB);

endmodule

module decoder(A, B, En, O0, O1, O2, O3);

  input A;
  input B;
  input En;
  output O0;
  output O1;
  output O2;
  output O3;

  `NOT notA(nA, A);
  `NOT notB(nB, B);
  `AND out0(O0, nA, nB, En);
  `AND out1(O1, nA, B, En);
  `AND out2(O2, A, nB, En);
  `AND out3(O3, A, B, En);

endmodule