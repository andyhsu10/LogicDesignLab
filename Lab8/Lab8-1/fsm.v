`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:58:15 05/00/2015 
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
`include "global.v"
module fsm(
	state, //state (O)
	count_enable, //counter enable (O)
	in1, //input control (I)
	in2, //input control (I)
	clk, //global clock signal (I)
	rst_n //low active reset
);

//I/Os
output [1:0] state; //state
output count_enable; //counter enable
input clk; //global signal input
input rst_n; //low active reset
input in1, in2; //input control

reg count_enable; //counter enable
reg [1:0] state; //state of FSM
reg [1:0] next_state; //next state of FSM

//FSM state transition
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		state <= `STAT_START;
	else
		state <= next_state;

//FSM state decision
always @*
	case(state)
		`STAT_START:
			if(~in1)
				begin
					next_state = `STAT_STOP;
					count_enable = `DISABLED;
				end
			else if(~in2)
				begin
					next_state = `STAT_LAP_FREEZE;
					count_enable = `ENABLED;
				end
			else
				begin
					next_state = `STAT_START;
					count_enable = `ENABLED;
				end
		`STAT_STOP:
			if(~in1)
				begin
					next_state = `STAT_START;
					count_enable = `ENABLED;
				end
			else
				begin
					next_state = `STAT_STOP;
					count_enable = `DISABLED;
				end
		`STAT_LAP_FREEZE:
			if(~in1)
				begin
					next_state = `STAT_LAP_FREEZE;
					count_enable = `DISABLED;
				end
			else if(~in2)
				begin
					next_state = `STAT_START;
					count_enable = `ENABLED;
				end
			else
				begin
					next_state = `STAT_LAP_FREEZE;
					count_enable = `ENABLED;
				end
		default:
			begin
				next_state = `STAT_START;
				count_enable = `ENABLED;
			end		
	endcase

endmodule