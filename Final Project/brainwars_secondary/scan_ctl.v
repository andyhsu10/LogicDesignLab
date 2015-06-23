`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu & Hsin-Ho Lu
//
// Create Date:    18:56:51 06/23/2015
// Module Name:    scan_ctl
// Project Name:   2015 Spring Logic Design Laboratory Final Project
// Revision:
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`define BIT_WIDTH4 4
module scan_ctl(
    bcd_in1,
    bcd_in2,
    bcd_in3,
    clk_ctl,
	 ssd_ctl,
    bcd_out
    );

output [`BIT_WIDTH4-1:0] ssd_ctl, bcd_out;
input [`BIT_WIDTH4-1:0] bcd_in1, bcd_in2, bcd_in3;
input [1:0] clk_ctl;

reg [`BIT_WIDTH4-1:0] ssd_ctl, bcd_out;

always @*
	case(clk_ctl)
		2'b00:
			begin
				ssd_ctl = 4'b1011;
				bcd_out = bcd_in1;
			end
		2'b01:
			begin
				ssd_ctl = 4'b1101;
				bcd_out = bcd_in2;
			end
		2'b10:
			begin
				ssd_ctl = 4'b1110;
				bcd_out = bcd_in3;
			end
		default:
			begin
				ssd_ctl = 4'b1111;
				bcd_out = 4'd0;
			end
	endcase

endmodule
