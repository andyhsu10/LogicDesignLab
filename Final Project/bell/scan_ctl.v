`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu
// 
// Create Date:    19:53:28 05/21/2015 
// Module Name:    scan_ctl 
// Project Name:   Lab10-2
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`define BIT_WIDTH6 6
module scan_ctl(
    bcd_in1,
    bcd_in2,
    clk_ctl,
    ssd_ctl,
    bcd_out
);

output [3:0] ssd_ctl;
output [`BIT_WIDTH6-1:0] bcd_out;
input [`BIT_WIDTH6-1:0] bcd_in1, bcd_in2;
input [1:0] clk_ctl;

reg [3:0] ssd_ctl;
reg [`BIT_WIDTH6-1:0] bcd_out;

always @*
	case(clk_ctl)
		2'b00:
			begin
				ssd_ctl = 4'b1110;
				bcd_out = bcd_in2;
			end
		2'b01:
			begin
				ssd_ctl = 4'b1101;
				bcd_out = bcd_in1;
			end
		2'b10:
			begin
				ssd_ctl = 4'b1110;
				bcd_out = bcd_in2;
			end
		2'b11:
			begin
				ssd_ctl = 4'b1101;
				bcd_out = bcd_in1;
			end
		default:
			begin
				ssd_ctl = 4'b1111;
				bcd_out = 4'd0;
			end
	endcase

endmodule
