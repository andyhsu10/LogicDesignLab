`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu & Hsin-Ho Lu
// 
// Create Date:    20:49:49 06/15/2015 
// Module Name:    buzzer_ctl 
// Project Name:   2015 Spring Logic Design Laboratory Final Project
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
module buzzer_ctl(
	clk, //clock from crystal (I)
	rst_n, //active low reset (I)
	note_div, //div for note generation (I)
	audio_left, //left sound audio (O)
	audio_right //right sound audio (O)
);

//I/Os
input clk; //clock from crystal
input rst_n; //active low reset
input [19:0] note_div; //div for note generation
output [15:0] audio_left; //left sound audio
output [15:0] audio_right; //right sound audio

//Decalare internal signals
reg [19:0] clk_cnt, clk_cnt_next;
reg b_clk, b_clk_next;

//Note frequency generation
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		begin
			clk_cnt <= 20'd0;
			b_clk <= 1'b0;
		end
	else
		begin
			clk_cnt <= clk_cnt_next;
			b_clk <= b_clk_next;
		end

always @*
	if(clk_cnt == note_div)
		begin
			clk_cnt_next = 20'd0;
			b_clk_next = ~b_clk;
		end
	else
		begin
			clk_cnt_next = clk_cnt + 1'b1;
			b_clk_next = b_clk;
		end

//Assign the amplitude of the note
assign audio_left = (b_clk == 1'b0) ? 16'hC000:16'h009c;
assign audio_right = (b_clk == 1'b0) ? 16'hC000:16'h009c;

endmodule