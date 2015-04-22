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
`define NUM_BIT_WIDTH4 4
`define ANS_BIT_WIDTH 8
module answer_store(
	answer_out, //binary answer output
	pos_neg, //determine whether the ans is positive(0) or negative(1)
	left_in, //augend & minuend input
	right_in, //addend & subtrahend input
	clk, //clock
	enable, //enable
	state, //states for add or minus
	rst_n //active low reset
    );

output[`ANS_BIT_WIDTH-1:0] answer_out; //answer output
output pos_neg; //determine whether the ans is positive or negative
input clk; //clock input
input enable; //enable
input [2:0] state; //states for add or minus
input rst_n; //active low reset
input [`NUM_BIT_WIDTH4-1:0] left_in; //augend & minuend input
input [`NUM_BIT_WIDTH4-1:0] right_in; //augend & subtrahend input

reg [`ANS_BIT_WIDTH-1:0] answer_out; //output (in always block)
reg [`NUM_BIT_WIDTH4-1:0] left_in_tmp; //augend & minuend input temp
reg [`NUM_BIT_WIDTH4-1:0] right_in_tmp; //augend & subtrahend input temp
reg pos_neg; //determine whether the ans is positive(0) or negative(1)

wire [`ANS_BIT_WIDTH-1:0] ans_add_minus, ans_multi;

four_bits_adder adder_subtracter(
	.result(ans_add_minus), //answer output
	.a(left_in_tmp), //addend input
	.b(right_in_tmp), //augend input
	.ci(1'b0) //carry in
);

multiplier multiple(
	.a(left_in),
	.b(right_in),
	.c(ans_multi)
);

always @(posedge clk or negedge rst_n)
	if(~rst_n)
		begin
			pos_neg <= 1'd0;
			answer_out <= `ANS_BIT_WIDTH'd0;
		end
	else if(enable && (state == 3'd4))
		begin
			pos_neg <= 1'd0;
			left_in_tmp <= left_in;
			right_in_tmp <= right_in;
			answer_out <= ans_add_minus;
		end
	else if(enable && (state == 3'd5) && (left_in > right_in))
		begin
			pos_neg <= 1'd0;
			left_in_tmp <= left_in;
			right_in_tmp <= ((~right_in) + 1'b1);
			answer_out <= ans_add_minus[3:0];
		end
	else if(enable && (state == 3'd5) && (right_in > left_in))
		begin
			pos_neg <= 1'd1;
			left_in_tmp <= right_in;
			right_in_tmp <= ((~left_in) + 1'b1);
			answer_out <= ans_add_minus[3:0];
		end
	else if(enable && (state == 3'd6))
		begin
			pos_neg <= 1'd0;
			answer_out <= ans_multi;
		end
	else
		begin
			pos_neg <= 1'd0;
			answer_out <= `ANS_BIT_WIDTH'd0;
		end

endmodule
