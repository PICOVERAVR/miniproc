module ram(en, rw, addr, write, read);
  input en;
  input reg rw; //1: read, 0: write
  input reg [10:0] addr;
  input reg [7:0] write;
  output reg [7:0] read;
  reg [31:0][15:0] ram; //ram same word length as rom for ease of use

  always @(*) begin //not synchronus
    if (en) begin
    	read <= ram[addr];
        if (!rw) ram[addr] <= write;
    end
  end
endmodule
