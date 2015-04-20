`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:19:24 04/11/2015 
// Design Name: 
// Module Name:    downcounter 
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
`define BCD_ZERO 4'b0
`define INCREMENT 4'b1
`define DISABLED 4'b0
`define ENABLED 4'b1
module downcounter(
	value,  // counter output
	borrow,  // borrow indicator
	clk, // global clock
	rst_n, // active low reset
	decrease, // counter enable control
	limit, // limit for the counter
	initial_value,//for reset
	stop_condition//1:stop  0:non stop
); 
//output
	output [3:0]value;
	output borrow;
	input clk, rst_n, decrease, stop_condition;
	input [3:0]initial_value;
	input [3:0]limit;
	
	reg [3:0]value_tmp;
	reg [3:0]value;
	reg borrow;
	
	
	
// Combinational logics
always @*
	if (value==`BCD_ZERO && decrease)
	begin
		value_tmp = limit;
      borrow = `ENABLED;
	end
	else if (value!=`BCD_ZERO && decrease)
	begin
		value_tmp = value - `INCREMENT;
      borrow = `DISABLED;
	end
	else
	begin
		value_tmp = value;
		borrow = `DISABLED;
	end
	
// register part for BCD counter 
always @(posedge clk or negedge rst_n)
	if (~rst_n)
		value <= initial_value;
	else
		value <= value_tmp;

endmodule
