`timescale 1ns / 1ps
module LR5_TOP(
	input CLK_100,
	input BTN_0,BTN_1,BTN_2,BTN_3,
	output[0:7] ROW, 
	output[0:7] COL_B,
	output[0:15] LED
    );

wire CLK;
wire LEFT, RIGHT, RST, RE;
wire[63:0] SHIFT;
parameter PWM_WIDTH = 4;

assign RST = BTN_0;
assign RE = BTN_1;
assign LEFT = BTN_2;
assign RIGHT = BTN_3;

//sync SYNC(.in(BTN_0), .clk(CLK_100), .rst(RST));
//div1KHz DIV(.clk(CLK_100), .rst(RST), .ceo(CLK));
//BTN_FILTER FILTER_LEFT(.CLK(CLK_100), .CE(CLK), .RST(RST), .BTN_IN(BTN_1), .BTN_CEO(LEFT));
//BTN_FILTER FILTER_RIGHT(.CLK(CLK_100), .CE(CLK), .RST(RST), .BTN_IN(BTN_2), .BTN_CEO(RIGHT));
//BTN_FILTER FILTER_RE(.CLK(CLK_100), .CE(CLK), .RST(RST), .BTN_IN(BTN_3), .BTN_CEO(RE));
SHIFT_REG SH_REG(.clk(CLK_100), .shift_l(LEFT), .shift_r(RIGHT), .rst(RST), .shift(SHIFT));

genvar i;
generate
	for(i=0; i<64; i=i+4)begin : pwm_gen
		PWM_FSM#(.UDW(PWM_WIDTH)) PWM(.CLK(CLK_100), .RST(RST), .RE(RE), .CE(CLK_100), 
			.PWM_IN(SHIFT[i+:4]), .PWM_P(LED[(i/4)]));
	end
endgenerate


LR5_MATRIX_DISP MATRIX(.CLK(CLK_100), .CE(CLK_100), .SEQ(SHIFT), .RST(RST),
.ROW_0(ROW[0]),
.ROW_1(ROW[1]),
.ROW_2(ROW[2]),
.ROW_3(ROW[3]),
.ROW_4(ROW[4]),
.ROW_5(ROW[5]),
.ROW_6(ROW[6]),
.ROW_7(ROW[7]),

.COL_0(COL_B[0]),
.COL_1(COL_B[1]),
.COL_2(COL_B[2]),
.COL_3(COL_B[3]),
.COL_4(COL_B[4]),
.COL_5(COL_B[5]),
.COL_6(COL_B[6]),
.COL_7(COL_B[7]));


endmodule
