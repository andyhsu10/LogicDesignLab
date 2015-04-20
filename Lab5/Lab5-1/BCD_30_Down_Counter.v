`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:08:55 03/21/2015 
// Design Name: 
// Module Name:    BCD_99_Up_Counter 
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
module BCD_30_Down_Counter(
	control,
	display,
	led,
	clk,
	pause,
	rst_n
    );
	 
output [3:0] control;
output [14:0] display;
output [15:0] led;
input clk, pause, rst_n;

wire w1, w2, w7;
wire [1:0] w3;
wire [3:0] w4, w5, w6;

freq_div F0(.clk_out(w1),.clk_ctl(w3),.clk(clk),.rst_n(rst_n));
fsm FS0(.count_enable(w7),.in(pause),.clk(w1),.rst_n(rst_n));
bcd_cnt B0(.out0(w4),.out1(w5),.led(led),.clk(w1),.pause(w7),.rst_n(rst_n));
scan_ctl S0(.display0(w4),.display1(w5),.clk_ctl(w3),.ctl(control),.out(w6));
bcd_display D0(.display(display),.bcd(w6));

endmodule
