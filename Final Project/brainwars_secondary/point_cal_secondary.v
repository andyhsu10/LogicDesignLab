`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu & Hsin-Ho Lu
//
// Create Date:    18:30:33 06/23/2015
// Module Name:    point_cal_secondary
// Project Name:   2015 Spring Logic Design Laboratory Final Project
// Revision:
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module point_cal_secondary(
    score_unit, //unit score (O)
    score_tens, //tens score (O)
    score_hund, //hund score (O)
    score, //binary score (O)
    clk, //100 Hz clock (I)
    rst_n, //active low reset (I)
    game_en, //game enable (I)
    state, //fsm state (I)
	flick_master_point, //flick master point (I)
	mora_point, //touch number point (I)
	high_or_low_point, //high or low point (I)
	rainfall_point //rainfall point (I)
);

//I/Os
output [3:0] score_unit; //unit score
output [3:0] score_tens; //tens score
output [3:0] score_hund; //hund score
output [7:0] score; //binary score
input clk; //100 Hz clock
input rst_n; //active low reset
input [2:0] game_en; //game enable
input [3:0] state; //fsm state
input flick_master_point; //flick master point
input mora_point; //follow order point
input high_or_low_point; //high or low point
input rainfall_point; //rainfall point

reg point; //points
reg [7:0] score, score_tmp; //binary score

always @(game_en)
	case(game_en)
		3'b000: point = flick_master_point;
		3'b001: point = mora_point;
		3'b010: point = high_or_low_point;
		3'b011: point = rainfall_point;
		default: point = 1'b0;
	endcase

//Combinational logics
always @(score)
	score_tmp = score + point;

//Sequential lodics: Flip flops
always @(posedge clk or negedge rst_n)
	if(~rst_n || (state == `STAT_INITIAL))
		score <= 8'd0;
	else
		score <= score_tmp;

binary_converter binary_convert(
	.answer_in(score), //binary answer (I)
	.answer_unit(score_unit), //answer unit digit (O)
	.answer_tens(score_tens), //answer tens digit (O)
	.answer_hund(score_hund) //answer hundreds digit (O)
);

endmodule
