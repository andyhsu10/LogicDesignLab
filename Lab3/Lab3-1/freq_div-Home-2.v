`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:20:40 03/19/2015 
// Design Name: 
// Module Name:    freq_div 
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
`define FREQ_DIV_BIT_WIDTH 25
module freq_div(
	out,
	clk, //clock
	rst_n
    );
	 
output [`FREQ_DIV_BIT_WIDTH:0] out;
input clk, rst_n;

reg [`FREQ_DIV_BIT_WIDTH:0] out;
reg [`FREQ_DIV_BIT_WIDTH:0] tmp;

//Combinational logics
always @(out)
	tmp = out +1'b1;
//Sequential logics: Flip-flop
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		out<=0;
	else
		out<=tmp;

endmodule
