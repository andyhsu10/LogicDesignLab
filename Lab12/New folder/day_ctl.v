`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:48:00 05/07/2015 
// Design Name: 
// Module Name:    day_ctl 
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
`define BIT_4_WIDTH 4
`define BIT_12_WIDTH 12
module day_ctl(
	day_unit_limit, //unit limit for day (O)
	day_tens_limit, //tens limit for day (O)
	month_unit, //unit for month (I)
	month_tens, //tens for month (I)
	year_unit, //unit for year (I)
	year_tens, //tens for year (I)
	year_hund, //hundred for year (I)
	year_thou //thousand for year (I)
);

output [`BCD_BIT_WIDTH-1:0] day_unit_limit; //unit limit for day
output [`BCD_BIT_WIDTH-1:0] day_tens_limit; //tens limit for day
input [`BCD_BIT_WIDTH-1:0] month_unit; //unit for month
input [`BCD_BIT_WIDTH-1:0] month_tens; //tens for month
input [`BCD_BIT_WIDTH-1:0] year_unit; //unit for year
input [`BCD_BIT_WIDTH-1:0] year_tens; //tens for year
input [`BCD_BIT_WIDTH-1:0] year_hund; //hundred for year
input [`BCD_BIT_WIDTH-1:0] year_thou; //thousand for year

reg [`BIT_4_WIDTH-1:0] month; //binary month
reg [`BIT_12_WIDTH-1:0] year; //binary year
reg [`BCD_BIT_WIDTH-1:0] day_unit_limit; //unit limit for day
reg [`BCD_BIT_WIDTH-1:0] day_tens_limit; //tens limit for day

always @*
	begin
		month = month_tens * `BIT_4_WIDTH'd10 + month_unit;
		year = year_thou * `BIT_12_WIDTH'd1000 + year_hund * `BIT_12_WIDTH'd100 + year_tens * `BIT_12_WIDTH'd10 + year_unit;
	end

always @*
	if((month == `BIT_4_WIDTH'd1) || (month == `BIT_4_WIDTH'd3) || (month == `BIT_4_WIDTH'd5) || (month == `BIT_4_WIDTH'd7) || (month == `BIT_4_WIDTH'd8) || (month == `BIT_4_WIDTH'd10) || (month == `BIT_4_WIDTH'd12))
		begin
			day_unit_limit = `BCD_TWO;
			day_tens_limit = `BCD_THREE;
		end
	else if((month == `BIT_4_WIDTH'd4) || (month == `BIT_4_WIDTH'd6) || (month == `BIT_4_WIDTH'd9) || (month == `BIT_4_WIDTH'd11))
		begin
			day_unit_limit = `BCD_ONE;
			day_tens_limit = `BCD_THREE;
		end
	else if((month == `BIT_4_WIDTH'd2) && (year % `BIT_12_WIDTH'd400 == `BIT_12_WIDTH'd0))
		begin
			day_unit_limit = `BCD_ZERO;
			day_tens_limit = `BCD_THREE;
		end
	else if((month == `BIT_4_WIDTH'd2) && (year % `BIT_12_WIDTH'd100 == `BIT_12_WIDTH'd0))
		begin
			day_unit_limit = `BCD_NINE;
			day_tens_limit = `BCD_TWO;
		end
	else if((month == `BIT_4_WIDTH'd2) && (year % `BIT_12_WIDTH'd4 == `BIT_12_WIDTH'd0))
		begin
			day_unit_limit = `BCD_ZERO;
			day_tens_limit = `BCD_THREE;
		end
	else if((month == `BIT_4_WIDTH'd2))
		begin
			day_unit_limit = `BCD_NINE;
			day_tens_limit = `BCD_TWO;
		end
	else
		begin
			day_unit_limit = `BCD_ZERO;
			day_tens_limit = `BCD_ZERO;
		end

endmodule
