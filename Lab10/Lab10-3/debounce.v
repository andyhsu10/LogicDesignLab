`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:58:14 04/16/2015 
// Design Name: 
// Module Name:    debounce 
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
module debounce(
	clk, //clock control (I)
	rst_n, //active low reset (I)
	pb_in, //push button input (I)
	pb_debounced //debounced push button output (O)
);

//I/Os
input clk, rst_n, pb_in;
output reg pb_debounced; //debounced push button output

//declare the internal nodes
reg [3:0] debounce_window; //shift register flip flop
reg pb_debounced_next; //debounce result

//Shift register
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		debounce_window <= 4'd0;
	else
		debounce_window <= {debounce_window[2:0],~pb_in};

//debounce circuit
always @*
	if(debounce_window == 4'b1111)
		pb_debounced_next = 1'b1;
	else
		pb_debounced_next = 1'b0;

always @(posedge clk or negedge rst_n)
	if(~rst_n)
		pb_debounced <= 1'b0;
	else
		pb_debounced <= pb_debounced_next;

endmodule
