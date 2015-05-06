`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:09:36 05/02/2015 
// Design Name: 
// Module Name:    display_ctl 
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
`define STATE_WIDTH 2
module display_ctl(
    bcd_out1, //bcd output 1 (O)
    bcd_out2, //bcd output 2 (O)
    bcd_out3, //bcd output 3 (O)
    bcd_out4, //bcd output 4 (O)
    state, //state input (I)
    sec_unit, //unit for second (I)
	 sec_tens, //tens for second (I)
	 min_unit, //unit for minute (I)
	 min_tens, //tens for minute (I)
	 hour_unit, //unit for hour (I)
	 hour_tens //tens for hour (I)
);

output [`BCD_BIT_WIDTH-1:0] bcd_out1, bcd_out2, bcd_out3, bcd_out4; //bcd outputs
input [`STATE_WIDTH-1:0] state; //state input
input [`BCD_BIT_WIDTH-1:0] sec_unit, sec_tens; //second input
input [`BCD_BIT_WIDTH-1:0] min_unit, min_tens; //minute input
input [`BCD_BIT_WIDTH-1:0] hour_unit, hour_tens; //hour input

reg [`BCD_BIT_WIDTH-1:0] bcd_out1, bcd_out2, bcd_out3, bcd_out4; //bcd outputs (in always block)
reg [`BCD_BIT_WIDTH-1:0] hour_unit_tmp, hour_tens_tmp;
reg [4:0] hour_tmp;
reg [3:0] AM_PM1, AM_PM2;

always @*
	hour_tmp = hour_tens * 5'd10 + hour_unit;

always @*
	if((hour_tmp == 5'd0) && (state == `STAT_12_TWO))
		begin
			hour_unit_tmp = `BCD_TWO;
			hour_tens_tmp = `BCD_ONE;
		end
	else if((hour_tmp > 5'd12) && (hour_tmp <= 5'd19) && (state == `STAT_12_TWO))
		begin
			hour_unit_tmp = hour_unit - 4'd2;
			hour_tens_tmp = hour_tens - 4'd1;
		end
	else if((hour_tmp >= 5'd20) && (hour_tmp <= 5'd21) && (state == `STAT_12_TWO))
		begin
			hour_unit_tmp = hour_unit + 4'd8;
			hour_tens_tmp = hour_tens - 4'd2;
		end
	else if((hour_tmp >= 5'd22) && (state == `STAT_12_TWO))
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
			AM_PM1 = `LETTER_A;
			AM_PM2 = `LETTER_M;
		end
	else
		begin
			AM_PM1 = `LETTER_P;
			AM_PM2 = `LETTER_M;
		end

always @*
	case(state)
		`STAT_12_ONE:
			begin
				bcd_out1 = min_tens;
				bcd_out2 = min_unit;
				bcd_out3 = sec_tens;
				bcd_out4 = sec_unit;
			end
		`STAT_12_TWO:
			begin
				bcd_out1 = AM_PM1;
				bcd_out2 = AM_PM2;
				bcd_out3 = hour_tens_tmp;
				bcd_out4 = hour_unit_tmp;
			end
		`STAT_24_ONE:
			begin
				bcd_out1 = 4'd15;
				bcd_out2 = 4'd15;
				bcd_out3 = sec_tens;
				bcd_out4 = sec_unit;
			end
		`STAT_24_TWO:
			begin
				bcd_out1 = hour_tens_tmp;
				bcd_out2 = hour_unit_tmp;
				bcd_out3 = min_tens;
				bcd_out4 = min_unit;
			end
		default:
			begin
				bcd_out1 = 4'd15;
				bcd_out2 = 4'd15;
				bcd_out3 = 4'd15;
				bcd_out4 = 4'd15;
			end
	endcase

endmodule
