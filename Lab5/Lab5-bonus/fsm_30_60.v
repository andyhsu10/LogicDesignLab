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
`define STAT_30 1'b1
`define STAT_60 1'b0
`define SIXTY 4'd6
`define THIRTY 4'd3
module fsm_30_60(
	ini, //initial value
	in, //input control
	clk, //global clock signal
	rst_n //low active reset
);

output [3:0] ini; //initial value
input clk; //global signal input
input rst_n; //low active reset
input in; //input control

reg [3:0] ini; //initial value
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
					next_state = `STAT_60;
					ini = `SIXTY;
				end
			else
				begin
					next_state = `STAT_30;
					ini = `THIRTY;
				end
		1'b0:
			if(~in)
				begin
					next_state = `STAT_30;
					ini = `THIRTY;
				end
			else
				begin
					next_state = `STAT_60;
					ini = `SIXTY;
				end
		default:
			begin
				next_state = `STAT_30;
				ini = `THIRTY;
			end
	endcase
endmodule