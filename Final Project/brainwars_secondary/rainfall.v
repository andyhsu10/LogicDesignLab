`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu & Hsin-Ho Lu
//
// Create Date:    18:13:14 06/22/2015
// Module Name:    rainfall
// Project Name:   2015 Spring Logic Design Laboratory Final Project
// Revision:
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module rainfall(
    game_en, //game enable (I)
    clk, //100 Hz clock (I)
    key, //returned pressed key (I)
	pressed, //whether key pressed (1) or not (0) (I)
    random, //randow value 2-bit (I)
    rst_n, //active low reset (I)
    data_output, // to ram_ctrl 128b (O)
	point // 1:get point 0:no point got (O)
);

//I/Os
input clk; //100 Hz clock
input pressed; //whether key pressed (1) or not (0)
input rst_n; //active low reset
input [1:0] random; //randow value 4-bit
input [2:0] game_en; //game enable
input [3:0] key; //returned pressed key
output [1:0] point; //1:get point 0:no point got
output [127:0] data_output;

reg correct; //whether the answer is correct
reg [1:0] point; //1:get point 0:no point got
reg [127:0] data_output;

reg [1:0] q0, q1, q2;

always @(posedge clk or negedge rst_n)
	if(~rst_n || (game_en != 3'b101))
		begin
			correct = 1'b0;
			point = 2'd0;
		end
	else if((q0 == 2'b00) && (key == `KEY_7) && (pressed == 1'b1))
		begin
			correct = 1'b1;
			point = 2'd2;
		end
	else if((q0 == 2'b01) && (key == `KEY_1) && (pressed == 1'b1))
		begin
			correct = 1'b1;
			point = 2'd2;
		end
	else if((q0 == 2'b10) && (key == `KEY_1) && (pressed == 1'b1))
		begin
			correct = 1'b1;
			point = 2'd2;
		end
	else if((q0 == 2'b11) && (key == `KEY_7) && (pressed == 1'b1))
		begin
			correct = 1'b1;
			point = 2'd2;
		end
	else
		begin
			correct = 1'b0;
			point = 2'd0;
		end

always @(posedge clk or negedge rst_n)
	if(~rst_n || (game_en != 3'b101))
		begin
			q2 <= random;
			q1 <= {random[0], random[1]};
			q0 <= {random[1], 1'b0};
		end
	else if(correct)
		begin
			q2 <= random;
			q1 <= q2;
			q0 <= q1;
		end
	else
		begin
			q2 <= q2;
			q1 <= q1;
			q0 <= q0;
		end

reg [15:0] graph1, graph2, graph3, graph4;

always @(q2)
	case(q2)
		2'b00: graph1 = {`FONT_NONE, `GRAPH_RAIN};
		2'b01: graph1 = {`GRAPH_RAIN, `FONT_NONE};
		2'b10: graph1 = {`FONT_NONE, `GRAPH_LIGHTNING};
		2'b11: graph1 = {`GRAPH_LIGHTNING, `FONT_NONE};
	endcase

always @(q1)
	case(q1)
		2'b00: graph2 = {`FONT_NONE, `GRAPH_RAIN};
		2'b01: graph2 = {`GRAPH_RAIN, `FONT_NONE};
		2'b10: graph2 = {`FONT_NONE, `GRAPH_LIGHTNING};
		2'b11: graph2 = {`GRAPH_LIGHTNING, `FONT_NONE};
	endcase

always @(q0)
	case(q0)
		2'b00: graph3 = {`FONT_NONE, `GRAPH_RAIN};
		2'b01: graph3 = {`GRAPH_RAIN, `FONT_NONE};
		2'b10: graph3 = {`FONT_NONE, `GRAPH_LIGHTNING};
		2'b11: graph3 = {`GRAPH_LIGHTNING, `FONT_NONE};
	endcase

always @(key)
	case(key)
		`KEY_1: graph4 = {`GRAPH_UMBRELLA, `FONT_NONE};
		`KEY_7: graph4 = {`FONT_NONE, `GRAPH_UMBRELLA};
		default: graph4 = 16'd0;
	endcase
		
always @*
	data_output = {`FONT_NONE,
				graph1,
				`FONT_NONE, 
				`FONT_NONE, 
				graph2, 
				`FONT_NONE,
				`FONT_NONE, 
				graph3,
				`FONT_NONE,
				`FONT_NONE,
				graph4,
				`FONT_NONE};

endmodule
