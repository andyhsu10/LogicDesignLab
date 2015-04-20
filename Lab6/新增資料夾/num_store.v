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
`define STAT_UNIT 2'd0
`define STAT_TENS 2'd1
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
input clk; //clock
input enable; //enable for storing in value
input pressed; //button pressed
input rst_n; //active low reset
input [`NUM_BIT_WIDTH-1:0] num_in; //number input

reg[`NUM_OUT_BIT_WIDTH-1:0] value_out; //output (in always block)
reg [`NUM_BIT_WIDTH-1:0] tens_out, unit_out; //unit and tens digit output
reg [`NUM_BIT_WIDTH-1:0] tens1_tmp, tens2_tmp, unit_tmp; //temp storage

wire [1:0] state; //state of FSM

fsm_num_store fsm_num_memory(
	.state(state), //number memory state
	.pressed(pressed), //button pressed input
	.rst_n(rst_n) //low active reset
);

//Sequential lodics: Flip flops
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		begin
			value_out <= 8'd0;
			unit_tmp <= 4'd0;
			tens1_tmp <= 4'd0;
			tens2_tmp <= 4'd0;
		end
	else if((value_out != num_in) && enable && pressed && (state == `STAT_UNIT))
		begin
			unit_tmp <= num_in;
			tens1_tmp <= num_in;
		end
	else if((value_out != num_in) && enable && pressed && (state == `STAT_TENS))
		begin
			unit_tmp <= num_in;
			tens2_tmp <= tens1_tmp;
		end
	else
		begin
			unit_out <= unit_tmp;
			tens_out <= tens2_tmp;
			value_out <= tens_out * 4'd10 + unit_out;
		end
		

endmodule
