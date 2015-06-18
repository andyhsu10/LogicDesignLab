`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu & Hsin-Ho Lu
//
// Create Date:    11:43:32 06/18/2015
// Module Name:    fsm
// Project Name:   2015 Spring Logic Design Laboratory Final Project
// Revision:
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module fsm(
	state, //state signal (O)
	game_invite, //game invitation button (I)
	game_cancel, //game cancellation button (I)
	game_invite_back_state, //game invitation screen to next state (I)
	count_down_next_state, //count down screen to next state (I)
	game_next_state, //game to next state (I)
	result_next_state, //result next state (I)
	clk, //global clock signal (I)
	rst_n //low active reset (I)
);

//I/Os
output [3:0] state; //state signal
input game_invite; //game invitation button
input game_cancel; //game cancellation button
input game_invite_back_state; //game invitation screen to next state
input count_down_next_state; //count down screen to next state
input game_next_state; //game to next state
input result_next_state; //result next state
input clk; //global clock signal
input rst_n; //low active reset

reg [3:0] state; //state of FSM
reg [3:0] next_state; //next state of FSM

//FSM state transition
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		state <= `STAT_INITIAL;
	else
		state <= next_state;

//FSM state decision
always @*
	case(state)
		`STAT_INITIAL:
			if(~game_invite)
				next_state = `STAT_GAME_INVITE;
			else
				next_state = `STAT_INITIAL;
		`STAT_GAME_INVITE:
			if(~game_cancel || (game_invite_back_state == 1'b1))
				next_state = `STAT_INITIAL;
			else if(~game_invite)
				next_state = `STAT_STAGE1_DES;
			else
				next_state = `STAT_GAME_INVITE;
		`STAT_STAGE1_DES:
			if(count_down_next_state == 1'b1)
				next_state = `STAT_STAGE1;
			else
				next_state = `STAT_STAGE1_DES;
		`STAT_STAGE1:
			if(game_next_state == 1'b1)
				next_state = `STAT_STAGE2_DES;
			else
				next_state = `STAT_STAGE1;
		`STAT_STAGE2_DES:
			if(count_down_next_state == 1'b1)
				next_state = `STAT_STAGE2;
			else
				next_state = `STAT_STAGE2_DES;
		`STAT_STAGE2:
			if(game_next_state == 1'b1)
				next_state = `STAT_STAGE3_DES;
			else
				next_state = `STAT_STAGE2;
		`STAT_STAGE3_DES:
			if(count_down_next_state == 1'b1)
				next_state = `STAT_STAGE3;
			else
				next_state = `STAT_STAGE3_DES;
		`STAT_STAGE3:
			if(game_next_state == 1'b1)
				next_state = `STAT_RESULT;
			else
				next_state = `STAT_STAGE3;
		`STAT_RESULT:
			if(result_next_state == 1'b1)
				next_state = `STAT_INITIAL;
			else
				next_state = `STAT_RESULT;
		default:
			next_state = `STAT_INITIAL;
	endcase
endmodule