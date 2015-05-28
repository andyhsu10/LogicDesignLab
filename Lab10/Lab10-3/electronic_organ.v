`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu
// 
// Create Date:    19:42:15 05/21/2015 
// Module Name:    electronic_organ 
// Project Name:   Lab10-2
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module electronic_organ(
	clk, //clock from crystal (I)
	DIP, //DIP switch (I)
	rst_n, //active low reset (I)
	col_n, //pressed column index (I)
	display, //SSD output (O)
	control, //SSD control signal (O)
	row_n, //scanned row index (O)
	audio_appsel, //playing mode selection (O)
	audio_sysclk, //control clock for DAC (from crystal) (O)
	audio_bck, //bit clock of audio data (5MHz) (O)
	audio_ws, //left/right parallel to serial control (O)
	audio_data //serial output audio data (O)
);

//I/Os
input clk; //clock from the crystal
input DIP; //DIP switch
input rst_n; //active low reset
input [3:0] col_n; //pressed colume index
output [14:0] display; //SSD output
output [3:0] control; //SSD control signal
output [3:0] row_n; //scanned row index
output audio_appsel; //playing mode selection
output audio_sysclk; //control clock for DAC (from crystal)
output audio_bck; //bit clock of audio data (5MHz)
output audio_ws; //left/right parallel to serial control
output audio_data; //serial output audio data

//Declare internal nodes
wire clk_100;
wire pressed, de_pressed;
wire [1:0] clk_ctl;
wire [3:0] key;
wire [5:0] letter, letter1, letter2, letter3, letter4;
wire [15:0] audio_in_left, audio_in_right;
wire [19:0] note_div_left, note_div_right;

freq_div freqency_divider(
	.clk_ctl(clk_ctl), //divided clock output for scan freq (O)
	.clk(clk), //global clock input (I)
	.rst_n(rst_n) //active low reset
);

clock_generator clk_generate(
  .clk(clk), // clock from crystal (I)
  .rst_n(rst_n), // active low reset (I)
  .clk_100(clk_100) // generated 1 Hz clock (O)
);

keypad_scan kaypad_scanner(
	.clk(clk_100), //scan clock (I)
	.rst_n(rst_n), //scan clock (I)
	.col_n(col_n), //pressed column index (I)
	.row_n(row_n), //scanned row index (O)
	.key(key), //returned pressed key (O)
	.pressed(pressed) //whether key pressed (1) or not (0) (O)
);

debounce de_press(
	.clk(clk_100), //clock control (I)
	.rst_n(rst_n), //active low reset (I)
	.pb_in(pressed), //push button input (I)
	.pb_debounced(de_pressed) //debounced push button output (O)
);

note_ctl note_controllor(
	.letter1(letter1), //letter 1 output (O)
	.letter2(letter2), //letter 2 output (O)
	.letter3(letter3), //letter 3 output (O)
	.letter4(letter4), //letter 4 output (O)
	.note_div_left(note_div_left), //left div for note generation (O)
	.note_div_right(note_div_right), //right div for note generation (O)
	.clk(clk_100), //global clock signal (I)
	.DIP(DIP), //DIP switch (I)
	.pressed(~de_pressed), //whether key pressed (1) or not (0) (I)
	.key(key), //returned pressed key (I)
	.rst_n(rst_n) //active low reset (I)
);

//Note generation
buzzer_ctl buzzer_controllor(
	.clk(clk), //clock from crystal (I)
	.rst_n(rst_n), //active low reset (I)
	.note_div_left(note_div_left), //left div for note generation (I)
	.note_div_right(note_div_right), //right div for note generation (I)
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
    .bcd_in3(letter3),
    .bcd_in4(letter4),
    .clk_ctl(clk_ctl),
    .ssd_ctl(control),
    .bcd_out(letter)
);

ssd_decoder decoder(
	.ssd_out(display), //14-segment display output
	.bcd(letter) //BCD input
);

endmodule