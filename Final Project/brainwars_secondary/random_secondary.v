`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu & Hsin-Ho Lu
// 
// Create Date:    00:33:23 06/19/2015 
// Module Name:    random_secondary
// Project Name:   2015 Spring Logic Design Laboratory Final Project
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
module random_secondary(
	rand, //random value output (O)
	clk, //global clock input (I)
	rst_n //active low reset (I)
);
	 
//I/Os
output [15:0] rand; //random value output
input clk; //global clock input
input rst_n; //active low reset

reg [15:0] rand; //random value output

always @(posedge clk or negedge rst_n)
	if(~rst_n)
		rand <= 16'b0010101110000111;
	else
		rand <= {rand[15:8], rand[8] ^ rand[6], rand[4:0], rand[5] & rand[10], rand[7]};

endmodule
