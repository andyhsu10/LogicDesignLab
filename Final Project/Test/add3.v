`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu & Hsin-Ho Lu
//
// Create Date:    18:39:53 06/23/2015
// Module Name:    add3
// Project Name:   2015 Spring Logic Design Laboratory Final Project
// Revision:
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
module add3(
	in,
	out
);

input [3:0] in;
output reg [3:0] out;

always @ (in)
	case (in)
		4'b0000: out <= 4'b0000;
		4'b0001: out <= 4'b0001;
		4'b0010: out <= 4'b0010;
		4'b0011: out <= 4'b0011;
		4'b0100: out <= 4'b0100;
		4'b0101: out <= 4'b1000;
		4'b0110: out <= 4'b1001;
		4'b0111: out <= 4'b1010;
		4'b1000: out <= 4'b1011;
		4'b1001: out <= 4'b1100;
		default: out <= 4'b0000;
	endcase
endmodule