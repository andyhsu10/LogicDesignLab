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
	in1, //input control (I)
	in2, //input control (I)
	clk, //global clock signal (I)
	rst_n //low active reset
);

//I/Os
output [1:0] state; //state
input clk; //global signal input
input rst_n; //low active reset
input in1, in2; //input control

reg [1:0] state; //state of FSM
reg [1:0] next_state; //next state of FSM

//FSM state transition
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		state <= `STAT_12_ONE;
	else
		state <= next_state;

//FSM state decision
always @*
	case(state)
		`STAT_12_ONE:
			if(~in1)
				next_state = `STAT_12_TWO;
			else if(~in2)
				next_state = `STAT_24_ONE;
			else
				next_state = `STAT_12_ONE;
		`STAT_12_TWO:
			if(~in1)
				next_state = `STAT_12_ONE;
			else if(~in2)
				next_state = `STAT_24_TWO;
			else
				next_state = `STAT_12_TWO;
		`STAT_24_ONE:
			if(~in1)
				next_state = `STAT_24_TWO;
			else if(~in2)
				next_state = `STAT_12_ONE;
			else
				next_state = `STAT_24_ONE;
		`STAT_24_TWO:
			if(~in1)
				next_state = `STAT_24_ONE;
			else if(~in2)
				next_state = `STAT_12_TWO;
			else
				next_state = `STAT_24_TWO;
		default:
			next_state = `STAT_12_ONE;
	endcase

endmodule