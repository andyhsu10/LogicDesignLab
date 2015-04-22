`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:46:37 04/18/2015 
// Design Name: 
// Module Name:    single_digit_add_sub_mult 
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
module single_digit_add_sub_mult(
	display, //SSD output
	control, //SSD control signal
	row_n, //scanned row index
	clk, //global clock input
	col_n, //pressed column index
	rst_n //low active reset
);

//I/Os
output [14:0] display; //SSD output
output [3:0] control; //SS control signal
output [3:0] row_n; //scanned row index
input clk; //global clock input
input [3:0] col_n; //pressed colume index
input rst_n; //low active reset

//Wires
wire clk_1, clk_100, de_add, de_minus, de_equal, pressed;
wire pos_neg;
wire num_enable1, num_enable2, ans_enable;
wire [1:0] clk_ctl;
wire [2:0] state;
wire [3:0] key;
wire [3:0] left_num, right_num;
wire [3:0] ans_unit, ans_tens;
wire [3:0] bcd_out1, bcd_out2, bcd_out3;
wire [3:0] bcd_out;
wire [7:0] ans_out;
wire [7:0] left_value, right_value;

freq_div divider(
	.clk_ctl(clk_ctl), //divided clock output for scan freq
	.clk(clk), //global clock input
	.rst_n(rst_n) //active low reset
);

clock_generator clk_generate(
	.clk(clk), //clock from crystal
	.rst_n(rst_n), //active low reset
	.clk_1(clk_1), //generated 1 Hz clock
 	.clk_100(clk_100) //generated 100 Hz clock
);

keypad_scan key_scan(
	.clk(clk_100), //scan clock
	.rst_n(rst_n), //low active reset
	.col_n(col_n), //pressed column index
	.row_n(row_n), //scanned row index
	.key(key), //returned pressed key
	.pressed(pressed) //whether key pressed (1) or not (0)
);

fsm fsm(
	.num_enable1(num_enable1), //number storage enabled 1
	.num_enable2(num_enable2), //number storage enabled 2
	.ans_enable(ans_enable), //answer enable
	.key(key), //key input
	.clk(clk_1), //global clock signal
	.rst_n(rst_n) //low active reset
);

num_store left(
	.num_out(left_num), //number output
	.num_in(key), //number input
	.clk(clk_100), //clock
	.enable(num_enable1), //enable for storing in value
	.pressed(pressed), //button pressed
	.rst_n(rst_n) //active low reset
);

num_store right(
	.num_out(right_num), //number output
	.num_in(key), //number input
	.clk(clk_100), //clock
	.enable(num_enable2), //enable for storing in value
	.pressed(pressed), //button pressed
	.rst_n(rst_n) //active low reset
);

answer_store answer(
	.answer_out(ans_out), //binary answer output
	.pos_neg(pos_neg), //determine whether the ans is positive(0) or negative(1)
	.left_in(left_num), //augend & minuend input
	.right_in(right_num), //addend & subtrahend input
	.clk(clk_100), //clock
	.enable(ans_enable), //enable
	.state(state), //states for add or minus
	.rst_n(rst_n) //active low reset
);

binary_converter converter(
	.answer_in(ans_out), //binary answer input
	.pos_neg(pos_neg), //positive or negative
	.answer_unit(ans_unit), //answer unit digit output
	.answer_tens(ans_tens), //answer tens digit output
);

display_ctl display_controller(
    .bcd_out1(bcd_out1), //bcd output 1
    .bcd_out2(bcd_out2), //bcd output 2
    .bcd_out3(bcd_out3), //bcd output 3
    .state(state), //state input
    .left(left_num), //left part digit input
    .right(right_num), //right part digit input
    .ans_unit(ans_unit), //answer unit digit input
    .ans_tens(ans_tens), //answer tens digit input
);

scan_ctl scan_control(
	.bcd_in1(bcd_out1),
 	.bcd_in2(bcd_out2),
	.bcd_in3(bcd_out3),
	.clk_ctl(clk_ctl),
	.ssd_ctl(control),
  	.bcd_out(bcd_out)
);

ssd_decoder decoder(
	.ssd_out(display), //14-segment display output
	.bcd(bcd_out) //BCD input
);

endmodule