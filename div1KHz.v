`timescale 1ns / 1ps

module div1KHz(
   input clk, rst,
   output reg ceo
);

reg [16:0] count;

always@(posedge clk, posedge rst)
begin
   if(rst)
   begin
      count <= 0;
      ceo <= 1'b0;
   end
   else if(count == 99999)
   begin
      count <= 0;
      ceo <= 1'b1;
   end
   else
   begin
      count <= count + 1;
      ceo <= 1'b0;
   end
end
endmodule
