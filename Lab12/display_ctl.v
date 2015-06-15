`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu
// 
// Create Date:    22:17:25 06/15/2015 
// Module Name:    display_ctl
// Project Name:   Lab12-1
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
`define BCD_BIT_WIDTH 4
module display_ctl(
	DIP,
    second,
    minute,
    hour,
    day,
    month,
    year,
    data_out
);

output [95:0] data_out;
input DIP;
input [7:0] second, minute, hour, day, month;
input [15:0] year;

reg [95:0] data_out;
reg [`BCD_BIT_WIDTH-1:0] hour_unit_tmp, hour_tens_tmp;
reg [4:0] hour_tmp;
reg [5:0] AM_PM1, AM_PM2;

always @*
	hour_tmp = hour[7:4] * 5'd10 + hour[3:0];

always @*
	if((hour_tmp == 5'd0) && (DIP == 1'b0))
		begin
			hour_unit_tmp = `BCD_TWO;
			hour_tens_tmp = `BCD_ONE;
		end
	else if((hour_tmp > 5'd12) && (hour_tmp <= 5'd19) && (DIP == 1'b0))
		begin
			hour_unit_tmp = hour_unit - 4'd2;
			hour_tens_tmp = hour_tens - 4'd1;
		end
	else if((hour_tmp >= 5'd20) && (hour_tmp <= 5'd21) && (DIP == 1'b0))
		begin
			hour_unit_tmp = hour_unit + 4'd8;
			hour_tens_tmp = hour_tens - 4'd2;
		end
	else if((hour_tmp >= 5'd22) && (DIP == 1'b0))
		begin
			hour_unit_tmp = hour_unit - 4'd2;
			hour_tens_tmp = hour_tens - 4'd1;
		end
	else
		begin
			hour_unit_tmp = hour_unit;
			hour_tens_tmp = hour_tens;
		end

always @*
	if(hour_tmp < 5'd12)
		begin
			AM_PM1 = `FONT_A;
			AM_PM2 = `FONT_M;
		end
	else
		begin
			AM_PM1 = `FONT_P;
			AM_PM2 = `FONT_M;
		end

always @*
	if(DIP == 1'b0)
		data_out = {2'b00, year[15:12],
					  2'b00, year[11:8],
					  2'b00, year[7:4],
					  2'b00, year[3:0], 
					  2'b00, month[7:4], 
					  2'b00, month[3:0], 
					  2'b00, day[7:4], 
					  2'b00, day[3:0],
					  AM_PM1, AM_PM2,
					  2'b00, hour_tens_tmp, 
					  2'b00, hour_unit_tmp,
					  2'b00, minute[7:4], 
					  2'b00, minute[3:0], 
					  2'b00, second[7:4], 
					  2'b00, second[3:0]};
	else
		data_out = {2'b00, year[15:12],
					  2'b00, year[11:8],
					  2'b00, year[7:4],
					  2'b00, year[3:0], 
					  2'b00, month[7:4], 
					  2'b00, month[3:0], 
					  2'b00, day[7:4], 
					  2'b00, day[3:0],
					  `FONT_NONE, `FONT_NONE,
					  2'b00, hour_tens_tmp,
					  2'b00, hour_unit_tmp,
					  2'b00, minute[7:4], 
					  2'b00, minute[3:0], 
					  2'b00, second[7:4], 
					  2'b00, second[3:0]};

endmodule
