`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:52:28 06/19/2015 
// Design Name: 
// Module Name:    rand_0_to_7 
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
module rand_0_to_7(
	clk,//100HZ
	rst_n,
	key,
	pressed,
	rand_out,
	point_out
);

input clk;
input rst_n;
input [3:0]key;
input pressed;

output reg [2:0]rand_out;
output point_out;
reg [2:0]rand, rand_out_temp;
reg point_out_t;


always@(posedge clk or negedge rst_n)
if (~rst_n)
	rand = 3'd0;
else
	rand = rand + 3'd1;

always@(posedge clk or negedge rst_n)
if (~rst_n)
	rand_out = 3'd0;
else
	rand_out = rand_out_temp;
// if answer is right:
//							1. get point
//							2. output new test
always@*
if ((rand_out == 3'd0 || rand_out == 3'd5) && pressed && key == 4'd5)
	begin
		rand_out_temp = rand;
		point_out_t = 1'b1;
	end
else if ((rand_out == 3'd1 || rand_out == 3'd4) && pressed && key == 4'd4)
	begin
		rand_out_temp = rand;
		point_out_t = 1'b1;
	end
else if ((rand_out == 3'd2 || rand_out == 3'd7) && pressed && key == 4'd7)
	begin
		rand_out_temp = rand;
		point_out_t = 1'b1;
	end
else if ((rand_out == 3'd3 || rand_out == 3'd6) && pressed && key == 4'd1)
	begin
		rand_out_temp = rand;
		point_out_t = 1'b1;
	end
else
	begin
		rand_out_temp = rand_out;
		point_out_t = 1'b0;
	end

one_pulse ONE_P(
	.clk(clk),// clock input
	.rst_n(rst_n), //active low reset
	.in_trig(point_out_t), // input trigger
	.out_pulse(point_out) // output one pulse
);
endmodule
