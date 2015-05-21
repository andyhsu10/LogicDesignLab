`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu
// 
// Create Date:    19:08:53 05/21/2015 
// Module Name:    sound_repeat 
// Project Name:   Lab10-1
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module sound_repeat(
	clk, //clock from crystal (I)
	rst_n, //active low reset (I)
	audio_appsel, //playing mode selection (O)
	audio_sysclk, //control clock for DAC (from crystal) (O)
	audio_bck, //bit clock of audio data (5MHz) (O)
	audio_ws, //left/right parallel to serial control (O)
	audio_data //serial output audio data (O)
);

//I/Os
input clk; //clock from the crystal
input rst_n; //active low reset
output audio_appsel; //playing mode selection
output audio_sysclk; //control clock for DAC (from crystal)
output audio_bck; //bit clock of audio data (5MHz)
output audio_ws; //left/right parallel to serial control
output audio_data; //serial output audio data

//Declare internal nodes
wire clk_1;
wire [15:0] audio_in_left, audio_in_right;
wire [19:0] note_div;

clock_generator clk_generate(
  .clk(clk), // clock from crystal (I)
  .rst_n(rst_n), // active low reset (I)
  .clk_1(clk_1) // generated 1 Hz clock (O)
);

note_decide note_decision(
	.note_div(note_div), //div for note generation (O)
	.clk(clk_1), //global clock (I)
	.rst_n(rst_n) //active low reset
);

//Note generation
buzzer_ctl buzzer_controllor(
	.clk(clk), //clock from crystal (I)
	.rst_n(rst_n), //active low reset (I)
	.note_div(note_div), //div for note generation (I)
	.audio_left(audio_in_left), //left sound audio (O)
	.audio_right(audio_in_right) //right sound audio (O)
);

//Speaker controllor
speaker_ctl speaker_controllor(
	.clk(clk), //clock from the crystal (I)
	.rst_n(rst_n), //active low reset (I)
	.audio_in_left(audio_in_left), //left channel audio data input (I)
	.audio_in_right(audio_in_right), //right channel audio data input (I)
	.audio_appsel(audio_appsel), //playing mode selection (O)
	.audio_sysclk(audio_sysclk), //control clock for DAC (from crystal) (O)
	.audio_bck(audio_bck), //bit clock of audio data (5MHz) (O)
	.audio_ws(audio_ws), //left/right parallel to serial control (O)
	.audio_data(audio_data) //serial output audio data (O)
);

endmodule