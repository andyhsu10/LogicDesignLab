`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:40:41 03/20/2015 
// Design Name: 
// Module Name:    Bin_Up_Cnt 
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
module Bin_Up_Cnt(
	display,
	led,
	clk,
	rst_n
    );

output [14:0] display;
output [3:0] led;
input clk, rst_n; 
wire w1;
wire [3:0] w2;
	 
freq_div F0(.clk_out(w1),.clk(clk),.rst_n(rst_n));
bcd_cnt C0(.out(w2),.clk(w1),.rst_n(rst_n));
bcd_display D0(.display(display),.led(led),.bcd(w2));

endmodule
