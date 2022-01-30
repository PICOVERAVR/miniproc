module alu(a, b, out, sel, flags, clk, en);
  input [7:0] a;
  input [7:0] b;
  input reg [3:0] sel; //add, sub, and, or, xor, not, lshift, rshift, nop, adc, sbc (10 ops)
  input clk; //tie to master machine clk until ready to pipeline
  output reg [7:0] out;
  output reg [2:0] flags; //zero, carry, negative
  input en;

  always @(posedge clk or negedge clk) begin
    if (en) begin
    case (sel)
      4'h0: out <= a + b;
      4'h1: out <= a - b;
      4'h2: out <= a & b;
      4'h3: out <= a | b;
      4'h4: out <= a ^ b;
      4'h5: out <= ~a;
      4'h6: out <= a << b;
      4'h7: out <= a >> b;
      4'h8: out <= a;
      4'h9: out <= a + b + flags[1];
      4'hA: out <= a - b - flags[2];
    endcase
    flags[0] <= (out == 0) ? 1 : 0; //zero check
    flags[1] <= (out > 255) ? 1 : 0; //carry check
    flags[2] <= (out < 0) ? 1 : 0; //negative check
   end
  end
endmodule
