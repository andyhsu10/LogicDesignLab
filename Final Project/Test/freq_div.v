`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu & Hsin-Ho Lu
// 
// Create Date:    20:50:22 06/15/2015 
// Module Name:    freq_div
// Project Name:   2015 Spring Logic Design Laboratory Final Project
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`define FREQ_DIV_BIT 25
module freq_div(
	clk_out, //divided clock output (O)
	clk_fast,
	clk_ctl, //divided clock output for scan freq (O)
	clk, //global clock input (I)
	rst_n //active low reset
);
	 
output clk_out; //divided output
output clk_fast;
output [1:0] clk_ctl; //divided output for scan freq
input clk; //global clock input
input rst_n; //active low reset

assign clk_fast = cnt_h[2];

reg clk_out; // clk output(in always block)
reg [1:0] clk_ctl; //clk output(in always block)
reg [14:0] cnt_l; //temp buf of the counter
reg [6:0] cnt_h; //temp buf of the counter
reg [`FREQ_DIV_BIT-1:0] cnt_tmp; //input to dff(in always block)

//Combinational logics: increment, neglecting overflow
always @(clk_out or cnt_h or clk_ctl or cnt_l)
	cnt_tmp = {clk_out,cnt_h,clk_ctl,cnt_l} + 1'b1;

//Sequential logics: Flip flops
always @(posedge clk or negedge rst_n)
	if(~rst_n) {clk_out,cnt_h,clk_ctl,cnt_l} <= `FREQ_DIV_BIT'd0;
	else {clk_out,cnt_h,clk_ctl,cnt_l} <= cnt_tmp;

endmodule
