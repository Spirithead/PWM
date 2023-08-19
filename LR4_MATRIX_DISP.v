`timescale 1ns / 1ps
module LR5_MATRIX_DISP(
	input CLK, CE, RST,
	input [63:0] SEQ,
	output ROW_0, ROW_1, ROW_2, ROW_3, ROW_4, ROW_5, ROW_6, ROW_7, 
	COL_0, COL_1, COL_2, COL_3, COL_4, COL_5, COL_6, COL_7
    );

wire[2:0]COL;
wire[7:0] CURR_COL;

assign ROW_0 = SEQ[(63-COL)];
assign ROW_1 = SEQ[(55-COL)];
assign ROW_2 = SEQ[(47-COL)];
assign ROW_3 = SEQ[(39-COL)];
assign ROW_4 = SEQ[(31-COL)];
assign ROW_5 = SEQ[(23-COL)];
assign ROW_6 = SEQ[(15-COL)];
assign ROW_7 = SEQ[(7-COL)];

COL_COUNTER COL_CNT(.CLK(CLK), .CE(CE), .Q(COL), .RST(RST));

DECODER COL_DEC(.ADDR(COL), .SELECT(CURR_COL));
assign {COL_0, COL_1, COL_2, COL_3, COL_4, COL_5, COL_6, COL_7} = 
 CURR_COL;

endmodule
