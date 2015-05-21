`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu
// 
// Create Date:    15:32:14 05/21/2015 
// Module Name:    volume_ctl 
// Project Name:   Lab9-1
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module volume_ctl(
	volume, //volume output (O)
	vol_unit, //unit volume volue (O)
	vol_tens, //tens volume volue (O)
	increase, //input control (I)
	decrease, //input control (I)
	clk, //global clock signal (I)
	rst_n //active low reset (I)
);

//I/Os
input clk; //global signal input
input rst_n; //active low reset
input increase, decrease; //volume input control
output volume; //volume output
output [3:0] vol_unit; //unit volume volue
output [3:0] vol_tens; //tens volume volue

reg [15:0] volume; //volume output
reg [15:0] next_volume; //next volume
reg [3:0] vol_unit; //unit volume volue
reg [3:0] vol_tens; //tens volume volue

always @(posedge clk or negedge rst_n)
	if(~rst_n)
		volume <= `VOL_1;
	else
		volume <= next_volume;

always @*
	case(volume)
		`VOL_1:
			if(~increase)
				begin
					next_volume = `VOL_2;
					vol_tens = `BCD_ZERO;
					vol_unit = `BCD_TWO;
				end
			else
				begin
					next_volume = `VOL_1;
					vol_tens = `BCD_ZERO;
					vol_unit = `BCD_ONE;
				end
		`VOL_2:
			if(~increase)
				begin
					next_volume = `VOL_3;
					vol_tens = `BCD_ZERO;
					vol_unit = `BCD_THREE;
				end
			else if(~decrease)
				begin
					next_volume = `VOL_1;
					vol_tens = `BCD_ZERO;
					vol_unit = `BCD_ONE;
				end
			else
				begin
					next_volume = `VOL_2;
					vol_tens = `BCD_ZERO;
					vol_unit = `BCD_TWO;
				end
		`VOL_3:
			if(~increase)
				begin
					next_volume = `VOL_4;
					vol_tens = `BCD_ZERO;
					vol_unit = `BCD_FOUR;
				end
			else if(~decrease)
				begin
					next_volume = `VOL_2;
					vol_tens = `BCD_ZERO;
					vol_unit = `BCD_TWO;
				end
			else
				begin
					next_volume = `VOL_3;
					vol_tens = `BCD_ZERO;
					vol_unit = `BCD_THREE;
				end
		`VOL_4:
			if(~increase)
				begin
					next_volume = `VOL_5;
					vol_tens = `BCD_ZERO;
					vol_unit = `BCD_FIVE;
				end
			else if(~decrease)
				begin
					next_volume = `VOL_3;
					vol_tens = `BCD_ZERO;
					vol_unit = `BCD_THREE;
				end
			else
				begin
					next_volume = `VOL_4;
					vol_tens = `BCD_ZERO;
					vol_unit = `BCD_FOUR;
				end
		`VOL_5:
			if(~increase)
				begin
					next_volume = `VOL_6;
					vol_tens = `BCD_ZERO;
					vol_unit = `BCD_SIX;
				end
			else if(~decrease)
				begin
					next_volume = `VOL_4;
					vol_tens = `BCD_ZERO;
					vol_unit = `BCD_FOUR;
				end
			else
				begin
					next_volume = `VOL_5;
					vol_tens = `BCD_ZERO;
					vol_unit = `BCD_FIVE;
				end
		`VOL_6:
			if(~increase)
				begin
					next_volume = `VOL_7;
					vol_tens = `BCD_ZERO;
					vol_unit = `BCD_SEVEN;
				end
			else if(~decrease)
				begin
					next_volume = `VOL_5;
					vol_tens = `BCD_ZERO;
					vol_unit = `BCD_FIVE;
				end
			else
				begin
					next_volume = `VOL_6;
					vol_tens = `BCD_ZERO;
					vol_unit = `BCD_SIX;
				end
		`VOL_7:
			if(~increase)
				begin
					next_volume = `VOL_8;
					vol_tens = `BCD_ZERO;
					vol_unit = `BCD_EIGHT;
				end
			else if(~decrease)
				begin
					next_volume = `VOL_6;
					vol_tens = `BCD_ZERO;
					vol_unit = `BCD_SIX;
				end
			else
				begin
					next_volume = `VOL_7;
					vol_tens = `BCD_ZERO;
					vol_unit = `BCD_SEVEN;
				end
		`VOL_8:
			if(~increase)
				begin
					next_volume = `VOL_9;
					vol_tens = `BCD_ZERO;
					vol_unit = `BCD_NINE;
				end
			else if(~decrease)
				begin
					next_volume = `VOL_7;
					vol_tens = `BCD_ZERO;
					vol_unit = `BCD_SEVEN;
				end
			else
				begin
					next_volume = `VOL_8;
					vol_tens = `BCD_ZERO;
					vol_unit = `BCD_EIGHT;
				end
		`VOL_9:
			if(~increase)
				begin
					next_volume = `VOL_10;
					vol_tens = `BCD_ONE;
					vol_unit = `BCD_ZERO;
				end
			else if(~decrease)
				begin
					next_volume = `VOL_8;
					vol_tens = `BCD_ZERO;
					vol_unit = `BCD_EIGHT;
				end
			else
				begin
					next_volume = `VOL_9;
					vol_tens = `BCD_ZERO;
					vol_unit = `BCD_NINE;
				end
		`VOL_10:
			if(~increase)
				begin
					next_volume = `VOL_11;
					vol_tens = `BCD_ONE;
					vol_unit = `BCD_ONE;
				end
			else if(~decrease)
				begin
					next_volume = `VOL_9;
					vol_tens = `BCD_ZERO;
					vol_unit = `BCD_NINE;
				end
			else
				begin
					next_volume = `VOL_10;
					vol_tens = `BCD_ONE;
					vol_unit = `BCD_ZERO;
				end
		`VOL_11:
			if(~increase)
				begin
					next_volume = `VOL_12;
					vol_tens = `BCD_ONE;
					vol_unit = `BCD_TWO;
				end
			else if(~decrease)
				begin
					next_volume = `VOL_10;
					vol_tens = `BCD_ONE;
					vol_unit = `BCD_ZERO;
				end
			else
				begin
					next_volume = `VOL_11;
					vol_tens = `BCD_ONE;
					vol_unit = `BCD_ONE;
				end
		`VOL_12:
			if(~increase)
				begin
					next_volume = `VOL_13;
					vol_tens = `BCD_ONE;
					vol_unit = `BCD_THREE;
				end
			else if(~decrease)
				begin
					next_volume = `VOL_11;
					vol_tens = `BCD_ONE;
					vol_unit = `BCD_ONE;
				end
			else
				begin
					next_volume = `VOL_12;
					vol_tens = `BCD_ONE;
					vol_unit = `BCD_TWO;
				end
		`VOL_13:
			if(~increase)
				begin
					next_volume = `VOL_14;
					vol_tens = `BCD_ONE;
					vol_unit = `BCD_FOUR;
				end
			else if(~decrease)
				begin
					next_volume = `VOL_12;
					vol_tens = `BCD_ONE;
					vol_unit = `BCD_TWO;
				end
			else
				begin
					next_volume = `VOL_13;
					vol_tens = `BCD_ONE;
					vol_unit = `BCD_THREE;
				end
		`VOL_14:
			if(~increase)
				begin
					next_volume = `VOL_15;
					vol_tens = `BCD_ONE;
					vol_unit = `BCD_FIVE;
				end
			else if(~decrease)
				begin
					next_volume = `VOL_13;
					vol_tens = `BCD_ONE;
					vol_unit = `BCD_THREE;
				end
			else
				begin
					next_volume = `VOL_14;
					vol_tens = `BCD_ONE;
					vol_unit = `BCD_FOUR;
				end
		`VOL_15:
			if(~increase)
				begin
					next_volume = `VOL_16;
					vol_tens = `BCD_ONE;
					vol_unit = `BCD_SIX;
				end
			else if(~decrease)
				begin
					next_volume = `VOL_14;
					vol_tens = `BCD_ONE;
					vol_unit = `BCD_FOUR;
				end
			else
				begin
					next_volume = `VOL_15;
					vol_tens = `BCD_ONE;
					vol_unit = `BCD_FIVE;
				end
		`VOL_16:
			if(~decrease)
				begin
					next_volume = `VOL_15;
					vol_tens = `BCD_ONE;
					vol_unit = `BCD_FIVE;
				end
			else
				begin
					next_volume = `VOL_16;
					vol_tens = `BCD_ONE;
					vol_unit = `BCD_SIX;
				end
		default:
			begin
				next_volume = `VOL_1;
				vol_tens = `BCD_ZERO;
				vol_unit = `BCD_ZERO;
			end		
	endcase

endmodule