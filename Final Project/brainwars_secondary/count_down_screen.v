`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu & Hsin-Ho Lu
//
// Create Date:    17:01:00 06/16/2015
// Module Name:    count_down_screen
// Project Name:   2015 Spring Logic Design Laboratory Final Project
// Revision:
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module count_down_screen(
	clk, //global clock (I)
	clk_100, //100 Hz clock (I)
	state, //fsm state (I)
	key, //returned pressed key (I)
	pressed, //whether key pressed (1) or not (0) (I)
	dialogue_in, //dialogue from another board (I)
	rst_n, //active low reset (I)
	count_down_next_state, //(O)
	dialogue_out, //dialogue sent to another board (O)
	data_out //data output (O)
);

//I/Os
input clk; //global clock
input clk_100; //100 Hz clock
input [3:0] state; //fsm state
input [3:0] key; //returned pressed key
input pressed; //whether key pressed (1) or not (0)
input [3:0] dialogue_in; //dialogue from another board
input rst_n; //active low reset
output count_down_next_state;
output [3:0] dialogue_out; //dialogue sent to another board
output [127:0] data_out; //data output

reg [6:0] value, value_tmp;
reg clk_count;
reg count_down_next_state;
reg [3:0] dialogue_out;
reg [3:0] key_tmp;
reg [7:0] dialogue1, dialogue2;
reg [127:0] data_out;

wire de_pressed;
wire [31:0] q0;

count_down counting_down(
	.q0(q0), //shifter output (O)
	.clk(clk), // global clock (I)
	.state(state), //fsm state (I)
	.rst_n(rst_n) //active low reset (I)
);

always @*
	if(~rst_n)
		count_down_next_state = 1'b0;
	else if(q0[31:24] == `GRAPH_LU_21)
		count_down_next_state = 1'b1;
	else
		count_down_next_state = 1'b0;

debounce pressed_debounce(
	.clk(clk_100), //clock control
	.rst_n(rst_n), //reset
	.pb_in(pressed), //push button input
	.pb_debounced(de_pressed) //debounced push button output
);

always @*
	if(de_pressed == 1'b0)
		key_tmp = key;
	else
		key_tmp = `KEY_F;

always @(key_tmp)
	case(key_tmp)
		`KEY_A:
			begin
				dialogue_out = 4'd0;
				dialogue1 = `GRAPH_SMILE;
			end
		`KEY_2:
			begin
				dialogue_out = 4'd1;
				dialogue1 = `GRAPH_ANGRY;
			end
		`KEY_5:
			begin
				dialogue_out = 4'd2;
				dialogue1 = `GRAPH_SLEEPY;
			end
		`KEY_8:
			begin
				dialogue_out = 4'd3;
				dialogue1 = `GRAPH_SHINE;
			end
		`KEY_0:
			begin
				dialogue_out = 4'd4;
				dialogue1 = `GRAPH_LOVE;
			end
		`KEY_1:
			begin
				dialogue_out = 4'd5;
				dialogue1 = `GRAPH_SAD;
			end
		`KEY_4:
			begin
				dialogue_out = 4'd6;
				dialogue1 = `GRAPH_LIKE;
			end
		`KEY_7:
			begin
				dialogue_out = 4'd7;
				dialogue1 = `GRAPH_FUCK;
			end
		default:
			begin
				dialogue_out = 4'd8;
				dialogue1 = `FONT_NONE;
			end
	endcase

always @(dialogue_in)
	case(dialogue_in)
		4'd0: dialogue2 = `GRAPH_SMILE;
		4'd1: dialogue2 = `GRAPH_ANGRY;
		4'd2: dialogue2 = `GRAPH_SLEEPY;
		4'd3: dialogue2 = `GRAPH_SHINE;
		4'd4: dialogue2 = `GRAPH_LOVE;
		4'd5: dialogue2 = `GRAPH_SAD;
		4'd6: dialogue2 = `GRAPH_LIKE;
		4'd7: dialogue2 = `GRAPH_FUCK;
		default: dialogue2 = `FONT_NONE;
	endcase

always @*
	data_out = {`FONT_NONE,
				`FONT_NONE,
				`FONT_NONE,
				`FONT_NONE, 
				`FONT_NONE, 
				q0[31:24], 
				q0[23:16], 
				`FONT_NONE,
				dialogue1,
				q0[15:8],
				q0[7:0], 
				dialogue2,
				`FONT_NONE,
				`FONT_NONE,
				`FONT_NONE,
				`FONT_NONE};

endmodule