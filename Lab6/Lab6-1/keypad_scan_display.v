`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:29:18 04/16/2015 
// Design Name: 
// Module Name:    keypad_scan_display 
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
module keypad_scan_display(
	clk,
	rst_n,
	col_n,
	row_n,
	control,
	display,
	pressed
    );

input clk, rst_n;
input [3:0] col_n;
output pressed;
output [3:0] row_n;
output [3:0] control;
output [14:0] display;

wire clk_out;
wire [1:0] clk_ctl;
wire [3:0] key ,out;

freq_div F(.clk_ctl(clk_ctl),.clk(clk),.rst_n(rst_n));
keypad_scan KS(.clk(clk_ctl[1]),.rst_n(rst_n),.col_n(col_n),.row_n(row_n),.key(key),.pressed(pressed));
scan_ctl SC(.display(key),.clk_ctl(clk_ctl),.ctl(control),.out(out));
bcd_display BD(.display(display),.bcd(out));

endmodule
