`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:59:42 03/21/2015 
// Design Name: 
// Module Name:    scan_ctl 
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
				ssd_ctl = 4'b1110;
				bcd_out = bcd_in3;
			end
		2'b01:
			begin
				ssd_ctl = 4'b1101;
				bcd_out = bcd_in2;
			end
		2'b10:
			begin
				ssd_ctl = 4'b1011;
				bcd_out = bcd_in1;
			end
		default:
			begin
				ssd_ctl = 4'b1111;
				bcd_out = 4'd0;
			end
	endcase

endmodule
