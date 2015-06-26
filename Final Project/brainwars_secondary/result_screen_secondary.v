`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu & Hsin-Ho Lu
//
// Create Date:    13:31:42 06/25/2015
// Module Name:    result_screen_secondary
// Project Name:   2015 Spring Logic Design Laboratory Final Project
// Revision:
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module result_screen_secondary(
	clk, //1Hz clock (I)
	state, //fsm state (I)
	score_main, //main board score (I)
	score_secondary, //secondary board score (I)
	rst_n, //active low reset (I)
	result_next_state, //game result screen to next state (O)
	win_lose_main, //win or lose to main board (O)
	data_out //data output (O)
);

//I/Os
input clk; //1Hz clock
input [3:0] state; //fsm state
input [7:0] score_main, score_secondary; //two board's score
input rst_n; //active low reset
output result_next_state; //game result screen to next state
output [1:0] win_lose_main; //win or lose to main board
output [127:0] data_out; //data output

reg result_next_state;
reg [1:0] win_lose_main;
reg [1:0] win_lose_secondary;
reg [2:0] cnt, cnt_tmp;
reg [127:0] data_out;

//Combinational logics
always @(cnt)
	cnt_tmp = cnt + 1'b1;

//Sequential lodics: Flip flops
always @(posedge clk or negedge rst_n)
	if(~rst_n || (state != `STAT_RESULT))
		begin
			cnt <= 3'd0;
			result_next_state = 1'b0;
		end
	else if(cnt == 3'd6)
		begin
			cnt <= 3'd0;
			result_next_state = 1'b1;
		end
	else
		begin
			cnt <= cnt_tmp;
			result_next_state = 1'b0;
		end

always @*
	if(~rst_n || (state != `STAT_RESULT))
		begin
			win_lose_main = 2'd3;
			win_lose_secondary = 2'd3;
		end
	else if(score_main > score_secondary)
		begin
			win_lose_main = 2'd0;
			win_lose_secondary = 2'd1;
		end
	else if(score_main < score_secondary)
		begin
			win_lose_main = 2'd1;
			win_lose_secondary = 2'd0;
		end
	else
		begin
			win_lose_main = 2'd2;
			win_lose_secondary = 2'd2;
		end

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
	else if(win_lose_secondary == 2'd0)
		data_out = {`FONT_NONE, `FONT_NONE,
					`FONT_NONE, `FONT_NONE,
					`GRAPH_WINNER_1, `GRAPH_WINNER_2, 
					`GRAPH_WINNER_3, `GRAPH_WINNER_4, 
					`FONT_NONE, `FONT_NONE,
					`FONT_NONE, `FONT_NONE,
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE};
	else if(win_lose_secondary == 2'd1)
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