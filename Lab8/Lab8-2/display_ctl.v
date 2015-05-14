`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:20:39 05/14/2015 
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
`define DIP_WIDTH 5
module display_ctl(
    bcd_out1, //bcd output 1 (O)
    bcd_out2, //bcd output 2 (O)
    bcd_out3, //bcd output 3 (O)
    bcd_out4, //bcd output 4 (O)
    DIP, //DIP input (I)
	min_unit1, //unit for minute (I)
	min_tens1, //tens for minute (I)
	hour_unit1, //unit for hour (I)
	hour_tens1, //tens for hour (I)
	min_unit2, //unit for minute (I)
	min_tens2, //tens for minute (I)
	hour_unit2, //unit for hour (I)
	hour_tens2 //tens for hour (I)
);

output reg [`BCD_BIT_WIDTH-1:0] bcd_out1, bcd_out2, bcd_out3, bcd_out4; //bcd outputs
input DIP; //DIP input
input [`BCD_BIT_WIDTH-1:0] min_unit1, min_tens1; //minute input
input [`BCD_BIT_WIDTH-1:0] hour_unit1, hour_tens1; //hour input
input [`BCD_BIT_WIDTH-1:0] min_unit2, min_tens2; //minute input
input [`BCD_BIT_WIDTH-1:0] hour_unit2, hour_tens2; //hour input

always @*
	case(DIP)
		1'b0: //stop watch
			begin
				bcd_out1 = hour_tens2;
				bcd_out2 = hour_unit2;
				bcd_out3 = min_tens2;
				bcd_out4 = min_unit2;
			end
		1'b1: //setting
			begin
				bcd_out1 = hour_tens1;
				bcd_out2 = hour_unit1;
				bcd_out3 = min_tens1;
				bcd_out4 = min_unit1;
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
