`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:08:55 03/21/2015 
// Design Name: 
// Module Name:    BCD_Up_Counter_1sec 
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
module BCD_Up_Counter_1sec(
	control,
	display,
	clk,
	rst_n
    );
	 
output [3:0] control;
output [14:0] display;
input clk, rst_n;
wire w1, w2 ,w3;
wire [1:0] w4;
wire [3:0] w5, w6, w7;

freq_div F0(.clk_out(w1),.clk_ctl(w4),.clk(clk),.rst_n(rst_n));
combine_freq_div_5 F1(.clk_out(w2),.clk(w1),.rst_n(rst_n));
bcd_cnt B0(.out(w5),.clk_out(w3),.clk(w2),.rst_n(rst_n));
bcd_cnt B1(.out(w6),.clk(w3),.rst_n(rst_n));
scan_ctl S0(.ctl(control),.out(w7),.display0(w5),.display1(w6),.clk_ctl(w4));
bcd_display D0(.display(display),.bcd(w7));

endmodule
