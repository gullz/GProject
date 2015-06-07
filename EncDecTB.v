module EncDecTB();
  reg [7:0]num;
  reg clk,sel;
  reg [2:0]ky;
  wire [7:0]outval;
  
  EncDec uut(.inp(num),.select(sel),.CLK(clk),.key(ky),.out(outval));
  
  initial begin
    $dumpfile("EncDec.vcd");
    $dumpvars(0,uut);
    $monitor("clock=%b number=%c, select=%d, key=%d out=%d",clk,num,sel,ky,outval);
    
    #0 clk=0;num=65;sel=1;ky=3;
    #5 sel=1;
    #5 num=91;
    #10 $finish;
  end
  always #1  clk=!clk;
endmodule
