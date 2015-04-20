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
	state,
	clk,
	value,
	pau_rst
    );
	 
output [3:0] control;
output [14:0] display;
output state;
input clk, value, pau_rst;

wire rst, pause1, pause2, clk_1, clk_100, de_r, cnt_en, value1, value2;
wire [1:0] clk_ctl;
wire [3:0] out, out0, out1, ini_val;

freq_div F_D(.clk_ctl(clk_ctl),.clk(clk),.rst_n(rst));
clock_generator CG(.clk(clk),.rst_n(rst),.clk_1(clk_1),.clk_100(clk_100));

debounce de_in(.clk(clk_100),.rst_n(rst),.pb_in(pau_rst),.pb_debounced(pause1));
one_pulse op_pau(.clk(clk_1),.rst_n(rst),.in_trig(pause1),.out_pulse(pause2));
fsm fsm(.count_enable(cnt_en),.in(pause2),.clk(clk_1),.rst_n(rst));

debounce de_val(.clk(clk_100),.rst_n(rst),.pb_in(value),.pb_debounced(value1));
one_pulse op_val(.clk(clk_1),.rst_n(rst),.in_trig(value1),.out_pulse(value2));
fsm_30_60 F36(.ini(ini_val),.state(state),.in(value2),.clk(clk_1));

debounce reset(.clk(clk_1),.rst_n(rst),.pb_in(pau_rst),.pb_debounced(de_r));
one_pulse op_rst(.clk(clk_1),.rst_n(rst),.in_trig(de_r),.out_pulse(rst));

bcd_cnt BC(.out0(out0),.out1(out1),.ini(ini_val),.clk(clk_1),.pause(cnt_en),.rst_n(rst));
scan_ctl SC(.display0(out0),.display1(out1),.clk_ctl(clk_ctl),.ctl(control),.out(out));
bcd_display BD(.display(display),.bcd(out));

endmodule
