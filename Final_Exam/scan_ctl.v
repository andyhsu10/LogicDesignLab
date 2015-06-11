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
    clk_ctl,
	display0,
	display1,
	display2,
	display3,
    ctl,
    out
);

output reg [`BIT_WIDTH4-1:0] ctl;
output reg [3:0] out;
input [1:0] clk_ctl;
input [3:0] display0, display1, display2, display3;

always @*
	case(clk_ctl)
		2'b00:
		begin
			ctl = 4'b0111;
			out = display0;
		end
		2'b01:
		begin
			ctl = 4'b1011;
			out = display1;
		end
		2'b10:
		begin
			ctl = 4'b1101;
			out = display2;
		end
		2'b11:
		begin
			ctl = 4'b1110;
			out = display3;
		end
	endcase

endmodule
