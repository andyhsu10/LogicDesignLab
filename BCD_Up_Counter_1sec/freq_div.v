`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:20:40 03/19/2015 
// Design Name: 
// Module Name:    freq_div 
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
`define FREQ_DIV_BIT 17
module freq_div(
	clk_out, //divided clock output
	clk_ctl, //divided clock output for scan freq
	clk, //global clock input
	rst_n //active low reset
    );
	 
output clk_out; //divided output
output [1:0] clk_ctl; //divided output for scan freq
input clk; //global clock input
input rst_n; //active low reset

reg clk_out; // clk output(in always block)
reg [1:0] clk_ctl; //clk output(in always block)
reg [7:0] cnt_l; //temp buf of the counter
reg [5:0] cnt_h; //temp buf of the counter
reg [`FREQ_DIV_BIT-1:0] cnt_tmp; //input to dff(in always block)

//Combinational logics: increment, neglecting overflow
always @(clk_ctl or cnt_h or clk_out or cnt_l)
	cnt_tmp = {clk_ctl,cnt_h,clk_out,cnt_l} + 1'b1;

//Sequential logics: Flip flops
always @(posedge clk or negedge rst_n)
	if(~rst_n) {clk_ctl,cnt_h,clk_out,cnt_l} <= `FREQ_DIV_BIT'd0;
	else {clk_ctl,cnt_h,clk_out,cnt_l} <= cnt_tmp;

endmodule
