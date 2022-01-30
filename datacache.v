module datacache(clk, rw, address, write, read, en);
  input clk;
  input en;
  input reg rw; //1: read, 0: write
  input reg [10:0] address;
  input reg [7:0] write;
  output reg [7:0] read;
  reg [7:0][10:0] cache;

  always @(posedge clk or negedge clk) begin
    if (en) begin
    	read <= cache[address];
    	if (!rw) cache[address] <= write;
    end
  end
endmodule
