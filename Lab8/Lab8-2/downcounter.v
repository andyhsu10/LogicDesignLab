`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:19:13 05/02/2015 
// Design Name: 
// Module Name:    downcounter 
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
module downcounter(
	value, //counter value (O)
	carry, //carryout to enable counting in next stage (O)
	clk, //global clock (I)
	setting,
	decrease, //enable control for counter (I)
	load_default, //enable load default value (I).
	rst_value,
	def_value, //default value for counter (I)
	rst_n //active low reset
);

//I/Os
output [`BCD_BIT_WIDTH-1:0] value; //counter value
output carry; //carryout to enable counting in next stage
input clk; //global clock
input setting;
input decrease; //enable control for counter
input load_default; //enable load default value
input rst_n; //active low reset
input [`BCD_BIT_WIDTH-1:0] def_value; //counter upper limit
input [`BCD_BIT_WIDTH-1:0] rst_value;

reg [`BCD_BIT_WIDTH-1:0] value; //counter value (in always block)
reg [`BCD_BIT_WIDTH-1:0] value_tmp; //input to dff (in always block)
reg carry; //carryout to enable counting in next stage

//combinational part for BCD counter
always @*
	if(setting == 1'b1)
		value_tmp = rst_value;
	else if(load_default == `ENABLED)
		value_tmp = def_value;
	else if(decrease == `DISABLED)
		value_tmp = value;
	else if((decrease == `ENABLED) && (value == `BCD_ZERO))
		value_tmp = `BCD_NINE;
	else
		value_tmp = value - `DECREMENT;

always @*
	if((decrease == `ENABLED) && (value == `BCD_ZERO))
		carry = `ENABLED;
	else
		carry = `DISABLED;

//register part for BCD counter
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		value <= rst_value;
	else
		value <= value_tmp;
	
endmodule
