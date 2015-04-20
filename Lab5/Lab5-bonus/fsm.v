`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:27:40 04/09/2015 
// Design Name: 
// Module Name:    fsm 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`define STAT_COUNT 1'b1
`define STAT_PAUSE 1'b0
`define DISABLED 1'b0
`define ENABLED 1'b1
module fsm(
	count_enable, //if counter is enabled
	in, //input control
	clk, //global clock signal
	rst_n //low active reset
);

output count_enable; //if counter is enabled
input clk; //global signal input
input rst_n; //low active reset
input in; //input control

reg count_enable; //if counter is enabled
reg state; //state of FSM
reg next_state; //next state of FSM

//FSM state transition
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		state <= 1'b1;
	else
		state <= next_state;

//FSM state decision
always @*
	case(state)
		1'b1:
			if(~in)
				begin
					next_state = `STAT_PAUSE;
					count_enable = `DISABLED;
				end
			else
				begin
					next_state = `STAT_COUNT;
					count_enable = `ENABLED;
				end
		1'b0:
			if(~in)
				begin
					next_state = `STAT_COUNT;
					count_enable = `ENABLED;
				end
			else
				begin
					next_state = `STAT_PAUSE;
					count_enable = `DISABLED;
				end
		default:
			begin
				next_state = 1'b0;
				count_enable = `DISABLED;
			end
	endcase
endmodule