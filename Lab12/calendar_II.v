`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu
// 
// Create Date:    22:40:06 06/15/2015 
// Module Name:    calendar_II
// Project Name:   Lab12-1
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
`define BCD_BIT_WIDTH 4
module calendar_II(
	clk, //global clock (I)
	DIP, //DIP switch (I)
	rst_n, //active low reset
	LCD_rst, //LCD reset (O)
    LCD_cs, //LCD frame selection (O)
    LCD_rw, //LCD read/write control (O)
    LCD_di, //LCD data/instruction (O)
    LCD_data, //LCD data (O)
    LCD_en //LCD enable (O)
);

//I/Os
input clk; //global clock
input rst_n; //active low reset
input [2:0] DIP; //DIP swuitch
output LCD_rst; //LCD reset
output [1:0] LCD_cs; //LCD frame selection
output LCD_rw; //LCD read/write control
output LCD_di; //LCD data/instruction
output [7:0] LCD_data; //LCD data
output LCD_en; //LCD enable

wire clk_1, clk_fast1, clk_fast2, clk_fast3, clk_100;
wire carry_sec, carry_min, carry_hour, carry_day, carry_month;
wire [1:0] clk_ctl, state;
wire [7:0] second, minute, hour, day, month;
wire [15:0] year;
wire [2:0] day_unit_limit, day_tens_limit;
wire [95:0] data_output;

wire clk_div;
wire out_valid;
wire [7:0] data_out;

freq_div frequency_divider(
	.clk_ctl(clk_ctl), //divided clock output for scan freq
	.clk(clk), //global clock input
	.rst_n(rst_n), //active low reset
	.clk_fast1(clk_fast1), //Debugging use (O)
   .clk_fast2(clk_fast2) //Debugging use (O)
);

reg clk_fast;
always @*
	if(DIP[2:1] == 2'b00)
		clk_fast = clk_fast1;
	else if(DIP[2:1] == 2'b01)
		clk_fast = clk_fast2;
	else
		clk_fast = clk;

clock_generator clk_generate(
  .clk(clk), // clock from crystal
  .rst_n(rst_n), // active low reset
  .clk_1(clk_1), // generated 1 Hz clock
  .clk_100(clk_100) // generated 100 Hz clock
);

ten seconds(
	.carry(carry_sec), //carryout to enable counting (O)
	.value(second), //unit & tens value (O)
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
	.value(minute), //unit & tens value (O)
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
	.value(hour), //unit & tens value (O)
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
	.value(hour), //unit & tens value (O)
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
	.month_unit(month[3:0]), //unit for month (I)
	.month_tens(month[7:4]), //tens for month (I)
	.year_unit(year[3:0]), //unit for year (I)
	.year_tens(year[7:4]), //tens for year (I)
	.year_hund(year[11:8]), //hundred for year (I)
	.year_thou(year[15:12]) //thousand for year (I)
);

ten months(
	.carry(carry_month), //carryout to enable counting (O)
	.value(month), //unit & tens value (O)
	.clk(clk_fast), //global clock (I)
	.increase(carry_day), //enable control for counter (I)
	.unit_def_value(`BCD_ONE), //unit default value (I)
	.tens_def_value(`BCD_ZERO), //tens default value (I)
	.unit_limit(`BCD_THREE), //unit limit value (I)
	.tens_limit(`BCD_ONE), //tens limit value (I)
	.rst_n(rst_n) //active low reset
);

thousand years(
	.value(year), //unit & tens & hundred & thousand value (O)
	.clk(clk_fast), //global clock (I)
	.increase(carry_month), //enable control for counter (I)
	.unit_def_value(`BCD_ZERO), //unit default value (I)
	.tens_def_value(`BCD_ZERO), //tens default value (I)
	.hund_def_value(`BCD_ZERO), //hundred default value (I)
	.thou_def_value(`BCD_TWO), //thousand default value (I)
	.unit_limit(`BCD_ONE), //unit limit value (I)
	.tens_limit(`BCD_ZERO), //tens limit value (I)
	.hund_limit(`BCD_TWO), //hundred limit value (I)
	.thou_limit(`BCD_TWO), //thousand limit value (I)
	.rst_n(rst_n) //active low reset
);

display_ctl display_controllor(
    .DIP(DIP[0]), //(I)
    .second(second), //(I)
    .minute(minute), //(I)
    .hour(hour), //(I)
    .day(day), //(I)
    .month(month), //(I)
    .year(year), //(I)
    .data_out(data_output) //(O)
);

RAM_ctrl RAM_controller(
    .clk(clk_div), //global clock input
    .rst_n(rst_n), //active low reset
    .pressed(1'b1), //whether key pressed (1) or not (0)
    .en(en), //LCD enable
    .input_data(data_output); //data input (I)
    .data_valid(out_valid), //whether data valid or not
    .data_out(data_out) //ram data output
);

lcd_ctrl LCD_controller(
    .clk(clk_div), //LCD controller clock (I)
    .rst_n(rst_n), //active low reset (I)
    .data(data_out), //data re-arrangement buffer ready indicator (I)
    .data_valid(out_valid), //if data_valid = 1 the data is valid (I)
    .LCD_di(LCD_di), //LCD data/instruction (O)
    .LCD_rw(LCD_rw), //LCD Read/Write (O)
    .LCD_en(LCD_en), //LCD enable (O)
    .LCD_rst(LCD_rst), //LCD reset (O)
    .LCD_cs(LCD_cs), //LCD frame select (O)
    .LCD_data(LCD_data), //LCD data (O)
    .en_tran(en) //data transfer enable (O)
);

clock_divider #(
    .half_cycle(200), // half cycle = 200 (divided by 400)
    .counter_width(8) // counter width = 8 bits
  ) clk100K (
    .clk_div(clk_div), //divided clock signal (O)
    .clk(clk), //global clock input (I)
    .rst_n(rst_n) //active low reset (I)
);

endmodule
