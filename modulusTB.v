module modulusTB();
  reg [15:0]num;
  reg [7:0]div;
  wire [7:0]modval;
  
  modulus uut(.number(num),.divider(div),.mod(modval));
  
  initial begin
    $dumpfile("modulus.vcd");
    $dumpvars(0,uut);
    $monitor("number=%d, div=%d, mod=%d",num,div,modval);
    
    #0 num=224;div=128;
    #5 num=215;div=126;
    #5 num=273;div=128;
    #5 $finish;
  end
endmodule
