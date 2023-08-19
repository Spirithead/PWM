`timescale 1ns / 1ps
module COL_COUNTER(
	input CLK, CE, RST,
	output CEO, output[2:0] Q
    );
parameter [3:0] CNTR_WIDTH = 4;
parameter [3:0] MAX = 8;
reg [CNTR_WIDTH - 1:0] CNT;
reg DONE;
assign Q = CNT;
assign CEO = DONE;

always @ (posedge CLK, posedge RST) begin
	if(RST) CNT <= {CNTR_WIDTH{1'b0}};
	else if(CE) CNT <= CNT + 1; 
	
	else if(CNT == MAX)begin
		DONE <= 1;
		CNT <= 0;
	end
end

endmodule
