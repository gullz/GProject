module EncDec(input [7:0]inp, input select, CLK, input [2:0] key, output [7:0] out);

  reg [1:0]state,nextstate;
  reg [15:0]intmidVal;
  wire [7:0]outVal;
  
  initial state=0;

  always @(posedge CLK)
    state<=nextstate;
    
  always @(posedge CLK) begin
    case(state)
      0: 
      begin
        if (inp==0 && key==0) 
          nextstate<=0;
        else
          nextstate<=1;
      end
      1:
      begin
        if (select==0)
          nextstate<=2;
        else
          nextstate<=3;
      end
      2:
      begin
        intmidVal=inp+key;
        nextstate=4;
      end
      3:
      begin
        intmidVal=inp-key;
        nextstate=4;
      end
      4:
      nextstate=0;
    endcase
  end
  
  modulus uut(.number(intmidVal),.divider(128),.mod(outVal));
  
  assign out=outVal;
endmodule
        
      
