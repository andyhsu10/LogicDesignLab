`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:40:13 03/20/2015 
// Design Name: 
// Module Name:    bcd_cnt 
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
module bcd_cnt(
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
		out <= 4'b0;
	else if(out == 4'd9)
		out <= 4'b0;
	else
		out <= out_tmp;

endmodule
