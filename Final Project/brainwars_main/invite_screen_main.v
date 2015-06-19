`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu & Hsin-Ho Lu
//
// Create Date:    15:48:49 06/19/2015
// Module Name:    invite_screen_main
// Project Name:   2015 Spring Logic Design Laboratory Final Project
// Revision:
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module invite_screen_main(
	clk, //1Hz clock (I)
	state, //fsm state (I)
	rst_n, //active low reset (I)
	data_out //data output (O)
);

//I/Os
input clk; //1Hz clock
input [3:0] state; //fsm state
input rst_n; //active low reset
output [127:0] data_out; //data output

reg [3:0] cnt, cnt_tmp;
reg [15:0] count_down;
reg [127:0] data_out;

//Combinational logics
always @(cnt)
	cnt_tmp = cnt - 1'b1;

//Sequential lodics: Flip flops
always @(posedge clk or negedge rst_n)
	if(~rst_n || (state != `STAT_GAME_INVITE))
		cnt <= 4'd15;
	else
		cnt <= cnt_tmp;

always @(cnt)
	case(cnt)
		4'd15: count_down = {`GRAPH_INVITE_L1, `GRAPH_INVITE_R5};
		4'd14: count_down = {`GRAPH_INVITE_L1, `GRAPH_INVITE_R4};
		4'd13: count_down = {`GRAPH_INVITE_L1, `GRAPH_INVITE_R3};
		4'd12: count_down = {`GRAPH_INVITE_L1, `GRAPH_INVITE_R2};
		4'd11: count_down = {`GRAPH_INVITE_L1, `GRAPH_INVITE_R1};
		4'd10: count_down = {`GRAPH_INVITE_L1, `GRAPH_INVITE_R0};
		4'd9: count_down = {`GRAPH_INVITE_9_1, `GRAPH_INVITE_9_2};
		4'd8: count_down = {`GRAPH_INVITE_8_1, `GRAPH_INVITE_8_2};
		4'd7: count_down = {`GRAPH_INVITE_7_1, `GRAPH_INVITE_7_2};
		4'd6: count_down = {`GRAPH_INVITE_6_1, `GRAPH_INVITE_6_2};
		4'd5: count_down = {`GRAPH_INVITE_5_1, `GRAPH_INVITE_5_2};
		4'd4: count_down = {`GRAPH_INVITE_4_1, `GRAPH_INVITE_4_2};
		4'd3: count_down = {`GRAPH_INVITE_3_1, `GRAPH_INVITE_3_2};
		4'd2: count_down = {`GRAPH_INVITE_2_1, `GRAPH_INVITE_2_2};
		4'd1: count_down = {`GRAPH_INVITE_1_1, `GRAPH_INVITE_1_2};
		4'd0: count_down = {`FONT_NONE, `FONT_NONE};
		default: count_down = {`FONT_NONE, `FONT_NONE};
	endcase

always @*
	if(~rst_n || (state != `STAT_GAME_INVITE))
		data_out = {`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE};
	else
		data_out = {`FONT_NONE,
					count_down,
					`FONT_NONE, 
					`GRAPH_INVITE_WORD_1, `GRAPH_INVITE_WORD_2, 
					`GRAPH_INVITE_WORD_3, `GRAPH_INVITE_WORD_4, 
					`GRAPH_INVITE_WORD_5, `GRAPH_INVITE_WORD_6, 
					`GRAPH_INVITE_WORD_7, `GRAPH_INVITE_WORD_8, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE};


endmodule