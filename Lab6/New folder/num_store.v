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
`define NUM_OUT_BIT_BIDTH 8
`define STAT_UNIT 2'd0
`define STAT_TENS 2'd1
`define STAT_PAUSE 2'd3
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
reg [1:0] state; //state of FSM
reg [1:0] next_state; //next state of FSM
reg [`NUM_BIT_WIDTH-1:0] tens_out, unit_out; //temp storage

//FSM state transition
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		state <= 2'd0;
	else
		state <= next_state;

//FSM state decision
always @*
	case(state)
		`STAT_UNIT:
			if(pressed)
				next_state = `STAT_TENS;
			else
				next_state = `STAT_UNIT;
		`STAT_TENS:
			if(pressed)
				next_state = `STAT_PAUSE;
			else
				next_state = `STAT_TENS;
		`STAT_PAUSE:
			next_state = `STAT_PAUSE;
		default:
			next_state = `STAT_UNIT;
	endcase


//Sequential lodics: Flip flops
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		begin
			value_out <= 8'd0;
			unit_out <= 4'd0;
			tens_out <= 4'd0;
		end
	else if((value_out != num_in) && enable && (state == `STAT_UNIT))
		unit_out <= num_in;
	else if((value_out != num_in) && enable && (state == `STAT_TENS))
		begin
			tens_out <= unit_out;
			unit_out <= num_in;
		end
	else
		value_out <= tens_out * 4'd10 + unit_out;

endmodule
