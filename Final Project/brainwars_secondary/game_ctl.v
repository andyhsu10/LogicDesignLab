`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu & Hsin-Ho Lu
//
// Create Date:    11:20:49 06/20/2015
// Module Name:    game_ctl
// Project Name:   2015 Spring Logic Design Laboratory Final Project
// Revision:
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module game_ctl(
    game_en, //game enable (O)
    clk, //100 Hz clock (I)
    state, //fsm state (I)
    random, //randow value 10-bit (I)
    rst_n //active low reset (I)
);

//I/Os
output [2:0] game_en; //game enable
input clk; //100 Hz clock
input [3:0] state; //fsm state
input [9:0] random; //randow value
input rst_n; //active low reset

wire [2:0] game_decision;

assign game_decision = random % 6;

reg [2:0] game_en; //game enable
reg [8:0] check;

always @(posedge clk or negedge rst_n)
	if(~rst_n || (state == `STAT_RESULT))
		begin
			game_en = 3'd6;
			check = 9'd511;
		end
	else if(state == `STAT_INITIAL)
		begin
			game_en = game_decision;
			check[2:0] = game_decision;
		end
	else if((state == `STAT_GAME_INVITE) && (check[2:0] != game_decision))
		begin
			game_en = game_decision;
			check[5:3] = game_decision;
		end
	else if((state == `STAT_STAGE1_DES) && (check[2:0] != game_decision) && (check[5:3] != game_decision))
		begin
			game_en = game_decision;
			check[8:6] = game_decision;
		end
	else
		begin
			game_en = game_en;
			check = check;
		end

endmodule
