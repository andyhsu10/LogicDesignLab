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
`define NUM_OUT_BIT_WIDTH 8
module num_store(
	value_out, //number output
	unit_out, //unit digit output
	tens_out, //tens digit output
	num_in, //number input
	clk, //clock
	enable, //enable for storing in value
	pressed, //button pressed
	rst_n //active low reset
    );

output [`NUM_OUT_BIT_WIDTH-1:0] value_out; //number output
output [`NUM_BIT_WIDTH-1:0] tens_out, unit_out; //unit and tens digit output
input clk; //clock inout
input enable; //enable for storing in value
input pressed; //button pressed
input rst_n; //active low reset
input [`NUM_BIT_WIDTH-1:0] num_in; //number input

reg[`NUM_OUT_BIT_WIDTH-1:0] value_out; //output (in always block)
reg [`NUM_BIT_WIDTH-1:0] tens_out, unit_out; //unit and tens digit output

//Sequential lodics: Flip flops
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		begin
			value_out <= `NUM_OUT_BIT_WIDTH'd0;
			unit_out <= `NUM_BIT_WIDTH'd0;
			tens_out <= `NUM_BIT_WIDTH'd0;
		end
	else if(enable && pressed && (unit_out == `NUM_BIT_WIDTH'd0) && (tens_out == `NUM_BIT_WIDTH'd0))
		begin
			unit_out <= num_in;
			tens_out <= `NUM_BIT_WIDTH'd0;
		end
	else if(enable && pressed && (unit_out != `NUM_BIT_WIDTH'd0) && (tens_out == `NUM_BIT_WIDTH'd0))
		begin
			unit_out <= num_in;
			tens_out <= unit_out;
		end
	else
		begin
			unit_out <= unit_out;
			tens_out <= tens_out;
			value_out <= tens_out * 4'd10 + unit_out;
		end

endmodule
