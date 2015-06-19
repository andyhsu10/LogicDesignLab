`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu & Hsin-Ho Lu
//
// Create Date:    14:21:59 06/19/2015
// Module Name:    initial_screen
// Project Name:   2015 Spring Logic Design Laboratory Final Project
// Revision:
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module initial_screen(
	clk, //2Hz clock (I)
	state, //fsm state (I)
	rst_n, //active low reset (I)
	data_out //data output (O)
);

//I/Os
input clk; //1Hz clock
input [3:0] state; //fsm state
input rst_n; //active low reset
output [127:0] data_out; //data output

reg [127:0] data_out, data_out_tmp;
always @*
	if(~rst_n || (state != `STAT_INITIAL))
		data_out = {`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE};
	else
		data_out = data_out_tmp;

always @(clk)
	case(clk)
		1'b0:
			begin
				data_out_tmp = {`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`GRAPH_INITIAL_1, `GRAPH_INITIAL_2, 
					`GRAPH_INITIAL_3, `GRAPH_INITIAL_4, 
					`GRAPH_INITIAL_5, `GRAPH_INITIAL_6, 
					`GRAPH_INITIAL_7, `GRAPH_INITIAL_8, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE};
			end
		1'b1:
			begin
				data_out_tmp = {`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE};
			end
		default:
			begin
				data_out_tmp = {`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE, 
					`FONT_NONE, `FONT_NONE};
			end
		
	endcase
endmodule