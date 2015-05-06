`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:44:32 05/07/2015 
// Design Name: 
// Module Name:    calendar_I 
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
module calendar_I(
	display, //SSD output (O)
	control, //SSD control signal (O)
	clk, //global clock (I)
	DIP, //DIP switch (I)
	rst_n //active low reset
);

//I/Os
output [14:0] display; //SSD output
output [3:0] control; //SS control signal
input clk; //global clock
input rst_n; //active low reset
input [4:0] DIP; //DIP swuitch

wire clk_1, clk_fast1, clk_fast2, clk_100;
wire carry_sec, carry_min, carry_hour, carry_day, carry_month, carry_year;
wire [1:0] clk_ctl, state;
wire [3:0] sec_unit, sec_tens, min_unit, min_tens, hour_unit, hour_tens;
wire [3:0] day_unit, day_tens, month_unit, month_tens, year_unit, year_tens;
wire [3:0] day_unit_limit, day_tens_limit;
wire [3:0] bcd_out, bcd_out1, bcd_out2, bcd_out3, bcd_out4;

freq_div frequency_divider(
	.clk_ctl(clk_ctl), //divided clock output for scan freq
	.clk(clk), //global clock input
	.rst_n(rst_n), //active low reset
	.clk_fast1(clk_fast1), //Debugging use (O)
   .clk_fast2(clk_fast2) //Debugging use (O)
);

reg clk_fast;
always @*
	if(DIP[4] == 1'b0)
		clk_fast = clk_fast1;
	else
		clk_fast = clk_fast2;

clock_generator clk_generate(
  .clk(clk), // clock from crystal
  .rst_n(rst_n), // active low reset
  .clk_1(clk_1), // generated 1 Hz clock
  .clk_100(clk_100) // generated 100 Hz clock
);

ten seconds(
	.carry(carry_sec), //carryout to enable counting (O)
	.unit(sec_unit), //unit (O)
	.tens(sec_tens), //tens (O)
	.clk(clk_fast), //global clock (I)
	.increase(`ENABLED), //enable control for counter (I)
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
	.clk(clk_fast), //global clock (I)
	.increase(carry_sec), //enable control for counter (I)
	.unit_def_value(`BCD_ZERO), //unit default value (I)
	.tens_def_value(`BCD_ZERO), //tens default value (I)
	.unit_limit(`BCD_ZERO), //unit limit value (I)
	.tens_limit(`BCD_SIX), //tens limit value (I)
	.rst_n(rst_n) //active low reset
);

ten hours(
	.carry(carry_hour), //carryout to enable counting (O)
	.unit(hour_unit), //unit (O)
	.tens(hour_tens), //tens (O)
	.clk(clk_fast), //global clock (I)
	.increase(carry_min), //enable control for counter (I)
	.unit_def_value(`BCD_ZERO), //unit default value (I)
	.tens_def_value(`BCD_ZERO), //tens default value (I)
	.unit_limit(`BCD_FOUR), //unit limit value (I)
	.tens_limit(`BCD_TWO), //tens limit value (I)
	.rst_n(rst_n) //active low reset
);

ten days(
	.carry(carry_day), //carryout to enable counting (O)
	.unit(day_unit), //unit (O)
	.tens(day_tens), //tens (O)
	.clk(clk_fast), //global clock (I)
	.increase(carry_hour), //enable control for counter (I)
	.unit_def_value(`BCD_ONE), //unit default value (I)
	.tens_def_value(`BCD_ZERO), //tens default value (I)
	.unit_limit(day_unit_limit), //unit limit value (I)
	.tens_limit(day_tens_limit), //tens limit value (I)
	.rst_n(rst_n) //active low reset
);

day_ctl day_controllor(
	.day_unit_limit(day_unit_limit), //unit limit for day (O)
	.day_tens_limit(day_tens_limit), //tens limit for day (O)
	.month_unit(month_unit), //unit for month (I)
	.month_tens(month_tens), //tens for month (I)
	.year_unit(year_unit), //unit for year (I)
	.year_tens(year_tens) //tens for year (I)
);

ten months(
	.carry(carry_month), //carryout to enable counting (O)
	.unit(month_unit), //unit (O)
	.tens(month_tens), //tens (O)
	.clk(clk_fast), //global clock (I)
	.increase(carry_day), //enable control for counter (I)
	.unit_def_value(`BCD_ONE), //unit default value (I)
	.tens_def_value(`BCD_ZERO), //tens default value (I)
	.unit_limit(`BCD_THREE), //unit limit value (I)
	.tens_limit(`BCD_ONE), //tens limit value (I)
	.rst_n(rst_n) //active low reset
);

ten years(
	.carry(carry_year), //carryout to enable counting (O)
	.unit(year_unit), //unit (O)
	.tens(year_tens), //tens (O)
	.clk(clk_fast), //global clock (I)
	.increase(carry_month), //enable control for counter (I)
	.unit_def_value(`BCD_ZERO), //unit default value (I)
	.tens_def_value(`BCD_ZERO), //tens default value (I)
	.unit_limit(`BCD_NINE), //unit limit value (I)
	.tens_limit(`BCD_NINE), //tens limit value (I)
	.rst_n(rst_n) //active low reset
);

display_ctl display_controllor(
    .bcd_out1(bcd_out1), //bcd output 1 (O)
    .bcd_out2(bcd_out2), //bcd output 2 (O)
    .bcd_out3(bcd_out3), //bcd output 3 (O)
    .bcd_out4(bcd_out4), //bcd output 4 (O)
    .DIP(DIP), //state input (I)
    .sec_unit(sec_unit), //unit (I)
	.sec_tens(sec_tens), //tens (I)
	.min_unit(min_unit), //unit for minute (I)
	.min_tens(min_tens), //tens for minute (I)
	.hour_unit(hour_unit), //unit for hour (I)
	.hour_tens(hour_tens), //tens for hour (I)
	.day_unit(day_unit), //unit for day (I)
	.day_tens(day_tens), //tens for day (I)
	.month_unit(month_unit), //unit for month (I)
	.month_tens(month_tens), //tens for month (I)
	.year_unit(year_unit), //unit for year (I)
	.year_tens(year_tens) //tens for year (I)
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
