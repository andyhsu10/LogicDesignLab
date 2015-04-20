`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:42:43 04/20/2015 
// Design Name: 
// Module Name:    fsm_num_store 
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
`define STAT_UNIT 2'd0
`define STAT_TENS 2'd1
`define STAT_PAUSE 2'd2
module fsm_num_store(
	state, //number memory state
	pressed, //button pressed input
	rst_n //low active reset
);

output reg [1:0] state; //number memory state output
input pressed; //button pressed input
input rst_n; //low active reset

//FSM state transition
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		state <= 2'd0;
	else
		state <= next_state;

//FSM state decision
always @*
	case(state)
		`STAT_UNIT:
			if(pressed)
				next_state = `STAT_TENS;
			else
				next_state = `STAT_UNIT;
		`STAT_TENS:
			if(pressed)
				next_state = `STAT_PAUSE;
			else
				next_state = `STAT_TENS;
		`STAT_PAUSE:
			next_state = `STAT_PAUSE;
		default:
			next_state = `STAT_UNIT;
	endcase

endmodule
