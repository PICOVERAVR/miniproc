module regarray(clk, en, we, sela, selb, reada, readb, write); //for data only
  input clk, en, we; //clk, read enable, write enable
  input reg [5:0] sela, selb;
  output reg [7:0] reada, readb; //two read ports for two-op alu things.
  input reg [7:0] write;
  reg [4:0][7:0] arr; //32 8-bit registers in array

  integer i;

  initial begin
    for (i = 0; i < 32; i = i + 1) begin
      arr[i] = 8'h00; //init all registers to 8'h00 before using
    end
  end

  always @ (posedge clk or negedge clk) begin
    if (en) begin
      if (we) begin
        arr[sela] <= write;
      end
         reada <= arr[sela];
         readb <= arr[selb];
          end
  		else begin
          readb <= 8'hzz; //(see below)
          reada <= 8'hzz; //disabled for pipeline stall
        end
       end
endmodule
