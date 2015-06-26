`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu & Hsin-Ho Lu
//
// Create Date:    16:36:11 06/22/2015
// Module Name:    follow_order
// Project Name:   2015 Spring Logic Design Laboratory Final Project
// Revision:
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
`define STAT_START 2'b00
`define STAT_SHOW 2'b01
`define STAT_PLAY 2'b10
module follow_order(
    game_en, //game enable (I)
    clk, //100 Hz clock (I)
    clk_2, //2 Hz clock (I)
    key, //returned pressed key (I)
	pressed, //whether key pressed (1) or not (0) (I)
    random, //randow value 3-bit (I)
    rst_n, //active low reset (I)
//    state, //debug
//    cnt2, //debug
	check1, //debug
    data_output, // to ram_ctrl 128b (O)
	point // 1:get point 0:no point got (O)
);

//I/Os
input clk; //100 Hz clock
input clk_2; //2 Hz clock
input pressed; //whether key pressed (1) or not (0)
input rst_n; //active low reset
input [2:0] random; //randow value 3-bit
input [2:0] game_en; //game enable
input [3:0] key; //returned pressed key
output point; //1:get point 0:no point got
//output [1:0] state;
//output [1:0] cnt2;
output [15:0] check1;
output [127:0] data_output;

reg correct;
reg show;
reg point; //1:get point 0:no point got
reg [1:0] state, next_state;
reg [1:0] cnt1, cnt1_tmp;
reg [1:0] cnt2, cnt2_tmp;
reg [1:0] cnt3, cnt3_tmp;
reg [3:0] key_tmp;
reg [15:0] check1, check2;
reg [127:0] data_output;

always @(key)
	case(key)
		`KEY_8: key_tmp = 4'd0;
		`KEY_5: key_tmp = 4'd1;
		`KEY_2: key_tmp = 4'd2;
		`KEY_A: key_tmp = 4'd3;
		`KEY_9: key_tmp = 4'd4;
		`KEY_6: key_tmp = 4'd5;
		`KEY_3: key_tmp = 4'd6;
		`KEY_B: key_tmp = 4'd7;
		default: key_tmp = 4'd15;
	endcase

//Counter
always @(cnt1)
	cnt1_tmp = cnt1 + 1'b1;

