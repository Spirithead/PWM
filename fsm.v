`timescale 1ns / 1ps

module fsm(
input clk,rst,ce,up,
output reg [3:0] seq

    );
reg [3:0] state;
	 
 initial begin
	state=4'h0;
	end
	
always @ (posedge clk, posedge rst) begin

if(rst) begin
	state=4'h0;
	end
else if(ce & ~up) begin
	if(state==4'h0) begin
		state=4'hF;
		end
	else begin
	state=state-1;
		end
	end
else if(ce & up) begin
	state=state+1;
	end
end

always@*	
case (state)

 4'hF : seq <= 4'hd; 
 4'hE : seq <= 4'h4; 
 4'hD : seq <= 4'h7; 
 4'hC : seq <= 4'ha; 
 4'hB : seq <= 4'h8; 
 4'hA : seq <= 4'hb; 
 4'h9 : seq <= 4'h8; 
 4'h8 : seq <= 4'hd; 
 4'h7 : seq <= 4'h3;
 4'h6 : seq <= 4'h5;
 4'h5 : seq <= 4'h2;
 4'h4 : seq <= 4'hf;
 4'h3 : seq <= 4'hb;
 4'h2 : seq <= 4'hc;
 4'h1 : seq <= 4'h7;
 4'h0 : seq <= 4'h0;
 endcase
endmodule