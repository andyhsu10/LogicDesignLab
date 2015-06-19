`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu & Hsin-Ho Lu
// 
// Create Date:    17:04:09 06/19/2015 
// Module Name:    one_pulse
// Project Name:   2015 Spring Logic Design Laboratory Final Project
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
module one_pulse(
	clk, //clock input
	rst_n, //active low reset
	in_trig, //input trigger
	out_pulse //output one pulse
);

//I/Os
input clk, rst_n, in_trig;
output reg out_pulse; //output one pulse
reg in_trig_delay; //internal nodes

//Buffer input
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		in_trig_delay <= 1'b0;
	else
		in_trig_delay <= in_trig;

//Pulse generation
assign out_pulse_next = in_trig & (~in_trig_delay);

always @(posedge clk or negedge rst_n)
	if(~rst_n)
		out_pulse <= 1'b1;
	else
		out_pulse <= (~out_pulse_next);

endmodule
