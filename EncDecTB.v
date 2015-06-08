module EncDecTB();
  reg [7:0]num;
  reg clk,sel;
  reg [2:0]ky;
  wire [7:0]outval;
  
  EncDec uut2(.inp(num),.select(sel),.CLK(clk),.key(ky),.out(outval));
  
  initial begin
    $dumpfile("EncDec.vcd");
    $dumpvars(0,uut2);
    $monitor("clock=%b number=%c, select=%d, key=%d out=%d",clk,num,sel,ky,outval);
    
    #0 clk=0;num=65;sel=0;ky=3;
    #20 sel=1;
    #20 num=99;sel=0;
    #20 sel=1;
    #20 $finish;
  end
  always #1  clk=!clk;
endmodule
