`timescale 1ns / 1ps
module PWM_FSM #(
	parameter UDW = 4)
(
	input CLK,
	input RST,
	input RE,
	input CE,
	input [UDW-1:0] PWM_IN,
	output reg PWM_P, // Active-High
	output reg PWM_N, // Active-Low
	output reg [UDW-1:0] PWM_REG, FSM_STATE
 );
 // Internal signals declaration:
 //reg [UDW-1:0] PWM_REG, FSM_STATE;
 
 always@* PWM_N <= ~PWM_P;
 
 always@(posedge CLK, posedge RST)begin
	if(RST)PWM_REG <= 0;
	else if((FSM_STATE == 2**UDW-2) && CE) PWM_REG <= PWM_IN;
 end
 
 always @ (posedge CLK, posedge RST)begin
	if(RST)begin
		PWM_P <= 0;
		FSM_STATE <= 0;
	end	
	
	else if(RE)begin
		FSM_STATE <= 0;
		PWM_P <= 0;
	end
	
	else if(CE)begin
		case(FSM_STATE)
			0 : begin
				PWM_P <= 0;
				FSM_STATE <= 2**UDW-2;
			end
			
			{UDW{1'b1}} :begin
				if(PWM_REG != 0) PWM_P <= 1;
				else PWM_P <= 0;
				FSM_STATE <= 1;
			end 
			
			default : begin
				if(PWM_REG > FSM_STATE) PWM_P <= 1;
				else PWM_P <= 0;
				FSM_STATE <= FSM_STATE + 1;
			end
		endcase
	end
end
 
 endmodule