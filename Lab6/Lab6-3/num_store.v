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
`define STAT_PAUSE 2'd2
`define DISABLED 1'b0
`define ENABLED 1'b1
`define NUM_BIT_WIDTH 4
`define NUM_OUT_BIT_WIDTH 8
module num_store(
	value_out, //number output
	unit_out, //unit digit output
	tens_out, //tens digit output
	check_state, //check state
	num_in, //number input
	clk, //clock
	enable, //enable for storing in value
	pressed, //button pressed
	rst_n //active low reset
    );

output [`NUM_OUT_BIT_WIDTH-1:0] value_out; //number output
output [`NUM_BIT_WIDTH-1:0] tens_out, unit_out; //unit and tens digit output
output [1:0] check_state;
input clk; //clock
input enable; //enable for storing in value
input pressed; //button pressed
input rst_n; //active low reset
input [`NUM_BIT_WIDTH-1:0] num_in; //number input

reg[`NUM_OUT_BIT_WIDTH-1:0] value_out; //output (in always block)
reg [`NUM_BIT_WIDTH-1:0] tens_out, unit_out; //unit and tens digit output
reg [`NUM_BIT_WIDTH-1:0] tens1_tmp, tens2_tmp, unit_tmp; //temp storage

wire [1:0] state; //state of FSM
wire store_enable1, store_enable2;

fsm_num_store fsm_num_memory(
	.state(state), //number memory state
	.store_enable1(store_enable1),
	.store_enable2(store_enable2),
	.pressed(pressed), //button pressed input
	.enable(enable), //enable
	.clk(clk), //clock input
	.rst_n(rst_n) //low active reset
);

assign check_state = state;

//Sequential lodics: Flip flops
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		begin
			value_out <= `NUM_OUT_BIT_WIDTH'd0;
			unit_out <= `NUM_BIT_WIDTH'd0;
			tens_out <= `NUM_BIT_WIDTH'd0;
		end
	else if(enable && pressed && (store_enable1 == `ENABLED))
		begin
			unit_tmp <= num_in;
			tens1_tmp <= num_in;
		end
	else if(enable && pressed && (store_enable2 == `ENABLED))
		begin
			unit_tmp <= num_in;
			tens2_tmp <= tens1_tmp;
		end
	else if(state == `STAT_PAUSE)
		begin
			unit_out <= unit_tmp;
			tens_out <= tens2_tmp;
			value_out <= tens_out * 4'd10 + unit_out;
		end
	else
		begin
			unit_out <= unit_tmp;
			tens_out <= tens2_tmp;
			value_out <= `NUM_OUT_BIT_WIDTH'd0;
		end	

endmodule
