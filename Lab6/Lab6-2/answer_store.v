`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:40:13 03/20/2015 
// Design Name: 
// Module Name:    answer_store 
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
`define ANS_BIT_WIDTH 5
module answer_store(
	answer_out, //answer output
	addend_in, //addend input
	augend_in, //augend input
	clk, //clock
	enable, //enable
	rst_n //active low reset
    );

output[`ANS_BIT_WIDTH-1:0] answer_out; //answer output
input clk; //clock input
input enable; //enable
input rst_n; //active low reset
input [`NUM_BIT_WIDTH-1:0] addend_in; //addend input
input [`NUM_BIT_WIDTH-1:0] augend_in; //augend input

reg[`ANS_BIT_WIDTH-1:0] answer_out; //output (in always block)

//Sequential lodics: Flip flops
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		answer_out <= 5'd0;
	else if(enable)
		answer_out <= addend_in + augend_in;

endmodule
