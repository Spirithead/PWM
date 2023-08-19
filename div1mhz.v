`timescale 1ns / 1ps
module div1mhz(
   input clk, rst,
   output reg ceo
);

reg [5:0] count;

always@(posedge clk, posedge rst)
begin
   if(rst)
   begin
      count <= 0;
      ceo <= 1'b0;
   end
   else if(count == 48)
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