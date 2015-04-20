`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:40:13 03/20/2015 
// Design Name: 
// Module Name:    num_store 
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
`define NUM_BIT_WIDTH 4
module num_store(
	num_out, //number output
	num_in, //number input
	clk, //clock
	enable, //enable for storing in value
	pressed, //button pressed
	rst_n //active low reset
    );

output[`NUM_BIT_WIDTH-1:0] num_out; //number output
input clk; //clock
input enable; //enable for storing in value
input pressed; //button pressed
input rst_n; //active low reset
input [`NUM_BIT_WIDTH-1:0] num_in; //number input

reg[`NUM_BIT_WIDTH-1:0] num_out; //output (in always block)

//Sequential lodics: Flip flops
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		num_out <= 4'd0;
	else if((num_out != num_in) && enable && pressed)
		num_out <= num_in;
	else
		num_out <= num_out;

endmodule
