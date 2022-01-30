`include "rom.sv"

module pc(clk, branch, mar, en, ir, pc);
  reg [15:0] romaddr;
  reg [7:0] romread;
  rom progmem(.en(en), .addr(romaddr), .read(romread));

  input clk, branch, en; //branch: 0: jmp, 1: inc
  input reg [15:0] mar;
  output reg [15:0] pc;
  output reg [31:0] ir; //op reg reg reg misc

  always @ (posedge clk or negedge clk) begin
    if (en) begin
      romaddr <= pc;
      ir <= romread;
      if (branch) pc++; else pc <= mar;
    end
  end

endmodule
