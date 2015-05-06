`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:54:09 05/02/2015 
// Design Name: 
// Module Name:    ten 
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
module ten(
	carry, //carryout to enable counting (O)
	unit, //unit for minute (O)
	tens, //tens for minute (O)
	clk, //global clock (I)
	increase, //enable control for counter (I)
	unit_limit, //unit limit value (I)
	tens_limit, //tens limit value (I)
	rst_n //active low reset
);

//I/Os
output carry; //carryout to enable counting
output [`BCD_BIT_WIDTH-1:0] unit; //unit for minute
output [`BCD_BIT_WIDTH-1:0] tens; //tens for minute
input clk; //global clock
input increase; //enable control for counter
input rst_n; //active low reset
input [`BCD_BIT_WIDTH-1:0] unit_limit;
input [`BCD_BIT_WIDTH-1:0] tens_limit;

//temporary nets
reg carry; //carryout to enable counting
reg load_def; //anabled to load minute value
wire cout_unit, cout_tens; //counter carrout

//return from 59 to 00
always @(unit or tens)
	if((tens == tens_limit) && (unit == unit_limit))
		begin
			load_def = `ENABLED;
			carry = `ENABLED;
		end
	else
		begin
			load_def = `DISABLED;
			carry = `DISABLED;
		end

//counter for unit minute
upcounter minute_unit(
	.value(unit), //counter value (O)
	.carry(cout_unit), //carryout to enable counting in next stage (O)
	.clk(clk), //global clock (I)
	.increase(increase), //enable control for counter (I)
	.load_default(load_def), //enable load default value (I)
	.def_value(4'd0), //default value for counter (I)
	.rst_n(rst_n) //active low reset
);

//counter for tens minute
upcounter minute_tens(
	.value(tens), //counter value (O)
	.carry(cout_tens), //carryout to enable counting in next stage (O)
	.clk(clk), //global clock (I)
	.increase(cout_unit), //enable control for counter (I)
	.load_default(load_def), //enable load default value (I)
	.def_value(4'd0), //default value for counter (I)
	.rst_n(rst_n) //active low reset
);
	
endmodule
