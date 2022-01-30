module rom(en, addr, read);
  input en;
  input reg [15:0] addr;
  output reg [31:0] read;
  reg [31:0][15:0] rom; //64Kbyte ROM w. 32 bit instruction word
  //initial begin ... end
  //rom[test] <= 31'hFF; //write program values in for loop out of here.
  //example code: FF 3D 24 EA 4B ...

  always @(*) begin //not synchronus
    if (en) begin
      read <= rom[addr];
    end
  end
endmodule
