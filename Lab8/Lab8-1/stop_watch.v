`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:19:08 05/14/2015 
// Design Name: 
// Module Name:    stop_watch 
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
module stop_watch(
	display, //SSD output (O)
	control, //SSD control signal (O)
	clk, //global clock (I)
	start_stop, //start & stop button (I)
	lap_rst //lap & reset button (I)
);

//I/Os
output [14:0] display; //SSD output
output [3:0] control; //SS control signal
input clk; //global clock
input start_stop; //start & stop button
input lap_rst; //lap & reset button

wire clk_1, clk_fast1, clk_fast2, clk_100;
wire de_start_stop, de_lap, rst_n;
wire count_enable;
wire carry_sec, carry_min;
wire [1:0] clk_ctl, state;
wire [3:0] sec_unit, sec_tens, min_unit, min_tens;
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

debounce_one_pulse start(
	.de_clk(clk_100), //debounce clock (I)
	.pulse_clk(clk_100), //one pulse clock (I)
	.rst_n(rst_n), //low active reset (I)
	.in(start_stop), //push button input (I)
	.out(de_start_stop) //pulsed push button output (O)
);

debounce_one_pulse lap(
	.de_clk(clk_100), //debounce clock (I)
	.pulse_clk(clk_100), //one pulse clock (I)
	.rst_n(rst_n), //low active reset (I)
	.in(lap_rst), //push button input (I)
	.out(de_lap) //pulsed push button output (O)
);

debounce_one_pulse reset(
	.de_clk(clk_fast1), //debounce clock (I)
	.pulse_clk(clk_fast1), //one pulse clock (I)
	.rst_n(rst_n), //low active reset (I)
	.in(lap_rst), //push button input (I)
	.out(rst_n) //pulsed push button output (O)
);

fsm fsm(
	.state(state), //state (O)
	.count_enable(count_enable), //counter enable (O)
	.in1(de_start_stop), //input control (I)
	.in2(de_lap), //input control (I)
	.clk(clk_100), //global clock signal (I)
	.rst_n(rst_n) //low active reset
);

ten seconds(
	.carry(carry_sec), //carryout to enable counting (O)
	.unit(sec_unit), //unit (O)
	.tens(sec_tens), //tens (O)
	.clk(clk_1), //global clock (I)
	.increase(count_enable), //enable control for counter (I)
	.unit_def_value(`BCD_ZERO), //unit default value (I)
	.tens_def_value(`BCD_ZERO), //tens default value (I)
	.unit_limit(`BCD_NINE), //unit limit value (I)
	.tens_limit(`BCD_FIVE), //tens limit value (I)
	.rst_n(rst_n) //active low reset
);

ten minutes(
	.carry(carry_min), //carryout to enable counting (O)
	.unit(min_unit), //unit (O)
	.tens(min_tens), //tens (O)
	.clk(clk_1), //global clock (I)
	.increase(carry_sec), //enable control for counter (I)
	.unit_def_value(`BCD_ZERO), //unit default value (I)
	.tens_def_value(`BCD_ZERO), //tens default value (I)
	.unit_limit(`BCD_ZERO), //unit limit value (I)
	.tens_limit(`BCD_SIX), //tens limit value (I)
	.rst_n(rst_n) //active low reset
);

lap_store lap_storage(
	.bcd_out1(bcd_out1), //bcd number 1 (O)
	.bcd_out2(bcd_out2), //bcd number 2 (O)
	.bcd_out3(bcd_out3), //bcd number 3 (O)
	.bcd_out4(bcd_out4), //bcd number 4 (O)
	.bcd_in1(min_tens), //bcd number 1 (I)
	.bcd_in2(min_unit), //bcd number 2 (I)
	.bcd_in3(sec_tens), //bcd number 3 (I)
	.bcd_in4(sec_unit), //bcd number 4 (I)
	.state(state), //state (I)
	.clk(clk_1), //global clock (I)
	.rst_n(rst_n) //active low reset
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
