// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder();
    reg a, b, carryin;
    wire sum, carryout;

    behavioralFullAdder adder (sum, carryout, a, b, carryin);

    // Returns a string of max length 264
    function [263*8:0] get_disp_str;
      // Takes the header of a boolean logic table
      input [263*8:0] header_str;
      reg [263*8:0] temp_out; // While building the output, keep string in here
      integer i;
      reg [7:0] char;
      integer word_length;
      begin
        word_length = 0;
        for(i=262; i>=0; i=i-1) begin // not i=i++
          char = header_str[8*i +: 8];
          if (char != "") begin
            if (char == " " || char == "|") begin
              // Copy word to output
              while (word_length > 0) begin
                temp_out = {temp_out, header_str[8*(i+word_length) +: 8]};
                word_length = word_length - 1;
              end
              temp_out = {temp_out, char};
            end
            else if (char != "") begin
              word_length = word_length + 1;
            end
          end
        end
        get_disp_str = temp_out;
      end
    endfunction

    reg [263*8:0] w_Result;

    initial begin
      assign w_Result = get_disp_str("A B Cin | Cout Sum ");
      $display("%0s", w_Result);
      // test when all wires are 0
      $display("A B Cin | Cout Sum ");
      a=0;b=0;carryin=0; #1000
      $display("%b %b  %b  |  %b   %b", a, b, carryin, carryout, sum);
      a=1;b=0;carryin=0; #1000
      $display("%b %b  %b  |  %b   %b", a, b, carryin, carryout, sum);
      a=0;b=1;carryin=0; #1000
      $display("%b %b  %b  |  %b   %b", a, b, carryin, carryout, sum);
      a=1;b=1;carryin=0; #1000
      $display("%b %b  %b  |  %b   %b", a, b, carryin, carryout, sum);
      a=0;b=0;carryin=1; #1000
      $display("%b %b  %b  |  %b   %b", a, b, carryin, carryout, sum);
      a=1;b=0;carryin=1; #1000
      $display("%b %b  %b  |  %b   %b", a, b, carryin, carryout, sum);
      a=0;b=1;carryin=1; #1000
      $display("%b %b  %b  |  %b   %b", a, b, carryin, carryout, sum);
      a=1;b=1;carryin=1; #1000
      $display("%b %b  %b  |  %b   %b", a, b, carryin, carryout, sum);
      end
endmodule
