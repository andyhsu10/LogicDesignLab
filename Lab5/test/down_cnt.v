`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:41:57 04/11/2015 
// Design Name: 
// Module Name:    down_cnt 
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
`define DISABLED 1'b0
`define ENABLED 1'b1
`define BCD_ZERO 4'd0
module down_cnt(
	value, //counter output
	borrow, //borrow inndicator
	clk, //global clock
	rst_n, //active low reset
	decrease, //counter enable control
	limit, //limit for the counter
	ini //value for reset
    );
	 
output reg [3:0] value;
output reg borrow;
input clk, rst_n, decrease;
input [3:0] limit, ini;
reg [3:0] value_tmp;

//Combination logics
always @*
	if (value==`BCD_ZERO && decrease)
		begin
			value_tmp <= limit;
			borrow = `ENABLED;
		end
	else if (value!=`BCD_ZERO && decrease)
		begin
			value_tmp <= value - 4'd1;
			borrow = `DISABLED;
		end
	else
		begin
			value_tmp <= value;
			borrow = `DISABLED;
		end

//Register part for BCD counter
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		value <= ini;
	else
		value <= value_tmp;

endmodule
