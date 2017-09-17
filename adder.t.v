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
      integer n_spaces;
      begin
        word_length = 0;
        for(i=262; i>=0; i=i-1) begin // not i=i++
          char = header_str[8*i +: 8];
          if (char == " " || char == "|") begin
            // last word is over, copy right amount of spaces and %b over
            if (word_length > 0)
              if (word_length % 2 == 1) begin
                n_spaces = word_length / 2;
                repeat (n_spaces)
                  temp_out = {temp_out, " "};
                temp_out = {temp_out, "%b"};
                repeat (n_spaces)
                  temp_out = {temp_out, " "};
              end
              else begin
                n_spaces = word_length / 2 - 1;
                repeat (n_spaces)
                  temp_out = {temp_out, " "};
                temp_out = {temp_out, "%b"};
                repeat (n_spaces)
                  temp_out = {temp_out, " "};
                temp_out = {temp_out, " "};
              end
              word_length = 0;
            temp_out ={temp_out, char};
          end
          else if (char != "") begin
            word_length = word_length + 1;
            $display("word length: %d", word_length);
          end
        end
        get_disp_str = temp_out;
      end
    endfunction

    reg [263*8:0] w_Result;

    initial begin
      assign w_Result = get_disp_str("A B Cin | Cout Sum ");
      $display("format string: %0s \n", w_Result);
      // test when all wires are 0
      $display("A B Cin | Cout Sum ");
      a=0;b=0;carryin=0; #1000
      $display(w_Result, a, b, carryin, carryout, sum);
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
