`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu & Hsin-Ho Lu
// 
// Create Date:    10:56:47 06/23/2015 
// Module Name:    next_game 
// Project Name:   2015 Spring Logic Design Laboratory Final Project
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module next_game(
	clk, //1 Hz clock (I)
	state, //fsm state (I)
	rst_n, //acive low reset (I)
	game_next_state //to the next game
);

//I/Os
output game_next_state; //to the next game
input clk; //1 Hz clock
input rst_n; //active low reset
input [3:0] state; //fsm state

reg game_next_state; //to the next state
reg [3:0] cnt, cnt_tmp;

//Combinational logics
always @(cnt)
	cnt_tmp = cnt + 1'b1;

//Sequential lodics: Flip flops
always @(posedge clk or negedge rst_n)
	if(~rst_n || (state == `STAT_STAGE1_DES) || (state == `STAT_STAGE2_DES) || (state == `STAT_STAGE3_DES))
		begin
			cnt <= 6'd0;
			game_next_state = 1'b0;
		end
	else if(cnt == 4'd14)
		begin
			cnt <= 6'd0;
			game_next_state = 1'b1;
		end
	else
		begin
			cnt <= cnt_tmp;
			game_next_state = 1'b0;
		end

endmodule