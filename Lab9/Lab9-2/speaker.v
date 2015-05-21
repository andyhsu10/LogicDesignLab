`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu
// 
// Create Date:    16:36:20 05/21/2015 
// Module Name:    speaker 
// Project Name:   Lab9-1
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module speaker(
	clk, //clock from crystal (I)
	DO, //DO button (I)
	RE, //RE button (I)
	MI, //MI button (I)
	increase, //volume increase button (I)
	decrease, //volume decrease button (I)
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
input DO; //DO button
input RE; //RE button
input MI; //MI button
input increase; //volume increase button
input decrease; //volume decrease button
input rst_n; //active low reset
output [14:0] display; //SSD output
output [3:0] control; //SS control signal
output audio_appsel; //playing mode selection
output audio_sysclk; //control clock for DAC (from crystal)
output audio_bck; //bit clock of audio data (5MHz)
output audio_ws; //left/right parallel to serial control
output audio_data; //serial output audio data

//Declare internal nodes
wire clk_100;
wire de_do, de_re, de_mi, de_increase, de_decrease;
wire [1:0] clk_ctl;
wire [3:0] vol_unit, vol_tens, bcd_out;
wire [15:0] volume;
wire [15:0] audio_in_left, audio_in_right;
reg [19:0] note_div;

freq_div frequency_divider(
	.clk_ctl(clk_ctl), //divided clock output for scan freq (O)
	.clk(clk), //global clock input (I)
	.rst_n(rst_n) //active low reset
);

clock_generator clk_generate(
  .clk(clk), // clock from crystal (I)
  .rst_n(rst_n), // active low reset (I)
  .clk_100(clk_100) // generated 100 Hz clock (O)
);

debounce de_do1(
	.clk(clk_100), //clock control (I)
	.rst_n(rst_n), //active low reset (I)
	.pb_in(DO), //push button input (I)
	.pb_debounced(de_do) //debounced push button output (O)
);

debounce de_re1(
	.clk(clk_100), //clock control (I)
	.rst_n(rst_n), //active low reset (I)
	.pb_in(RE), //push button input (I)
	.pb_debounced(de_re) //debounced push button output (O)
);

debounce de_mi1(
	.clk(clk_100), //clock control (I)
	.rst_n(rst_n), //active low reset (I)
	.pb_in(MI), //push button input (I)
	.pb_debounced(de_mi) //debounced push button output (O)
);

debounce_one_pulse de_increase1(
	.de_clk(clk_100), //debounce clock (I)
	.pulse_clk(clk_100), //one pulse clock (I)
	.rst_n(rst_n), //low active reset (I)
	.in(increase), //push button input (I)
	.out(de_increase) //pulsed push button output (O)
);

debounce_one_pulse de_decrease1(
	.de_clk(clk_100), //debounce clock (I)
	.pulse_clk(clk_100), //one pulse clock (I)
	.rst_n(rst_n), //low active reset (I)
	.in(decrease), //push button input (I)
	.out(de_decrease) //pulsed push button output (O)
);

volume_ctl volume_controllor(
	.volume(volume), //volume output (O)
	.vol_unit(vol_unit), //unit volume volue (O)
	.vol_tens(vol_tens), //tens volume volue (O)
	.increase(de_increase), //input control (I)
	.decrease(de_decrease), //input control (I)
	.clk(clk_100), //global clock signal (I)
	.rst_n(rst_n) //active low reset (I)
);

always @*
	if(de_do)
		note_div = `C4;
	else if(de_re)
		note_div = `D4;
	else if(de_mi)
		note_div = `E4;
	else
		note_div = 20'd0;

//Note generation
buzzer_ctl buzzer_controllor(
	.clk(clk), //clock from crystal (I)
	.rst_n(rst_n), //active low reset (I)
	.note_div(note_div), //div for note generation (I)
	.volume(volume), //volume input (I)
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
    .bcd_in1(vol_tens),
    .bcd_in2(vol_unit),
    .clk_ctl(clk_ctl),
    .ssd_ctl(control),
    .bcd_out(bcd_out)
);

ssd_decoder decoder(
	.ssd_out(display), //14-segment display output
	.bcd(bcd_out) //BCD input
);

endmodule