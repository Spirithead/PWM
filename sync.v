`timescale 1ns / 1ps

module sync(
   input in, clk,
   output rst
);

reg [1:0] q;

always@(posedge clk, posedge in)
begin
   if(in)
   begin
      q = 2'b11;
   end
   else begin
      q = {q[0], 1'b0};
   end
end

assign rst = q[1];

endmodule
