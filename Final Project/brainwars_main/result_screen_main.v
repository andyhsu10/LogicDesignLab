`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu & Hsin-Ho Lu
//
// Create Date:    13:50:40 06/25/2015
// Module Name:    result_screen_main
// Project Name:   2015 Spring Logic Design Laboratory Final Project
// Revision:
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module result_screen_main(
	clk, //1Hz clock (I)
	state, //fsm state (I)
	rst_n, //active low reset (I)
	win_lose_main, //win or lose to main board (I)
	data_out //data output (O)
);

//I/Os
input clk; //1Hz clock
input [3:0] state; //fsm state
input rst_n; //active low reset
input [1:0] win_lose_main; //win or lose to main board
output [127:0] data_out; //data output

reg [2:0] cnt, cnt_tmp;
reg [127:0] data_out;

//Combinational logics
always @(cnt)
	cnt_tmp = cnt + 1'b1;

//Sequential lodics: Flip flops
always @(posedge clk or negedge rst_n)
	if(~rst_n || (state != `STAT_RESULT))
		cnt <= 3'd0;
	else if(cnt == 3'd6)
		cnt <= 3'd0;
	else
		cnt <= cnt_tmp;

always @*
	if(~rst_n || (state != `STAT_RESULT))
		data_out = {`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE};
	else if(win_lose_main == 2'd0)
		data_out = {`FONT_NONE, `FONT_NONE,
					`FONT_NONE, `FONT_NONE,
					`GRAPH_WINNER_1, `GRAPH_WINNER_2, 
					`GRAPH_WINNER_3, `GRAPH_WINNER_4, 
					`FONT_NONE, `FONT_NONE,
					`FONT_NONE, `FONT_NONE,
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE};
	else if(win_lose_main == 2'd1)
		data_out = {`FONT_NONE, `FONT_NONE,
					`FONT_NONE, `FONT_NONE,
					`GRAPH_LOSER_1, `GRAPH_LOSER_2, 
					`GRAPH_LOSER_3, `GRAPH_LOSER_4, 
					`FONT_NONE, `FONT_NONE,
					`FONT_NONE, `FONT_NONE,
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE};
	else
		data_out = {`FONT_NONE, `FONT_NONE,
					`FONT_NONE, `FONT_NONE,
					`GRAPH_TIE_1, `GRAPH_TIE_2, 
					`GRAPH_TIE_3, `GRAPH_TIE_4, 
					`FONT_NONE, `FONT_NONE,
					`FONT_NONE, `FONT_NONE,
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE};


endmodule