`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:33:37 04/11/2015 
// Design Name: 
// Module Name:    downcounter30 
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
module downcounter30(
	out0,//first bit out
	out1,//second bit out
	fin,//1:out1=out0=0  else 0:
	clk,
	rst_n,
	in0,
	in1,
	limit0,
	limit1,
	en
);
	 
	output [3:0]out0, out1;
	output [15:0]fin;
	input clk, rst_n, en;
	input [3:0]in0, in1, limit0, limit1;
	
	wire br0;
	reg [15:0]fin;
	reg en_temp;
	
downcounter DC0(
	.value(out0),  // counter output
	.borrow(br0),  // borrow indicator
	.clk(clk), // global clock
	.rst_n(rst_n), // active low reset
	.decrease(en_temp), // counter enable control
	.limit(limit0), // limit for the counter
	.initial_value(in0)//for reset
); 
downcounter DC1(
	.value(out1),  // counter output
	//.borrow,  // borrow indicator
	.clk(clk), // global clock
	.rst_n(rst_n), // active low reset
	.decrease(br0), // counter enable control
	.limit(limit1), // limit for the counter
	.initial_value(in1)//for reset
); 
	 
always@*
if(out0 == 0 && out1 == 0)
	fin = 16'b1111_1111_1111_1111;
else
	fin = 16'b0;

always@*
if (out0 == 4'd0 && out1 == 4'd0)
en_temp = 1'b0;
else
en_temp = en;



endmodule
