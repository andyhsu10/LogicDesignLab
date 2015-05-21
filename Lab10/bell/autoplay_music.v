`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu
// 
// Create Date:    19:42:15 05/21/2015 
// Module Name:    autoplay_music
// Project Name:   Lab10-2
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module autoplay_music(
	clk, //clock from crystal (I)
	rst_n, //active low reset (I)
	display, //SSD output (O)
	control, //SSD control signal (O)
	audio_appsel, //playing mode selection (O)
	audio_sysclk, //control clock for DAC (from crystal) (O)
	audio_bck, //bit clock of audio data (5MHz) (O)
	audio_ws, //left/right parallel to serial control (O)
	audio_data //serial output audio data (O)
);

//I/Os
input clk; //clock from the crystal
input rst_n; //active low reset
output [14:0] display; //SSD output
output [3:0] control; //SSD control signal
output audio_appsel; //playing mode selection
output audio_sysclk; //control clock for DAC (from crystal)
output audio_bck; //bit clock of audio data (5MHz)
output audio_ws; //left/right parallel to serial control
output audio_data; //serial output audio data

//Declare internal nodes
wire carry;
wire clk_fast;
wire [1:0] clk_ctl;
wire [5:0] letter, letter1, letter2;
wire [9:0] q;
wire [15:0] audio_in_left, audio_in_right;
wire [19:0] note_div;

freq_div freqency_divider(
	.clk_fast(clk_fast),
	.clk_ctl(clk_ctl), //divided clock output for scan freq (O)
	.clk(clk), //global clock input (I)
	.rst_n(rst_n) //active low reset
);

music music_play(
	.q0(q), //shifter output
	.clk(carry), // global clock
	.rst_n(rst_n) //active low reset
);

note_ctl note_controllor(
	.carry(carry), //carryout to enable counting in next stage (O)
	.note_div(note_div), //div for note generation (O)
	.letter1(letter1), //letter 1 output  (O)
	.letter2(letter2), //letter 2 output (O)
	.clk(clk_fast), //global clock (I)
	.q(q), //music input (I)
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

scan_ctl scan_controllor(
    .bcd_in1(letter1),
    .bcd_in2(letter2),
    .clk_ctl(clk_ctl),
    .ssd_ctl(control),
    .bcd_out(letter)
);

ssd_decoder decoder(
	.ssd_out(display), //14-segment display output
	.bcd(letter) //BCD input
);

endmodule