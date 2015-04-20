`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:36:35 03/17/2015 
// Design Name: 
// Module Name:    BUC_4bit 
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
`define BUC_BIT_WIDTH 4
module BUC_4bit(
	out, //output
	clk, //clock
	rst_n //active low reset
    );

output[`BUC_BIT_WIDTH-1:0] out; //counter output
input clk; //clock
input rst_n; //active low reset

reg[`BUC_BIT_WIDTH-1:0] out; //output (in always block)
reg[`BUC_BIT_WIDTH-1:0] out_tmp; //input to dff (in always block)

//Combinational logics
always @(out)
	out_tmp = out + 1'b1;

//Sequential lodics: Flip flops
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		out<=0;
	else
		out <= out_tmp;

endmodule
