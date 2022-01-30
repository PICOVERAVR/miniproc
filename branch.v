module branch(clk, addrin, flagsel, flags, hilo, btake, addrout);
  input clk;
  input [15:0] addrin;
  input [2:0] flagsel, flags;
  input hilo;
  output reg btake;
  output reg [15:0] addrout;
  reg flag;

  always @ (posedge clk or negedge clk) begin
    flag <= flags[flagsel]; //specify flag to use
    if ((!flag && !hilo) || (flag && hilo)) begin
        btake <= 1'b0; //branch taken
        addrout <= addrin;
      end
      else begin //branch not taken
        btake <= 1'b1;
        addrout <= 8'bzz;
      end
  end
endmodule
