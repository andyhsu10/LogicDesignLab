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
  control,
  display,
  LED, //debug
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
output [15:0] LED;
output [`KEYPAD_WIDTH-1:0] row_n;
output LCD_rst; //LCD reset
output [1:0] LCD_cs; //LCD frame selection
output LCD_rw; //LCD read/write control
output LCD_di; //LCD data/instruction
output [7:0] LCD_data; //LCD data
output LCD_en; //LCD enable
output [3:0] control;
output [14:0] display;

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
wire [3:0] score, score_unit, score_tens, score_hund;
wire [5:0] letter;
wire [7:0] data_out;
wire [9:0] q;
wire [15:0] audio_in_left, audio_in_right;
wire [19:0] note_div;
wire [127:0] data_output;
wire point;
wire game_next_state;
wire de_pressed;

wire [7:0] data; // byte data transfer from buffer
wire [15:0] random;

assign LCD_cs = 2'b10;

freq_div frequency_divider(
  .clk_out(clk_out), //divided clock output (O)
  .clk_fast(clk_fast),
  .clk_ctl(clk_ctl), //divided clock output for scan freq (O)
  .clk(clk), //global clock input (I)
  .rst_n(rst_n) //active low reset
);

clock_generator clock_generate(
  .clk(clk), // clock from crystal (I)
  .rst_n(rst_n), // active low reset (I)
  .clk_1(clk_1), // generated 1 Hz clock (O)
  .clk_2(clk_2), // generated 2 Hz clock (O)
  .clk_66(clk_66), // generated 66 Hz clock (O)
  .clk_100(clk_100) // generated 100 Hz clock (O)
);

random_secondary random_producer(
	.rand(random), //random value output (O)
	.clk(clk_100), //global clock input (I)
	.clk_2(clk_2), //2 Hz clock (I)
	.rst_n(rst_n) //active low reset (I)
);

keypad_scan keypad_scanner(
	.clk(clk_100), //scan clock
	.rst_n(rst_n), //scan clock
	.col_n(col_n), //pressed column index
	.row_n(row_n), //scanned row index
	.key(key), //returned pressed key
	.pressed(pressed) //whether key pressed (1) or not (0)
);

debounce_one_pulse debounce_pressed(
	.de_clk(clk_100), //debounce clock (I)
	.pulse_clk(clk_100), //one pulse clock (I)
	.rst_n(rst_n), //low active reset (I)
	.in(pressed), //push button input (I)
	.out(de_pressed) //pulsed push button output (O)
);

follow_order game_follow_order(
	.game_en(3'b010), //game enable (I)
    .clk(clk_100), //100 Hz clock (I)
    .clk_2(clk_2), //2 Hz clock (I)
    .key(key), //returned pressed key (I)
	.pressed(~de_pressed), //whether key pressed (1) or not (0) (I)
    .random(random[2:0]), //randow value 3-bit (I)
    .rst_n(rst_n), //active low reset (I)
    //.state(LED[1:0]), //debug
    //.cnt2(LED[3:2]), //debug
    .check1(LED), //debug
    .data_output(data_output), // to ram_ctrl 128b (O)
	.point(point) // 1:get point 0:no point got (O)
);

point_cal_secondary point_calculator(
    .score_unit(score_unit), //unit score (O)
    .score_tens(score_tens), //tens score (O)
    .score_hund(score_hund), //hund score (O)
    .clk(clk_100), //100 Hz clock (I)
    .rst_n(rst_n), //active low reset (I)
    .game_en(3'b010), //game enable (I)
    .state(4'd1), //fsm state (I)
//  .flick_master_point(point), //flick master point (I)
//  .touch_number_point, //touch number point (I)
    .follow_order_point(point) //follow order point (I)
//  .unfollow_order_point, //unfollow order point (I)
//  .high_or_low_point, //high or low point (I)
//  .rainfall_point //rainfall point (I)
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

scan_ctl scan_controller(
    .bcd_in1(score_hund),
    .bcd_in2(score_tens),
    .bcd_in3(score_unit),
    .clk_ctl(clk_ctl),
   .ssd_ctl(control),
    .bcd_out(score)
    );

ssd_decoder decoder(
   .ssd_out(display), //14-segment display output
  .bcd(score) //BCD input
    );

endmodule