`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu & Hsin-Ho Lu
// 
// Create Date:    20:47:29 06/15/2015 
// Module Name:    speaker_ctl 
// Project Name:   2015 Spring Logic Design Laboratory Final Project
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
module speaker_ctl(
	clk, //clock from the crystal (I)
	rst_n, //active low reset (I)
	audio_in_left, //left channel audio data input (I)
	audio_in_right, //right channel audio data input (I)
	audio_appsel, //playing mode selection (O)
	audio_sysclk, //control clock for DAC (from crystal) (O)
	audio_bck, //bit clock of audio data (5MHz) (O)
	audio_ws, //left/right parallel to serial control (O)
	audio_data //serial output audio data (O)
);

//I/Os
input clk; //clock from the crystal
input rst_n; //active low reset
input [15:0] audio_in_left; //left channel audio data input
input [15:0] audio_in_right; //right channel audio data input
output audio_appsel; //playing mode selection
output audio_sysclk; //control clock for DAC (from crystal)
output audio_bck; //bit clock of audio data (5MHz)
output audio_ws; //left/right parallel to serial control
output audio_data; //serial output audio data

reg audio_bck; //bit clock of audio data (5MHz)
reg audio_ws; //left/right parallel to serial control
reg audio_data; //serial output audio data
reg [1:0] audio_cnt_l; //temp buf of the counter
reg [3:0] audio_cnt_h; //temp buf of the counter
reg [7:0] audio_cnt;


//audio_appsel
assign audio_appsel = 1'b1;


//audio_sysclk
assign audio_sysclk = clk;


//audio_bck & audio_ws
always @(audio_ws or audio_cnt_h or audio_bck or audio_cnt_l)
	audio_cnt = {audio_ws,audio_cnt_h,audio_bck,audio_cnt_l} + 1'b1;

always @(posedge clk or negedge rst_n)
	if(~rst_n) {audio_ws,audio_cnt_h,audio_bck,audio_cnt_l} <= 8'd0;
	else {audio_ws,audio_cnt_h,audio_bck,audio_cnt_l} <= audio_cnt;


//audio_data
always @*
	case({audio_ws,audio_cnt_h})
		5'b0_0000: audio_data = audio_in_left[15];
		5'b0_0001: audio_data = audio_in_left[14];
		5'b0_0010: audio_data = audio_in_left[13];
		5'b0_0011: audio_data = audio_in_left[12];
		5'b0_0100: audio_data = audio_in_left[11];
		5'b0_0101: audio_data = audio_in_left[10];
		5'b0_0110: audio_data = audio_in_left[9];
		5'b0_0111: audio_data = audio_in_left[8];
		5'b0_1000: audio_data = audio_in_left[7];
		5'b0_1001: audio_data = audio_in_left[6];
		5'b0_1010: audio_data = audio_in_left[5];
		5'b0_1011: audio_data = audio_in_left[4];
		5'b0_1100: audio_data = audio_in_left[3];
		5'b0_1101: audio_data = audio_in_left[2];
		5'b0_1110: audio_data = audio_in_left[1];
		5'b0_1111: audio_data = audio_in_left[0];
		5'b1_0000: audio_data = audio_in_right[15];
		5'b1_0001: audio_data = audio_in_right[14];
		5'b1_0010: audio_data = audio_in_right[13];
		5'b1_0011: audio_data = audio_in_right[12];
		5'b1_0100: audio_data = audio_in_right[11];
		5'b1_0101: audio_data = audio_in_right[10];
		5'b1_0110: audio_data = audio_in_right[9];
		5'b1_0111: audio_data = audio_in_right[8];
		5'b1_1000: audio_data = audio_in_right[7];
		5'b1_1001: audio_data = audio_in_right[6];
		5'b1_1010: audio_data = audio_in_right[5];
		5'b1_1011: audio_data = audio_in_right[4];
		5'b1_1100: audio_data = audio_in_right[3];
		5'b1_1101: audio_data = audio_in_right[2];
		5'b1_1110: audio_data = audio_in_right[1];
		5'b1_1111: audio_data = audio_in_right[0];
		default: audio_data = 1'b0;
	endcase

endmodule