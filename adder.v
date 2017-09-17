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
    wire ab;
    wire acarryin;
    wire bcarryin;
    wire orpairintermediate;
    wire orsingleintermediate;
    wire orall;
    wire andsumintermediate;
    wire andsingleintermediate;
    wire andall;
    wire invcarryout;
    and #(50) andab(ab, a, b);
    and #(50) andacarryin(acarryin, a, carryin);
    and #(50) andbcarryin(bcarryin, b, carryin);
    or #(50) orpair(orpairintermediate, ab, acarryin);
    or #(50) orcarryout(carryout, orpairintermediate, bcarryin);
    or #(50) orintermediate(orsingleintermediate, a, b);
    or #(50) orallinputs(orall, orsingleintermediate, carryin);
    not #(50) inv(invcarryout, carryout);
    and #(50) sumintermediate(andsumintermediate, invcarryout, orall);
    and #(50) andintermediate(andsingleintermediate, a, b);
    and #(50) andallinputs(andall, andsingleintermediate, carryin);
    or #(50) adder(sum, andsumintermediate, andall);
endmodule
