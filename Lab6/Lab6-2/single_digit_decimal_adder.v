`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:46:37 04/18/2015 
// Design Name: 
// Module Name:    single_digit_decimal_adder 
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
module single_digit_decimal_adder(
	display, //SSD output
	control, //SSD control signal
	row_n, //scanned row index
	clk, //global clock input
	add_equal, //add and equal button
	col_n, //pressed column index
	rst_n //low active reset
);

//I/Os
output [14:0] display; //SSD output
output [3:0] control; //SS control signal
output [3:0] row_n; //scanned row index
input clk; //global clock input
input add_equal; //add and equal button
input [3:0] col_n; //pressed colume index
input rst_n; //low active reset

//Wires
wire clk_1, clk_100, de_add_equal, pressed;
wire num_enable1, num_enable2, ans_enable;
wire [1:0] clk_ctl;
wire [3:0] key, addend_num, augend_num;
wire [3:0] ans_unit, ans_tens;
wire [3:0] bcd_out;
wire [4:0] ans_out;

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

debounce_one_pulse de_pulse(
	.de_clk(clk_100), //debounce clock
	.pulse_clk(clk_100), //one pulse clock
	.rst_n(rst_n), //low active reset
	.in(add_equal), //push button input
	.out(de_add_equal) //pulsed push button output
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
	.in(de_add_equal), //input control
	.clk(clk_100), //global clock signal
	.rst_n(rst_n)
);

num_store addend(
	.num_out(addend_num), //number output
	.num_in(key), //number input
	.clk(clk_100), //clock
	.enable(num_enable1), //enable for storing in value
	.pressed(pressed), //button pressed
	.rst_n(rst_n)
);

num_store augend(
	.num_out(augend_num), //number output
	.num_in(key), //number input
	.clk(clk_100), //clock
	.enable(num_enable2), //enable for storing in value
	.pressed(pressed), //button pressed
	.rst_n(rst_n)
);

answer_store answer(
	.answer_out(ans_out), //answer output
	.addend_in(addend_num), //addend input
	.augend_in(augend_num), //augend input
	.clk(clk_1), //clock
	.enable(ans_enable), //enable
	.rst_n(rst_n) //active low reset
);

binary_converter converter(
	.answer_unit(ans_unit), //answer unit digit output
	.answer_tens(ans_tens), //answer tens digit output
	.answer_in(ans_out), //answer input
	.rst_n(rst_n) //low active reset
);

scan_ctl scan_control(
	.bcd_in1(addend_num),
 	.bcd_in2(augend_num),
   .bcd_in3(ans_tens),
   .bcd_in4(ans_unit),
   .clk_ctl(clk_ctl),
	.ssd_ctl(control),
  	.bcd_out(bcd_out)
);

ssd_decoder decoder(
	.ssd_out(display), //14-segment display output
	.bcd(bcd_out) //BCD input
);

endmodule