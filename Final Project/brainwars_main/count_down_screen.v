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
	enable, //module enable signal (I)
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
input enable; //module enable signal
input [3:0] key; //returned pressed key
input pressed; //whether key pressed (1) or not (0)
input [2:0] dialogue_in; //dialogue from another board
input rst_n; //active low reset
output count_down_next_state;
output [2:0] dialogue_out; //dialogue sent to another board
output [127:0] data_out; //data output

reg [6:0] value, value_tmp;
reg clk_count;
reg count_down_next_state;
reg [2:0] dialogue_out;
reg [7:0] dialogue1, dialogue2;

wire [31:0] q0;

//Combinational logics
always @(value)
	value_tmp = value + 1'b1;

//Sequential lodics: Flip flops
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		value <= 7'd0;
	else if((value == 7'd66) && (enable == 1'b1))
		begin
			clk_count = 1'b0;
			count_down_next_state = 1'b1;
		end
	else if(enable == 1'b0)
		begin
			clk_count = 1'b0;
			count_down_next_state = 1'b0;
		end
	else
		begin
			clk_count = clk;
			value <= value_tmp;
			count_down_next_state = 1'b0;
		end

count_down counting_down(
	.q0(q0), //shifter output
	.clk(clk_count), // global clock
	.rst_n(rst_n) //active low reset
);

always @(key)
	case(key)
		`KEY_A:
			begin
				dialogue_out = 3'd0;
				dialogue1 = `GRAPH_SMILE;
			end
		`KEY_2:
			begin
				dialogue_out = 3'd1;
				dialogue1 = `GRAPH_ANGRY;
			end
		`KEY_5:
			begin
				dialogue_out = 3'd2;
				dialogue1 = `GRAPH_SLEEPY;
			end
		`KEY_8:
			begin
				dialogue_out = 3'd3;
				dialogue1 = `GRAPH_SHINE;
			end
		`KEY_0:
			begin
				dialogue_out = 3'd4;
				dialogue1 = `GRAPH_LOVE;
			end
		`KEY_1:
			begin
				dialogue_out = 3'd5;
				dialogue1 = `GRAPH_SAD;
			end
		`KEY_4:
			begin
				dialogue_out = 3'd6;
				dialogue1 = `GRAPH_LIKE;
			end
		`KEY_7:
			begin
				dialogue_out = 3'd7;
				dialogue1 = `GRAPH_FUCK;
			end
	endcase

always @(dialogue_in)
	case(dialogue_in)
		3'd0: dialogue2 = `GRAPH_SMILE;
		3'd1: dialogue2 = `GRAPH_ANGRY;
		3'd2: dialogue2 = `GRAPH_SLEEPY;
		3'd3: dialogue2 = `GRAPH_SHINE;
		3'd4: dialogue2 = `GRAPH_LOVE;
		3'd5: dialogue2 = `GRAPH_SAD;
		3'd6: dialogue2 = `GRAPH_LIKE;
		3'd7: dialogue2 = `GRAPH_FUCK;
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