`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:42:16 04/19/2015 
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
`define BIT_WIDTH4 4
`define STATE_WIDTH 3
module display_ctl(
    bcd_out1, //bcd output 1
    bcd_out2, //bcd output 2
    bcd_out3, //bcd output 3
    state, //state input
    left_unit, //left unit digit input
    left_tens, //left tens digit input
    right_unit, //right unit digit input
    right_tens, //right tens digit input
    ans_unit, //answer unit digit input
    ans_tens, //answer tens digit input
    ans_hund //answer hundreds digit input
);

output [`BIT_WIDTH4-1:0] bcd_out1, bcd_out2, bcd_out3; //bcd output
input [`STATE_WIDTH-1:0] state; //state input
input [`BIT_WIDTH4-1:0] left_unit, left_tens; //left part digits input
input [`BIT_WIDTH4-1:0] right_unit, right_tens; //right part digits input
input [`BIT_WIDTH4-1:0] ans_unit, ans_tens, ans_hund; //answer digits input

reg [`BIT_WIDTH4-1:0] bcd_out1, bcd_out2, bcd_out3; //bcd output
reg [`BIT_WIDTH4-1:0] left_tens_tmp, right_tens_tmp;

always @*
	if(left_tens == `BIT_WIDTH4'd0)
		left_tens_tmp = `BIT_WIDTH4'd15;
	else
		left_tens_tmp = left_tens;
		
always @*
	if(right_tens == `BIT_WIDTH4'd0)
		right_tens_tmp = `BIT_WIDTH4'd15;
	else
		right_tens_tmp = right_tens;

always @*
	case(state)
		`STATE_WIDTH'd0:
			begin
				bcd_out1 = 4'd15;
				bcd_out2 = left_tens_tmp;
				bcd_out3 = left_unit;
			end
		`STATE_WIDTH'd1:
			begin
				bcd_out1 = 4'd15;
				bcd_out2 = right_tens_tmp;
				bcd_out3 = right_unit;
			end
		`STATE_WIDTH'd2:
			begin
				bcd_out1 = 4'd15;
				bcd_out2 = right_tens_tmp;
				bcd_out3 = right_unit;
			end
		`STATE_WIDTH'd3:
			begin
				bcd_out1 = ans_hund;
				bcd_out2 = ans_tens;
				bcd_out3 = ans_unit;
			end
		`STATE_WIDTH'd4:
			begin
				bcd_out1 = ans_hund;
				bcd_out2 = ans_tens;
				bcd_out3 = ans_unit;
			end
		default:
			begin
				bcd_out1 = 4'd15;
				bcd_out2 = 4'd15;
				bcd_out3 = 4'd15;
			end
	endcase

endmodule
