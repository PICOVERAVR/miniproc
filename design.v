`include "alu.sv"
`include "regarray.sv"
`include "branch.sv"
`include "datacache.sv"
`include "pc.sv"
`include "ram.sv"

module processor(clk);

  input reg clk; //master clock signal

  reg en, we;
  reg [5:0] sela, selb;
  reg [7:0] reada, readb, write;

  reg [7:0] out;
  reg [3:0] sel;
  reg [2:0] flags;

  regarray array(.clk(clk), .en(en), .we(we), .sela(sela), .selb(selb), .reada(reada),  .readb(readb),.write(write));

  alu alu(.a(reada), .b(readb), .out(out), .sel(sel), .flags(flags), .clk(clk), .en(en));


endmodule