//Sequential lodics: Flip flops
always @(posedge clk or negedge rst_n)
	if(~rst_n || (game_en != 3'b010) || (state != `STAT_START))
		cnt1 <= 2'd0;
	else
		cnt1 <= cnt1_tmp;

//FSM state transition
always @(posedge clk or negedge rst_n)
	if(~rst_n || (game_en != 3'b010))
		state <= `STAT_START;
	else
		state <= next_state;

//FSM state decision
always @*
	case(state)
		`STAT_START:
			if((check1[3:0] != 4'd15) && (check1[7:4] != 4'd15) && (check1[11:8] != 4'd15) && (check1[15:12] != 4'd15))
				next_state = `STAT_SHOW;
			else
				next_state = `STAT_START;
		`STAT_SHOW:
			if(show)
				next_state = `STAT_START;
			else
				next_state = `STAT_SHOW;
		`STAT_PLAY:
			if(correct)
				next_state = `STAT_START;
			else
				next_state = `STAT_PLAY;
		default:
			next_state = `STAT_START;
	endcase

always @(posedge clk or negedge rst_n)
	if(~rst_n || (game_en != 3'b010) || correct)
		check1 <= 16'b1111111111111111;
	else if((cnt1 == 2'b00) && (state == `STAT_START))
		check1[3:0] <= random;
	else if((cnt1 == 2'b01) && (check1[3:0] != random) && (state == `STAT_START))
		check1[7:4] <= random;
	else if((cnt1 == 2'b10) && (check1[3:0] != random) && (check1[7:4] != random) && (state == `STAT_START))
		check1[11:8] <= random;
	else if((cnt1 == 2'b11) && (check1[3:0] != random) && (check1[7:4] != random) && (check1[11:8] != random) && (state == `STAT_START))
		check1[15:12] <= random;

//Counter
always @(cnt2)
	cnt2_tmp = cnt2 + 1'b1;

//Sequential lodics: Flip flops
always @(posedge clk_2 or negedge rst_n)
	if(~rst_n || (game_en != 3'b010) || (state != `STAT_SHOW))
		cnt2 <= 2'd0;
	else
		cnt2 <= cnt2_tmp;

reg clk_tmp;
//Counter
always @(cnt3)
	cnt3_tmp = cnt3 + 1'b1;

//Sequential lodics: Flip flops
always @(posedge clk_tmp or negedge rst_n)
	if(~rst_n || (game_en != 3'b010) || (state != `STAT_SHOW))
		cnt3 <= 2'd0;
	else
		cnt3 <= cnt3_tmp;

always @(posedge clk or negedge rst_n)
	if(~rst_n || (game_en != 3'b010) || (state != `STAT_PLAY))
		begin
			clk_tmp = 1'b0;
			correct = 1'b0;
		end
	else if(state != `STAT_SHOW)
		show = 1'b0;
	else if((cnt2 == 2'b00) && (state == `STAT_SHOW))
		begin
			show = 1'b0;
			check2[3:0] = check1[3:0];
		end
	else if((cnt2 == 2'b01) && (state == `STAT_SHOW))
		begin
			show = 1'b0;
			check2[7:4] = check1[7:4];
		end
	else if((cnt2 == 2'b10) && (state == `STAT_SHOW))
		begin
			show = 1'b0;
			check2[11:8] = check1[11:8];
		end
	else if((cnt2 == 2'b11) && (state == `STAT_SHOW))
		begin
			show = 1'b1;
			check2[15:12] = check1[15:12];
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b00) && (key_tmp == 4'd0) && (check2[3:0] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b0;
			check2[3:0] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b00) && (key_tmp == 4'd1) && (check2[3:0] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b0;
			check2[3:0] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b00) && (key_tmp == 4'd2) && (check2[3:0] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b0;
			check2[3:0] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b00) && (key_tmp == 4'd3) && (check2[3:0] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b0;
			check2[3:0] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b00) && (key_tmp == 4'd4) && (check2[3:0] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b0;
			check2[3:0] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b00) && (key_tmp == 4'd5) && (check2[3:0] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b0;
			check2[3:0] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b00) && (key_tmp == 4'd6) && (check2[3:0] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b0;
			check2[3:0] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b00) && (key_tmp == 4'd7) && (check2[3:0] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b0;
			check2[3:0] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b01) && (key_tmp == 4'd0) && (check2[7:4] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b0;
			check2[7:4] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b01) && (key_tmp == 4'd1) && (check2[7:4] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b0;
			check2[7:4] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b01) && (key_tmp == 4'd2) && (check2[7:4] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b0;
			check2[7:4] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b01) && (key_tmp == 4'd3) && (check2[7:4] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b0;
			check2[7:4] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b01) && (key_tmp == 4'd4) && (check2[7:4] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b0;
			check2[7:4] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b01) && (key_tmp == 4'd5) && (check2[7:4] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b0;
			check2[7:4] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b01) && (key_tmp == 4'd6) && (check2[7:4] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b0;
			check2[7:4] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b01) && (key_tmp == 4'd7) && (check2[7:4] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b0;
			check2[7:4] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b10) && (key_tmp == 4'd0) && (check2[11:8] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b0;
			check2[11:8] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b10) && (key_tmp == 4'd1) && (check2[11:8] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b0;
			check2[11:8] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b10) && (key_tmp == 4'd2) && (check2[11:8] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b0;
			check2[11:8] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b10) && (key_tmp == 4'd3) && (check2[11:8] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b0;
			check2[11:8] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b10) && (key_tmp == 4'd4) && (check2[11:8] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b0;
			check2[11:8] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b10) && (key_tmp == 4'd5) && (check2[11:8] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b0;
			check2[11:8] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b10) && (key_tmp == 4'd6) && (check2[11:8] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b0;
			check2[11:8] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b10) && (key_tmp == 4'd7) && (check2[11:8] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b0;
			check2[11:8] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b11) && (key_tmp == 4'd0) && (check2[15:12] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b1;
			check2[15:12] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b11) && (key_tmp == 4'd1) && (check2[15:12] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b1;
			check2[15:12] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b11) && (key_tmp == 4'd2) && (check2[15:12] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b1;
			check2[15:12] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b11) && (key_tmp == 4'd3) && (check2[15:12] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b1;
			check2[15:12] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b11) && (key_tmp == 4'd4) && (check2[15:12] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b1;
			check2[15:12] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b11) && (key_tmp == 4'd5) && (check2[15:12] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b1;
			check2[15:12] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b11) && (key_tmp == 4'd6) && (check2[15:12] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b1;
			check2[15:12] = 4'd15;
		end
	else if((state == `STAT_PLAY) && pressed && (cnt3 == 2'b11) && (key_tmp == 4'd7) && (check2[15:12] == key_tmp))
		begin
			clk_tmp = 1'b1;
			point = 1'b1;
			correct = 1'b1;
			check2[15:12] = 4'd15;
		end
	else
		begin
			clk_tmp = 1'b0;
			point = 1'b0;
			correct = 1'b0;
		end

reg [63:0] graph1, graph2, graph3, graph4;
always @(check2[3:0])
	case(check2[3:0])
		4'd0: graph1 = {`FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `GRAPH_WHITE_BLOCK};
		4'd1: graph1 = {`FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `GRAPH_WHITE_BLOCK, `FONT_NONE};
		4'd2: graph1 = {`FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `GRAPH_WHITE_BLOCK, `FONT_NONE, `FONT_NONE};
		4'd3: graph1 = {`FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `GRAPH_WHITE_BLOCK, `FONT_NONE, `FONT_NONE, `FONT_NONE};
		4'd4: graph1 = {`FONT_NONE, `FONT_NONE, `FONT_NONE, `GRAPH_WHITE_BLOCK, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE};
		4'd5: graph1 = {`FONT_NONE, `FONT_NONE, `GRAPH_WHITE_BLOCK, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE};
		4'd6: graph1 = {`FONT_NONE, `GRAPH_WHITE_BLOCK, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE};
		4'd7: graph1 = {`GRAPH_WHITE_BLOCK, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE};
		default: graph1 = 64'd0;
	endcase

always @(check2[7:4])
	case(check2[7:4])
		4'd0: graph2 = {`FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `GRAPH_WHITE_BLOCK};
		4'd1: graph2 = {`FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `GRAPH_WHITE_BLOCK, `FONT_NONE};
		4'd2: graph2 = {`FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `GRAPH_WHITE_BLOCK, `FONT_NONE, `FONT_NONE};
		4'd3: graph2 = {`FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `GRAPH_WHITE_BLOCK, `FONT_NONE, `FONT_NONE, `FONT_NONE};
		4'd4: graph2 = {`FONT_NONE, `FONT_NONE, `FONT_NONE, `GRAPH_WHITE_BLOCK, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE};
		4'd5: graph2 = {`FONT_NONE, `FONT_NONE, `GRAPH_WHITE_BLOCK, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE};
		4'd6: graph2 = {`FONT_NONE, `GRAPH_WHITE_BLOCK, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE};
		4'd7: graph2 = {`GRAPH_WHITE_BLOCK, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE};
		default: graph2 = 64'd0;
	endcase

always @(check2[11:8])
	case(check2[11:8])
		4'd0: graph3 = {`FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `GRAPH_WHITE_BLOCK};
		4'd1: graph3 = {`FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `GRAPH_WHITE_BLOCK, `FONT_NONE};
		4'd2: graph3 = {`FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `GRAPH_WHITE_BLOCK, `FONT_NONE, `FONT_NONE};
		4'd3: graph3 = {`FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `GRAPH_WHITE_BLOCK, `FONT_NONE, `FONT_NONE, `FONT_NONE};
		4'd4: graph3 = {`FONT_NONE, `FONT_NONE, `FONT_NONE, `GRAPH_WHITE_BLOCK, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE};
		4'd5: graph3 = {`FONT_NONE, `FONT_NONE, `GRAPH_WHITE_BLOCK, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE};
		4'd6: graph3 = {`FONT_NONE, `GRAPH_WHITE_BLOCK, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE};
		4'd7: graph3 = {`GRAPH_WHITE_BLOCK, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE};
		default: graph3 = 64'd0;
	endcase

always @(check2[15:12])
	case(check2[15:12])
		4'd0: graph4 = {`FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `GRAPH_WHITE_BLOCK};
		4'd1: graph4 = {`FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `GRAPH_WHITE_BLOCK, `FONT_NONE};
		4'd2: graph4 = {`FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `GRAPH_WHITE_BLOCK, `FONT_NONE, `FONT_NONE};
		4'd3: graph4 = {`FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `GRAPH_WHITE_BLOCK, `FONT_NONE, `FONT_NONE, `FONT_NONE};
		4'd4: graph4 = {`FONT_NONE, `FONT_NONE, `FONT_NONE, `GRAPH_WHITE_BLOCK, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE};
		4'd5: graph4 = {`FONT_NONE, `FONT_NONE, `GRAPH_WHITE_BLOCK, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE};
		4'd6: graph4 = {`FONT_NONE, `GRAPH_WHITE_BLOCK, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE};
		4'd7: graph4 = {`GRAPH_WHITE_BLOCK, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE, `FONT_NONE};
		default: graph4 = 64'd0;
	endcase

always @*
	data_output = {`FONT_NONE, `FONT_NONE,
				   `FONT_NONE, `FONT_NONE,
				   (graph1 | graph2 | graph3 | graph4),
				   `FONT_NONE, `FONT_NONE,
				   `FONT_NONE, `FONT_NONE};

endmodule
