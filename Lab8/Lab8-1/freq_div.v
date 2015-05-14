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
`define FREQ_DIV_BIT 25
module freq_div(
	clk_out, //divided clock output (O)
	clk_fast1, //Debugging use (O)
	clk_fast2, //Debugging use (O)
	clk_ctl, //divided clock output for scan freq (O)
	clk, //global clock input (I)
	rst_n //active low reset
    );
	 
output clk_out; //divided output
output clk_fast1; //degugging use
output clk_fast2; //degugging use
output [1:0] clk_ctl; //divided output for scan freq
input clk; //global clock input
input rst_n; //active low reset

assign clk_fast1 = cnt_h[6];
assign clk_fast2 = cnt_l[6];

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
