`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu
// 
// Create Date:    18:56:20 05/21/2015 
// Module Name:    buzzer_ctl 
// Project Name:   Lab10-2
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
module buzzer_ctl(
	clk, //clock from crystal (I)
	rst_n, //active low reset (I)
	note_div_left, //left div for note generation (I)
	note_div_right, //right div for note generation (I)
	audio_left, //left sound audio (O)
	audio_right //right sound audio (O)
);

//I/Os
input clk; //clock from crystal
input rst_n; //active low reset
input [19:0] note_div_left, note_div_right; //left and right div for note generation
output [15:0] audio_left; //left sound audio
output [15:0] audio_right; //right sound audio

//Decalare internal signals
reg [19:0] clk_cnt_left, clk_cnt_left_next, clk_cnt_right, clk_cnt_right_next;
reg b_clk_left, b_clk_left_next, b_clk_right, b_clk_right_next;

//Note frequency generation
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		begin
			clk_cnt_left <= 20'd0;
			clk_cnt_right <= 20'd0;
			b_clk_left <= 1'b0;
			b_clk_right <= 1'b0;
		end
	else
		begin
			clk_cnt_left <= clk_cnt_left_next;
			clk_cnt_right <= clk_cnt_right_next;
			b_clk_left <= b_clk_left_next;
			b_clk_right <= b_clk_right_next;
		end

//left generation
always @*
	if(clk_cnt_left == note_div_left)
		begin
			clk_cnt_left_next = 20'd0;
			b_clk_left_next = ~b_clk_left;
		end
	else
		begin
			clk_cnt_left_next = clk_cnt_left + 1'b1;
			b_clk_left_next = b_clk_left;
		end

//right generation
always @*
	if(clk_cnt_right == note_div_right)
		begin
			clk_cnt_right_next = 20'd0;
			b_clk_right_next = ~b_clk_right;
		end
	else
		begin
			clk_cnt_right_next = clk_cnt_right + 1'b1;
			b_clk_right_next = b_clk_right;
		end

//Assign the amplitude of the note
assign audio_left = (b_clk_left == 1'b0) ? 16'hC000:16'h3FFF;
assign audio_right = (b_clk_right == 1'b0) ? 16'hC000:16'h3FFF;

endmodule