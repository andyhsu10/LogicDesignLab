`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:24:27 04/23/2015 
// Design Name: 
// Module Name:    store_number 
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
module store_number(
	clk,
	rst_n,
	store_en,//from fsm
	in,//input
	out//output
);

	input clk;
	input rst_n;
	input [6:0]in;
	input store_en;
	
	output reg [6:0]out;
	
always@(posedge clk or negedge rst_n)
	if (~rst_n)
		out <= 7'd0;
	else if ( store_en )
		out <= in;
	else 
		out <= out;


endmodule
