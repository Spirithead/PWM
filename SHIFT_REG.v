`timescale 1ns / 1ps
module SHIFT_REG(
	input clk, shift_l, shift_r, rst,
	output reg[63:0] shift
    );

always@(posedge clk, posedge rst)begin
	if(rst) shift<={{4'hD},{4'h4},{4'h7},{4'hA},{4'h8},{4'hB},{4'h8},{4'hD},{4'h3},{4'h5},{4'h2},
		{4'hF},{4'hB},{4'hC},{4'h7},{4'h0}};
	else if(shift_l) shift<=shift<<<4;
	else if(shift_r) shift<=shift>>>4;
end

endmodule
