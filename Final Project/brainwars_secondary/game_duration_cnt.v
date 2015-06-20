`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:18:05 06/19/2015 
// Design Name: 
// Module Name:    game_duration_cnt 
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
module game_duration_cnt(
	clk,		//1 Hz (I)
	rst_n,	//reset (I)
	game_en,	//1:play game 0:no game (I)
	end_game	//1:game over 0:game going (O)
);

input clk, game_en, rst_n;
output reg end_game;
reg [3:0]CNT, CNT_t;

always@*
if (CNT == 4'd0)
	CNT_t = 4'd10;
else
	CNT_t = CNT - 4'd1;

//10s down counter
always@(posedge clk or negedge rst_n)
if (~rst_n)
	CNT = 4'd10;
else
	CNT = CNT_t;

always@*
if( CNT == 4'd0)
	end_game = 1'b1;
else
	end_game = 1'b0;


endmodule
