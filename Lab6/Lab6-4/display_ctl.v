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
`define STAT_LEFT 3'd0
`define STAT_RIGHT_ADD 3'd1
`define STAT_RIGHT_MINUS 3'd2
`define STAT_RIGHT_MULTI 3'd3
`define KEY_A 4'd10
`define KEY_B 4'd11
`define KEY_D 4'd13
`define KEY_E 4'd14
module display_ctl(
    bcd_out1, //bcd output 1
    bcd_out2, //bcd output 2
    bcd_out3, //bcd output 3
    state, //state input
    left, //left part digit input
    right, //right part digit input
    ans_unit, //answer unit digit input
    ans_tens //answer tens digit input
);

output [`BIT_WIDTH4-1:0] bcd_out1, bcd_out2, bcd_out3; //bcd output
input [`STATE_WIDTH-1:0] state; //state input
input [`BIT_WIDTH4-1:0] left; //left part digit input
input [`BIT_WIDTH4-1:0] right; //right part digit input
input [`BIT_WIDTH4-1:0] ans_unit, ans_tens; //answer digits input

reg [`BIT_WIDTH4-1:0] bcd_out1, bcd_out2, bcd_out3; //bcd output

always @*
	case(state)
		`STAT_LEFT:
			begin
				bcd_out1 = 4'd15;
				bcd_out2 = 4'd15;
				bcd_out3 = left;
			end
		`STAT_RIGHT_ADD:
			begin
				bcd_out1 = left;
				bcd_out2 = `KEY_A;
				bcd_out3 = right;
			end
		`STAT_RIGHT_MINUS:
			begin
				bcd_out1 = left;
				bcd_out2 = `KEY_B;
				bcd_out3 = right;
			end
		`STAT_RIGHT_MULTI:
			begin
				bcd_out1 = left;
				bcd_out2 = `KEY_D;
				bcd_out3 = right;
			end
		default:
			begin
				bcd_out1 = 4'd15;
				bcd_out2 = ans_tens;
				bcd_out3 = ans_unit;
			end
	endcase

endmodule
