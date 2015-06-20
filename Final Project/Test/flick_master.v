`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:49:08 06/19/2015 
// Design Name: 
// Module Name:    flick_master 
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
`include "global.v"
module flick_master(
	clk_100,				// 100 HZ (I)
	clk_1,				// 1Hz (I)
	rst_n,				// reset (I)
	game_en,				// enable to play game (I)
	key,					// keypad (I)
	pressed,				// if key pad was pressed (I)
	data_output,		// to ram_ctrl 128b (O)
	game_next_state,	// 1: finish 0:playing (O)
	point					// 1:get point 0:no point got (O)
);

input clk_100, clk_1, rst_n;
input [2:0]game_en;
input [3:0]key;
input pressed;

output reg [127:0]data_output;
output game_next_state;
output point;

wire [3:0]rand_number;
reg enable;
reg reset_n;

always@*
if( game_en != 3'b000 || game_next_state == 1'b1 || rst_n == 1'b0)
	reset_n = 1'b0;
else
	reset_n = 1'b1;


game_duration_cnt D_CNT(
	.clk(clk_1),		//1 Hz (I)
	.rst_n(reset_n),	//reset (I)
	.game_en(enable),	//1:play game 0:no game (I)
	.end_game(game_next_state)	//1:game over 0:game going (O)
);

rand_0_to_7 RAND(
	.clk(clk_100),//clk_100 or faster
	.rst_n(reset_n),
	.key(key),
	.pressed(pressed),
	.rand_out(rand_number),
	.point_out(point)
);

always@*
if (game_en == 3'b000)
	enable = 1'b1;
else
	enable = 1'b0;

always@*
begin
	case (rand_number)
		3'd0:
			data_output = {8'd0, 8'd0, 8'd0, 8'd0, 
								8'd0, `GRAPH_FLICK_MASTER_1_up_lu, `GRAPH_FLICK_MASTER_1_up_ru, 8'd0,
								8'd0, `GRAPH_FLICK_MASTER_1_up_ld, `GRAPH_FLICK_MASTER_1_up_rd, 8'd0,
								8'd0, 8'd0, 8'd0, 8'd0};
		3'd1:
			data_output = {8'd0, 8'd0, 8'd0, 8'd0, 
								8'd0, `GRAPH_FLICK_MASTER_1_down_lu, `GRAPH_FLICK_MASTER_1_down_ru, 8'd0,
								8'd0, `GRAPH_FLICK_MASTER_1_down_ld, `GRAPH_FLICK_MASTER_1_down_rd, 8'd0,
								8'd0, 8'd0, 8'd0, 8'd0};
		3'd2:
			data_output = {8'd0, 8'd0, 8'd0, 8'd0, 
								8'd0, `GRAPH_FLICK_MASTER_1_right_lu, `GRAPH_FLICK_MASTER_1_right_ru, 8'd0,
								8'd0, `GRAPH_FLICK_MASTER_1_right_ld, `GRAPH_FLICK_MASTER_1_right_rd, 8'd0,
								8'd0, 8'd0, 8'd0, 8'd0};
		3'd3:
			data_output = {8'd0, 8'd0, 8'd0, 8'd0, 
								8'd0, `GRAPH_FLICK_MASTER_1_left_lu, `GRAPH_FLICK_MASTER_1_left_ru, 8'd0,
								8'd0, `GRAPH_FLICK_MASTER_1_left_ld, `GRAPH_FLICK_MASTER_1_left_rd, 8'd0,
								8'd0, 8'd0, 8'd0, 8'd0};
		3'd4:
			data_output = {8'd0, 8'd0, 8'd0, 8'd0, 
								8'd0, `GRAPH_FLICK_MASTER_0_up_lu, `GRAPH_FLICK_MASTER_0_up_ru, 8'd0,
								8'd0, `GRAPH_FLICK_MASTER_0_up_ld, `GRAPH_FLICK_MASTER_0_up_rd, 8'd0,
								8'd0, 8'd0, 8'd0, 8'd0};
		3'd5:
			data_output = {8'd0, 8'd0, 8'd0, 8'd0, 
								8'd0, `GRAPH_FLICK_MASTER_0_down_lu, `GRAPH_FLICK_MASTER_0_down_ru, 8'd0,
								8'd0, `GRAPH_FLICK_MASTER_0_down_ld, `GRAPH_FLICK_MASTER_0_down_rd, 8'd0,
								8'd0, 8'd0, 8'd0, 8'd0};
		3'd6:
			data_output = {8'd0, 8'd0, 8'd0, 8'd0, 
								8'd0, `GRAPH_FLICK_MASTER_0_right_lu, `GRAPH_FLICK_MASTER_0_right_ru, 8'd0,
								8'd0, `GRAPH_FLICK_MASTER_0_right_ld, `GRAPH_FLICK_MASTER_0_right_rd, 8'd0,
								8'd0, 8'd0, 8'd0, 8'd0};
		3'd7:
			data_output = {8'd0, 8'd0, 8'd0, 8'd0, 
								8'd0, `GRAPH_FLICK_MASTER_0_left_lu, `GRAPH_FLICK_MASTER_0_left_ru, 8'd0,
								8'd0, `GRAPH_FLICK_MASTER_0_left_ld, `GRAPH_FLICK_MASTER_0_left_rd, 8'd0,
								8'd0, 8'd0, 8'd0, 8'd0};
		default:
			data_output = 128'd0;
			
	endcase
end





endmodule
