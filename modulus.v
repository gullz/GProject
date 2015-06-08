module modulus(input [15:0] number,input [7:0] divider,output [7:0] mod);
  reg [15:0] numTemp;
  reg [7:0] divTemp;
  reg [7:0] modTemp;

  always @(number) begin
    divTemp=number / divider;
    numTemp=divTemp * divider;
    modTemp=number - numTemp;
  end
  assign mod=modTemp;
endmodule
