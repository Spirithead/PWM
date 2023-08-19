`timescale 1ns / 1ps
module DECODER(
	input[2:0] ADDR,
	output[0:7] SELECT
    );
	 
reg[0:7] DEC;
assign SELECT = ~DEC;

always@* begin
 case(ADDR)
	3'd0: DEC=8'b10000000;
   3'd1: DEC=8'b01000000;
   3'd2: DEC=8'b00100000;
   3'd3: DEC=8'b00010000;
   3'd4: DEC=8'b00001000;
   3'd5: DEC=8'b00000100;
   3'd6: DEC=8'b00000010;
   3'd7: DEC=8'b00000001;
 endcase
end

endmodule
