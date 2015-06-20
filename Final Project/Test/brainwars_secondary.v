`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu & Hsin-Ho Lu
// 
// Create Date:    20:49:21 06/15/2015 
// Module Name:    brainwars_secondary
// Project Name:   2015 Spring Logic Design Laboratory Final Project
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module brainwars_secondary(
	clk, //clock from crystal (I)
	rst_n, //active low reset (I)
	col_n, //pressed column index (I)
	row_n, //scanned row index (O)
	LCD_rst, //LCD reset (O)
    LCD_cs, //LCD frame selection (O)
    LCD_rw, //LCD read/write control (O)
    LCD_di, //LCD data/instruction (O)
    LCD_data, //LCD data (O)
    LCD_en //LCD enable (O)
);

//I/Os
input clk; //clock from the crystal
input rst_n; //active low reset
input [`KEYPAD_WIDTH-1:0] col_n;
output [`KEYPAD_WIDTH-1:0] row_n;
output LCD_rst; //LCD reset
output [1:0] LCD_cs; //LCD frame selection
output LCD_rw; //LCD read/write control
output LCD_di; //LCD data/instruction
output [7:0] LCD_data; //LCD data
output LCD_en; //LCD enable

//Declare internal nodes
wire rst;
wire pressed;
wire out_valid;
wire game_invite_back_state;
wire count_down_next_state;
wire clk_1, clk_2, clk_66, clk_100, clk_fast, clk_div;
wire de_game_invite, de_game_cancel;
wire [1:0] clk_ctl;
wire [3:0] key;
wire [5:0] letter;
wire [7:0] data_out;
wire [9:0] q;
wire [15:0] audio_in_left, audio_in_right;
wire [19:0] note_div;
wire [127:0] data_output;
wire point;
wire game_next_state;

wire [7:0] data; // byte data transfer from buffer

assign LCD_cs = 2'b10;

clock_generator clock_generate(
  .clk(clk), // clock from crystal (I)
  .rst_n(rst_n), // active low reset (I)
  .clk_1(clk_1), // generated 1 Hz clock (O)
  .clk_2(clk_2), // generated 2 Hz clock (O)
  .clk_66(clk_66), // generated 66 Hz clock (O)
  .clk_100(clk_100) // generated 100 Hz clock (O)
);

keypad_scan keypad_scanner(
	.clk(clk_100), //scan clock
	.rst_n(rst_n), //scan clock
	.col_n(col_n), //pressed column index
	.row_n(row_n), //scanned row index
	.key(key), //returned pressed key
	.pressed(pressed) //whether key pressed (1) or not (0)
);

flick_master game_flick_master(
	.clk_100(clk_100), // 100 HZ (I)
	.clk_1(clk_1), // 1Hz (I)
	.rst_n(rst_n), // reset (I)
	.game_en(3'b000), // enable to play game (I)
	.key(key), // keypad (I)
	.pressed(pressed), // if key pad was pressed (I)
	.data_output(data_output), // to ram_ctrl 128b (O)
	.game_next_state(game_next_state),	// 1: finish 0:playing (O)
	.point(point) // 1:get point 0:no point got (O)
);

RAM_ctrl RAM_controller(
    .clk(clk_div), //global clock input
    .rst_n(rst_n), //active low reset
    .pressed(1'b1), //whether key pressed (1) or not (0)
    .en(en), //LCD enable
    .input_data(data_output), //data input (I)
    .data_valid(out_valid), //whether data valid or not
    .data_out(data_out) //ram data output
);

lcd_ctrl LCD_controller(
    .clk(clk_div), //LCD controller clock (I)
    .rst_n(rst_n), //active low reset (I)
    .data(data_out), //data re-arrangement buffer ready indicator (I)
    .data_valid(out_valid), //if data_valid = 1 the data is valid (I)
    .LCD_di(LCD_di), //LCD data/instruction (O)
    .LCD_rw(LCD_rw), //LCD Read/Write (O)
    .LCD_en(LCD_en), //LCD enable (O)
    .LCD_rst(LCD_rst), //LCD reset (O)
    .LCD_data(LCD_data), //LCD data (O)
    .en_tran(en) //data transfer enable (O)
);

clock_divider #(
    .half_cycle(200), // half cycle = 200 (divided by 400)
    .counter_width(8) // counter width = 8 bits
  ) clk100K (
    .clk_div(clk_div), //divided clock signal (O)
    .clk(clk), //global clock input (I)
    .rst_n(rst_n) //active low reset (I)
);


endmodule