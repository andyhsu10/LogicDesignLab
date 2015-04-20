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
    display0,
    display1,
    clk_ctl,
	 ctl,
    out
    );

output [`BIT_WIDTH4-1:0] ctl, out;
input [`BIT_WIDTH4-1:0] display0, display1;
input [1:0] clk_ctl;

reg [`BIT_WIDTH4-1:0] ctl, out;

always @*
	case(clk_ctl)
		2'b00:
		begin
			ctl = 4'b1110;
			out = display0;
		end
		2'b01:
		begin
			ctl = 4'b1101;
			out = display1;
		end
		2'b10:
		begin
			ctl = 4'b1110;
			out = display0;
		end
		2'b11:
		begin
			ctl = 4'b1101;
			out = display1;
		end
	endcase

endmodule
