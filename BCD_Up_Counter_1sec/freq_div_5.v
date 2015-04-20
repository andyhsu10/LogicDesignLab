`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:40:13 03/20/2015 
// Design Name: 
// Module Name:    freq_div_5 
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
`define BC_BIT_WIDTH 3
module freq_div_5(
	out, //output
	clk_out, //clock output
	clk, //clock
	rst_n //active low reset
    );

output[`BC_BIT_WIDTH-1:0] out; //counter output
output clk_out; //clock output
input clk; //clock
input rst_n; //active low reset

reg[`BC_BIT_WIDTH-1:0] out; //counter output (in always block)
reg[`BC_BIT_WIDTH-1:0] out_tmp; //input to dff (in always block)
reg clk_out; //clock output (in always block)

//Combinational logic
always @(out)
	out_tmp = out + 1'b1;
	
//Sequential lodics: Flip flops
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		out <= 3'b0;
	else if(out == 3'd4)
		begin
		 out <= 3'b0;
		 clk_out = 1'b1;
		end
	else
		begin
		 out <= out_tmp;
		 clk_out = 1'b0;
		end
endmodule