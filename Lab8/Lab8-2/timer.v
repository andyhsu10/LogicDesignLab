`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:19:08 05/14/2015 
// Design Name: 
// Module Name:    timer 
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
`include "global.v"
`define BCD_BIT_WIDTH 4
module timer(
	display, //SSD output (O)
	control, //SSD control signal (O)
	led, //LED
	clk, //global clock (I)
	set_minute, //minute set button (I)
	set_hour, //hour set button (I)
	start_stop, //start & stop button (I)
	pause_resume, //pause & pause (I)
	setting, //DIP switch setting (I)
	rst //reset for setting counter
);

//I/Os
output [15:0] led; //LED output
output [14:0] display; //SSD output
output [3:0] control; //SS control signal
input clk; //global clock
input set_minute; //minute set button
input set_hour; //hour set button
input start_stop; //start & stop button
input pause_resume; //lap & reset button
input setting; //DIP switch setting
input rst; //reset for setting counter

reg [15:0] led; //LED output

wire clk_1, clk_fast1, clk_fast2, clk_100;
wire de_set_minute, de_set_hour, de_pause_resume, de_start_stop;
wire count_enable;
wire carry_min2, carry_hour2;
wire [1:0] clk_ctl;
wire [3:0] min_unit1, min_tens1, hour_unit1, hour_tens1;
wire [3:0] min_unit2, min_tens2, hour_unit2, hour_tens2;
wire [3:0] bcd_out, bcd_out1, bcd_out2, bcd_out3, bcd_out4;

freq_div frequency_divider(
	.clk_ctl(clk_ctl), //divided clock output for scan freq (I)
	.clk(clk), //global clock input (I)
	.rst_n(rst_n), //active low reset (I)
	.clk_fast1(clk_1), //Debugging use (O)
	.clk_fast2(clk_fast2) //Debugging use (O)
);

clock_generator clk_generate(
	.clk(clk), // clock from crystal (I)
	.rst_n(rst_n), // active low reset (I)
	.clk_1(clk_fast1), // generated 1 Hz clock (O)
	.clk_100(clk_100) // generated 100 Hz clock (O)
);

debounce_one_pulse pau_res(
	.de_clk(clk_100), //debounce clock (I)
	.pulse_clk(clk_100), //one pulse clock (I)
	.rst_n(rst_n), //low active reset (I)
	.in(pause_resume), //push button input (I)
	.out(de_pause_resume) //pulsed push button output (O)
);

debounce_one_pulse reset(
	.de_clk(clk_100), //debounce clock (I)
	.pulse_clk(clk_100), //one pulse clock (I)
	.rst_n(rst_n), //low active reset (I)
	.in(start_stop), //push button input (I)
	.out(de_start_stop) //pulsed push button output (O)
);

fsm fsm(
	.count_enable(count_enable), //counter enable (O)
	.in1(de_pause_resume), //input control (I)
	.in2(de_start_stop), //input control (I)
	.clk(clk_100), //global clock signal (I)
	.rst_n(rst_n) //low active reset (O)
);

ten_up_cnt minutes1(
	.carry(), //carryout to enable counting (O)
	.unit(min_unit1), //unit (O)
	.tens(min_tens1), //tens (O)
	.clk(clk_fast1), //global clock (I)
	.increase(setting & (~set_minute)), //enable control for counter (I)
	.unit_def_value(`BCD_ZERO), //unit default value (I)
	.tens_def_value(`BCD_ZERO), //tens default value (I)
	.unit_limit(`BCD_NINE), //unit limit value (I)
	.tens_limit(`BCD_FIVE), //tens limit value (I)
	.rst_n(rst) //active low reset
);

ten_up_cnt hours1(
	.carry(), //carryout to enable counting (O)
	.unit(hour_unit1), //unit (O)
	.tens(hour_tens1), //tens (O)
	.clk(clk_fast1), //global clock (I)
	.increase(setting & (~set_hour)), //enable control for counter (I)
	.unit_def_value(`BCD_ZERO), //unit default value (I)
	.tens_def_value(`BCD_ZERO), //tens default value (I)
	.unit_limit(`BCD_THREE), //unit limit value (I)
	.tens_limit(`BCD_TWO), //tens limit value (I)
	.rst_n(rst) //active low reset
);

reg clk_d;
always @*
	if((min_unit2 == `BCD_ZERO) && (min_tens2 == `BCD_ZERO) && (hour_unit2 == `BCD_ZERO) && (hour_tens2 == `BCD_ZERO))
		begin
			clk_d = 1'd0;
			led = 16'd65535;
		end
	else
		begin
			clk_d = clk_1;
			led = 16'd0;
		end

ten_down_cnt minutes2(
	.carry(carry_min2), //carryout to enable counting (O)
	.unit(min_unit2), //unit (O)
	.tens(min_tens2), //tens (O)
	.clk(clk_d), //global clock (I)
	.setting(setting), //setting
	.decrease(count_enable), //enable control for counter (I)
	.unit_def_value(`BCD_NINE), //unit default value (I)
	.tens_def_value(`BCD_FIVE), //tens default value (I)
	.rst_unit_value(min_unit1),
	.rst_tens_value(min_tens1),
	.unit_limit(`BCD_ZERO), //unit limit value (I)
	.tens_limit(`BCD_ZERO), //tens limit value (I)
	.rst_n(rst_n) //active low reset
);

ten_down_cnt hours2(
	.carry(carry_hour2), //carryout to enable counting (O)
	.unit(hour_unit2), //unit (O)
	.tens(hour_tens2), //tens (O)
	.clk(clk_d), //global clock (I)
	.setting(setting), //setting
	.decrease(carry_min2), //enable control for counter (I)
	.unit_def_value(`BCD_THREE), //unit default value (I)
	.tens_def_value(`BCD_TWO), //tens default value (I)
	.rst_unit_value(hour_unit1),
	.rst_tens_value(hour_tens1),
	.unit_limit(`BCD_ZERO), //unit limit value (I)
	.tens_limit(`BCD_ZERO), //tens limit value (I)
	.rst_n(rst_n) //active low reset
);

display_ctl display_controllor(
    .bcd_out1(bcd_out1), //bcd output 1 (O)
    .bcd_out2(bcd_out2), //bcd output 2 (O)
    .bcd_out3(bcd_out3), //bcd output 3 (O)
    .bcd_out4(bcd_out4), //bcd output 4 (O)
    .DIP(setting), //DIP input (I)
	.min_unit1(min_unit1), //unit for minute (I)
	.min_tens1(min_tens1), //tens for minute (I)
	.hour_unit1(hour_unit1), //unit for hour (I)
	.hour_tens1(hour_tens1), //tens for hour (I)
	.min_unit2(min_unit2), //unit for minute (I)
	.min_tens2(min_tens2), //tens for minute (I)
	.hour_unit2(hour_unit2), //unit for hour (I)
	.hour_tens2(hour_tens2) //tens for hour (I)
);

scan_ctl scan_controllor(
    .bcd_in1(bcd_out1),
    .bcd_in2(bcd_out2),
    .bcd_in3(bcd_out3),
    .bcd_in4(bcd_out4),
    .clk_ctl(clk_ctl),
    .ssd_ctl(control),
    .bcd_out(bcd_out)
);

ssd_decoder decoder(
	.ssd_out(display), //14-segment display output
	.bcd(bcd_out) //BCD input
);

endmodule
