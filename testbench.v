module test();

  reg clk = 1'b0;
  reg regArrayEn, regArrayWe;
  reg [4:0] sela, selb;
  reg [7:0] reada, readb, write;
  reg [3:0] aluSel;
  reg [2:0] flags;
  reg aluEn;

  //alu alu(.a(reada), .b(readb), .sel(aluSel), .flags(flags), .clk(clk), .en(aluEn));

  //regarray regarray(.clk(clk), .en(regArrayEn), .we(regArrayWe), .sela(sela), .selb(selb), .reada(reada), .readb(readb), .write(write));

  initial begin
    $display("Running!"); //begin sim
  	regArrayEn <= 1'b1; //enable array
  	regArrayWe <= 1'b1; //set to write

  	sela <= 4'h0; //port a to 0
  	write <= 8'h01; //write 0xFE to r0

    clk <= ~clk; //clock it
    #1
    sela <= 4'h1;
    selb <= 4'h0;
    write <= 8'h01;

    clk <= ~clk; //clock it
    #1
    regArrayWe <= 1'b0; //disable writing

    clk <= ~clk; //clock it
    #1

  end
endmodule
