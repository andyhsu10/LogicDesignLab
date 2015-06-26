`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu & Hsin-Ho Lu
//
// Create Date:    16:12:17 06/19/2015
// Module Name:    display_ctl
// Project Name:   2015 Spring Logic Design Laboratory Final Project
// Revision:
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module display_ctl(
    data_out, //data output (O)
    game_en, //game enable (I)
    state, //fsm state (I)
    initial_data_in, //initial screen lcd data (I)
	invite_data_in, //invite screen lcd data (I)
	count_down_data_in, //count down screen lcd data (I)
	flick_master_data_in, //flick master screen lcd data (I)
	mora_data_in, //mora screen lcd data (I)
	high_or_low_data_in, //high or low screen lcd data (I)
	rainfall_data_in, //rainfall screen lcd data (I)
	result_data_in //result screen lcd data (I)
);

//I/Os
output [127:0] data_out; //data output
input [2:0] game_en; //game enable
input [3:0] state; //fsm state
input [127:0] initial_data_in; //initial screen lcd data
input [127:0] invite_data_in; //invite screen lcd data
input [127:0] count_down_data_in; //count down screen lcd data
input [127:0] flick_master_data_in; //flick master screen lcd data
input [127:0] mora_data_in; //mora screen lcd data
input [127:0] high_or_low_data_in; //high or low screen lcd data
input [127:0] rainfall_data_in; //rainfall screen lcd data
input [127:0] result_data_in; //result screen lcd data

reg [127:0] game;
reg [127:0] data_out; //data output

always @*
	case(game_en)
		3'b000: game = flick_master_data_in;
		3'b001: game = mora_data_in;
		3'b010: game = high_or_low_data_in;
		3'b011: game = rainfall_data_in;
	endcase

always @*
	case(state)
		`STAT_INITIAL: data_out = initial_data_in;
		`STAT_GAME_INVITE: data_out = invite_data_in;
		`STAT_STAGE1_DES: data_out = count_down_data_in;
		`STAT_STAGE1: data_out = game;
		`STAT_STAGE2_DES: data_out = count_down_data_in;
		`STAT_STAGE2: data_out = game;
		`STAT_STAGE3_DES: data_out = count_down_data_in;
		`STAT_STAGE3: data_out = game;
		`STAT_RESULT: data_out = result_data_in;
		default: data_out = 128'd0;
	endcase

endmodule
