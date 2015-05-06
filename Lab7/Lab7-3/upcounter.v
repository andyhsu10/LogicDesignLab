`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:19:13 05/02/2015 
// Design Name: 
// Module Name:    upcounter 
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
module upcounter(
	value, //counter value (O)
	carry, //carryout to enable counting in next stage (O)
	clk, //global clock (I)
	increase, //enable control for counter (I)
	load_default, //enable load default value (I)
	def_value, //default value for counter (I)
	rst_n //active low reset
);

//I/Os
output [`BCD_BIT_WIDTH-1:0] value; //counter value
output carry; //carryout to enable counting in next stage
input clk; //global clock
input increase; //enable control for counter
input load_default; //enable load default value
input rst_n; //active low reset
input [`BCD_BIT_WIDTH-1:0] def_value; //counter upper limit

reg [`BCD_BIT_WIDTH-1:0] value; //counter value (in always block)
reg [`BCD_BIT_WIDTH-1:0] value_tmp; //input to dff (in always block)
reg carry; //carryout to enable counting in next stage

//combinational part for BCD counter
always @*
	if(load_default == `ENABLED)
		value_tmp = def_value;
	else if(increase == `DISABLED)
		value_tmp = value;
	else if((increase == `ENABLED) && (value == `BCD_NINE))
		value_tmp = `BCD_ZERO;
	else
		value_tmp = value + `INCREMENT;

always @*
	if((increase == `ENABLED) && (value == `BCD_NINE))
		carry = `ENABLED;
	else
		carry = `DISABLED;

//register part for BCD counter
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		value <= def_value;
	else
		value <= value_tmp;
	
endmodule
