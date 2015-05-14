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
	count_enable, //counter enable (O)
	in1, //input control (I)
	in2, //input control (I)
	clk, //global clock signal (I)
	rst_n //low active reset (O)
);

//I/Os
output count_enable; //counter enable
output rst_n; //low active reset
input clk; //global signal input
input in1, in2; //input control

reg count_enable; //counter enable
reg rst_n; //low active reset
reg [1:0] state; //state of FSM
reg [1:0] next_state; //next state of FSM

//FSM state transition
always @(posedge clk)
	state <= next_state;

//FSM state decision
always @*
	case(state)
		`STAT_RESUME:
			if(~in1)
				begin
					next_state = `STAT_PAUSE;
					count_enable = `DISABLED;
					rst_n = `ENABLED;
				end
			else if(~in2)
				begin
					next_state = `STAT_STOP;
					count_enable = `DISABLED;
					rst_n = `ENABLED;
				end
			else
				begin
					next_state = `STAT_RESUME;
					count_enable = `ENABLED;
					rst_n = `ENABLED;
				end
		`STAT_PAUSE:
			if(~in1)
				begin
					next_state = `STAT_RESUME;
					count_enable = `ENABLED;
					rst_n = `ENABLED;
				end
			else if(~in2)
				begin
					next_state = `STAT_STOP;
					count_enable = `DISABLED;
					rst_n = `ENABLED;
				end
			else
				begin
					next_state = `STAT_PAUSE;
					count_enable = `DISABLED;
					rst_n = `ENABLED;
				end
		`STAT_STOP:
			if(~in1)
				begin
					next_state = `STAT_RESUME;
					count_enable = `ENABLED;
					rst_n = `ENABLED;
				end
			else if(~in2)
				begin
					next_state = `STAT_RESUME;
					count_enable = `ENABLED;
					rst_n = `DISABLED;
				end
			else
				begin
					next_state = `STAT_STOP;
					count_enable = `DISABLED;
					rst_n = `ENABLED;
				end
		default:
			begin
				next_state = `STAT_RESUME;
				count_enable = `ENABLED;
				rst_n = `ENABLED;
			end		
	endcase

endmodule