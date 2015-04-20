`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:46:37 04/18/2015 
// Design Name: 
// Module Name:    two_digits_decimal_add_sub 
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
module two_digits_decimal_add_sub(
	check_state1,
	check_state2,
	display, //SSD output
	control, //SSD control signal
	row_n, //scanned row index
	clk, //global clock input
	add, //add button input
	minus, //minus button input
	equal, //equal button input
	col_n, //pressed column index
	rst_n //low active reset
);

//I/Os
output [1:0] check_state1, check_state2;
output [14:0] display; //SSD output
output [3:0] control; //SS control signal
output [3:0] row_n; //scanned row index
input clk; //global clock input
input add; //add button input
input minus; //minus button input
input equal; //equal button input
input [3:0] col_n; //pressed colume index
input rst_n; //low active reset

//Wires
wire clk_1, clk_100, de_add, de_minus, de_equal, pressed;
wire num_enable1, num_enable2, ans_enable;
wire [1:0] clk_ctl;
wire [2:0] state;
wire [3:0] key;
wire [3:0] left_unit, left_tens, right_unit, right_tens;
wire [3:0] ans_unit, ans_tens, ans_hund;
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

debounce_one_pulse de_pulse_add(
	.clk(clk_100), //debounce & one pulse clock
	.rst_n(rst_n), //low active reset
	.in(add), //push button input
	.out(de_add) //pulsed push button output
);

debounce_one_pulse de_pulse_minus(
	.clk(clk_100), //debounce & one pulse clock
	.rst_n(rst_n), //low active reset
	.in(minus), //push button input
	.out(de_minus) //pulsed push button output
);

debounce_one_pulse de_pulse_equal(
	.clk(clk_100), //debounce & one pulse clock
	.rst_n(rst_n), //low active reset
	.in(equal), //push button input
	.out(de_equal) //pulsed push button output
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
	.state(state), //state output
	.add(de_add), //add button input
	.minus(de_minus), //minus button input
	.equal(de_equal), //equal button input
	.clk(clk_1), //global clock signal
	.rst_n(rst_n) //active low reset
);

num_store left(
	.value_out(left_value), //left part value output
	.unit_out(left_unit), //unit digit output
	.tens_out(left_tens), //tens digit output
	.check_state(check_state1), //check state
	.num_in(key), //number input
	.clk(clk_100), //clock
	.enable(num_enable1), //enable for storing in value
	.pressed(pressed), //button pressed
	.rst_n(rst_n) //active low reset
);

num_store right(
	.value_out(right_value), //left part value output
	.unit_out(right_unit), //unit digit output
	.tens_out(right_tens), //tens digit output
	.check_state(check_state2), //check state
	.num_in(key), //number input
	.clk(clk_100), //clock
	.enable(num_enable2), //enable for storing in value
	.pressed(pressed), //button pressed
	.rst_n(rst_n) //active low reset
);

answer_store answer(
	.answer_out(ans_out), //binary answer output
	.left_in(left_value), //augend & minuend input
	.right_in(right_value), //addend & subtrahend input
	.clk(clk_100), //clock
	.enable(ans_enable), //enable
	.state(state), //states for add or minus
	.rst_n(rst_n) //active low reset
);

binary_converter converter(
	.answer_in(ans_out), //binary answer input
	.answer_unit(ans_unit), //answer unit digit output
	.answer_tens(ans_tens), //answer tens digit output
	.answer_hund(ans_hund) //answer hundreds digit output
);

display_ctl display_controller(
    .bcd_out1(bcd_out1), //bcd output 1
    .bcd_out2(bcd_out2), //bcd output 2
    .bcd_out3(bcd_out3), //bcd output 3
    .state(state), //state input
    .left_unit(left_unit), //left unit digit input
    .left_tens(left_tens), //left tens digit input
    .right_unit(right_unit), //right unit digit input
    .right_tens(right_tens), //right tens digit input
    .ans_unit(ans_unit), //answer unit digit input
    .ans_tens(ans_tens), //answer tens digit input
    .ans_hund(ans_hund) //answer hundreds digit input
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