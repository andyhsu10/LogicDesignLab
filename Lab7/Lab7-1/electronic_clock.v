`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:50:48 05/02/2015 
// Design Name: 
// Module Name:    electronic_clock 
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
module electronic_clock(
	display, //SSD output (O)
	control, //SSD control signal (O)
	clk, //global clock (I)
	state1, //state button 1 (I)
	state2, //state button 2 (I)
	rst_n //active low reset
);

//I/Os
output [14:0] display; //SSD output
output [3:0] control; //SS control signal
input clk; //global clock
input state1, state2; //state button
input rst_n; //active low reset

wire de_state1, de_state2;
wire clk_1, clk_fast, clk_100;
wire carry_sec, carry_min, carry_hour;
wire [1:0] clk_ctl, state;
wire [3:0] sec_unit, sec_tens, min_unit, min_tens, hour_unit, hour_tens;
wire [3:0] bcd_out, bcd_out1, bcd_out2, bcd_out3, bcd_out4;

freq_div frequency_divider(
	.clk_ctl(clk_ctl), //divided clock output for scan freq
	.clk(clk), //global clock input
	.rst_n(rst_n), //active low reset
   .clk_fast(clk_fast)
);

clock_generator clk_generate(
  .clk(clk), // clock from crystal
  .rst_n(rst_n), // active low reset
  .clk_1(clk_1), // generated 1 Hz clock
  .clk_100(clk_100) // generated 100 Hz clock
);

debounce_one_pulse de_stat1(
	.de_clk(clk_100), //debounce clock
	.pulse_clk(clk_100), //one pulse clock
	.rst_n(rst_n), //low active reset
	.in(state1), //push button input
	.out(de_state1) //pulsed push button output
);

debounce_one_pulse de_stat2(
	.de_clk(clk_100), //debounce clock
	.pulse_clk(clk_100), //one pulse clock
	.rst_n(rst_n), //low active reset
	.in(state2), //push button input
	.out(de_state2) //pulsed push button output
);

fsm fsm(
	.state(state), //state (O)
	.in1(de_state1), //input control (I)
	.in2(de_state2), //input control (I)
	.clk(clk_100), //global clock signal (I)
	.rst_n(rst_n) //low active reset
);

ten seconds(
	.carry(carry_sec), //carryout to enable counting
	.unit(sec_unit), //unit for second (O)
	.tens(sec_tens), //tens for second (O)
	.clk(clk_fast), //global clock (I)
	.increase(`ENABLED), //enable control for counter (I)
	.unit_limit(`BCD_NINE), //unit limit value (I)
	.tens_limit(`BCD_FIVE), //tens limit value (I)
	.rst_n(rst_n) //active low reset
);

ten minutes(
	.carry(carry_min), //carryout to enable counting (O)
	.unit(min_unit), //unit for minute (O)
	.tens(min_tens), //tens for minute (O)
	.clk(clk_fast), //global clock (I)
	.increase(carry_sec), //enable control for counter (I)
	.unit_limit(`BCD_ZERO), //unit limit value (I)
	.tens_limit(`BCD_SIX), //tens limit value (I)
	.rst_n(rst_n) //active low reset
);

ten hours(
	.carry(carry_hour), //carryout to enable counting (O)
	.unit(hour_unit), //unit for hour (O)
	.tens(hour_tens), //tens for hour (O)
	.clk(clk_fast), //global clock (I)
	.increase(carry_min), //enable control for counter (I)
	.unit_limit(`BCD_FOUR), //unit limit value (I)
	.tens_limit(`BCD_TWO), //tens limit value (I)
	.rst_n(rst_n) //active low reset
);

display_ctl display_controllor(
    .bcd_out1(bcd_out1), //bcd output 1 (O)
    .bcd_out2(bcd_out2), //bcd output 2 (O)
    .bcd_out3(bcd_out3), //bcd output 3 (O)
    .bcd_out4(bcd_out4), //bcd output 4 (O)
    .state(state), //state input (I)
    .sec_unit(sec_unit), //unit for second (I)
	.sec_tens(sec_tens), //tens for second (I)
	.min_unit(min_unit), //unit for minute (I)
	.min_tens(min_tens), //tens for minute (I)
	.hour_unit(hour_unit), //unit for hour (I)
	.hour_tens(hour_tens) //tens for hour (I)
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
