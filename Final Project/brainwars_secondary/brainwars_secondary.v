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
	rst_n_in, //reset signal from second board (I)
	dialogue_in, //dialogue from another board (I)
	score_in, //score from main board (I)
	col_n, //pressed column index (I)
	game_invite, //game invitation from button (I)
	game_invite_in, //game invitation from main board (I)
	game_cancel, //game cancellation from button (I)
	game_cancel_in, //game cancellation from main board (I)
	win_lose_main, //win, lose or tie to main board (O)
	game_en, //game enable (O)
	row_n, //scanned row index (O)
	dialogue_out, //dialogue sent to another board (O)
	rst_n_out, //reset signal for second board (O)
	display, //SSD output (O)
	control, //SSD control signal (O)
	audio_appsel, //playing mode selection (O)
	audio_sysclk, //control clock for DAC (from crystal) (O)
	audio_bck, //bit clock of audio data (5MHz) (O)
	audio_ws, //left/right parallel to serial control (O)
	audio_data, //serial output audio data (O)
	LCD_rst, //LCD reset (O)
    LCD_cs, //LCD frame selection (O)
    LCD_rw, //LCD read/write control (O)
    LCD_di, //LCD data/instruction (O)
    LCD_data, //LCD data (O)
    LCD_en, //LCD enable (O)
	 LED, //LED lights (O)
	note_in,
	state //fsm state (O)
);

//I/Os
input clk; //clock from the crystal
input rst_n; //active low reset
input rst_n_in; //reset signal from second board
input [5:0] note_in;
input [3:0] dialogue_in; //dialogue from another board
input [`KEYPAD_WIDTH-1:0] col_n;
input [7:0] score_in; //score from main board;
input game_invite; //game invitation from button
input game_invite_in; //game invitation from main board
input game_cancel; //game cancellation from button
input game_cancel_in; //game cancellation from main board
output [1:0] win_lose_main; //win, lose or tie to main board
output [2:0] game_en; //game enable
output [`KEYPAD_WIDTH-1:0] row_n;
output [3:0] dialogue_out; //dialogue sent to another board
output rst_n_out; //reset signal for second board
output [14:0] display; //SSD output
output [3:0] control; //SSD control signal
output audio_appsel; //playing mode selection
output audio_sysclk; //control clock for DAC (from crystal)
output audio_bck; //bit clock of audio data (5MHz)
output audio_ws; //left/right parallel to serial control
output audio_data; //serial output audio data
output LCD_rst; //LCD reset
output [1:0] LCD_cs; //LCD frame selection
output LCD_rw; //LCD read/write control
output LCD_di; //LCD data/instruction
output [7:0] LCD_data; //LCD data
output LCD_en; //LCD enable
output [3:0] state; //fsm state
output [15:0] LED; //LED lights

//Declare internal nodes
wire rst;
wire pressed, de_pressed;
wire out_valid;
wire game_invite_back_state;
wire count_down_next_state;
wire clk_1, clk_2, clk_66, clk_100, clk_fast, clk_div;
wire de_game_invite, de_game_cancel;
wire [1:0] clk_ctl;
wire flick_master_point, mora_point, high_or_low_point, rainfall_point;
wire [3:0] key;
wire [5:0] letter;
wire [7:0] data_out;
wire [15:0] random;
wire [15:0] audio_in_left, audio_in_right;
wire [19:0] note_div;
wire [127:0] data_output;
wire [127:0] initial_data_in, invite_data_in, count_down_data_in, result_data_in;
wire [127:0] flick_master_data_in, mora_data_in, high_or_low_data_in, rainfall_data_in;

wire [7:0] data; // byte data transfer from buffer
wire [6:0] addr; // Address for each picture

wire LCD_rst1, LCD_rst2;
wire LCD_rw1, LCD_rw2;
wire LCD_di1, LCD_di2;
wire LCD_en1, LCD_en2;
wire [7:0] LCD_data1, LCD_data2;

wire [1:0] point;
wire [3:0] score_unit, score_tens, score_hund, score_BCD;
wire [7:0] score;
wire game_next_state;

assign rst_n_out = rst_n;
assign rst = rst_n & rst_n_in;

freq_div freqency_divider(
	.clk_fast(clk_fast),
	.clk_ctl(clk_ctl), //divided clock output for scan freq (O)
	.clk(clk), //global clock input (I)
	.rst_n(rst) //active low reset
);

note_decode note_decoder(
	.note(note_in), //note from main board (I)
	.note_div(note_div) //div for note generation (O)
);

clock_generator clock_generate(
  .clk(clk), // clock from crystal (I)
  .rst_n(rst), // active low reset (I)
  .clk_1(clk_1), // generated 1 Hz clock (O)
  .clk_2(clk_2), // generated 2 Hz clock (O)
  .clk_66(clk_66), // generated 66 Hz clock (O)
  .clk_100(clk_100) // generated 100 Hz clock (O)
);

debounce_one_pulse debounce_game_invite(
	.de_clk(clk_100), //debounce clock (I)
	.pulse_clk(clk_100), //one pulse clock (I)
	.rst_n(rst), //low active reset (I)
	.in(game_invite), //push button input (I)
	.out(de_game_invite) //pulsed push button output (O)
);

debounce_one_pulse debounce_game_cancel(
	.de_clk(clk_100), //debounce clock (I)
	.pulse_clk(clk_100), //one pulse clock (I)
	.rst_n(rst), //low active reset (I)
	.in(game_cancel), //push button input (I)
	.out(de_game_cancel) //pulsed push button output (O)
);

debounce_one_pulse debounce_pressed(
	.de_clk(clk_100), //debounce clock (I)
	.pulse_clk(clk_100), //one pulse clock (I)
	.rst_n(rst), //low active reset (I)
	.in(pressed), //push button input (I)
	.out(de_pressed) //pulsed push button output (O)
);

next_game next_game(
	.clk(clk_1), //1 Hz clock (I)
	.state(state), //fsm state (I)
	.rst_n(rst), //acive low reset (I)
	.game_next_state(game_next_state) //to the next game
);

fsm finite_state_machine(
	.state(state), //state signal (O)
	.game_invite(de_game_invite & game_invite_in), //game invitation button (I)
	.game_cancel(de_game_cancel & game_cancel_in), //game cancellation button (I)
	.game_invite_back_state(game_invite_back_state), //game invitation screen to next state (I)
	.count_down_next_state(count_down_next_state), //count down screen to next state (I)
	.game_next_state(game_next_state), //game to next state (I)
	.result_next_state(result_next_state), //result next state (I)
	.clk(clk_100), //global clock signal (I)
	.rst_n(rst) //low active reset (I)
);

random_secondary random_producer(
	.rand(random), //random value output (O)
	.LED(LED), //LED lights (O)
	.clk(clk_100), //global clock input (I)
	.clk_2(clk_2), //2 Hz clock (I)
	.rst_n(rst) //active low reset (I)
);

keypad_scan keypad_scanner(
	.clk(clk_100), //scan clock
	.rst_n(rst), //scan clock
	.col_n(col_n), //pressed column index
	.row_n(row_n), //scanned row index
	.key(key), //returned pressed key
	.pressed(pressed) //whether key pressed (1) or not (0)
);

initial_screen game_initial_screen(
	.clk(clk_2), //2Hz clock (I)
	.state(state), //fsm state (I)
	.rst_n(rst), //active low reset (I)
	.data_out(initial_data_in) //data output (O)
);

invite_screen_secondary invite_screen(
	.clk(clk_1), //1Hz clock (I)
	.state(state), //fsm state (I)
	.rst_n(rst), //active low reset (I)
	.game_invite_back_state(game_invite_back_state), //game invitation screen to next state (O)
	.data_out(invite_data_in) //data output (O)
);

game_ctl game_controller(
    .game_en(game_en), //game enable (O)
    .clk(clk_100), //100 Hz clock (I)
    .state(state), //fsm state (I)
    .random(random[9:8]), //randow value 2-bit (I)
    .rst_n(rst) //active low reset (I)
);

count_down_screen counting_down(
	.clk(clk_66), //global clock (I)
	.clk_100(clk_100), //100 Hz clock (I)
	.game_en(game_en), //game enable (I)
	.state(state), //fsm state (I)
	.key(key), //returned pressed key (I)
	.pressed(pressed), //whether key pressed (1) or not (0) (I)
	.dialogue_in(dialogue_in), //dialogue from another board (I)
	.rst_n(rst), //active low reset (I)
	.count_down_next_state(count_down_next_state), //(O)
	.dialogue_out(dialogue_out), //dialogue sent to another board (O)
	.data_out(count_down_data_in) //data output (O)
);

flick_master game_flick_master(
	.clk_100(clk_100),				// 100 HZ (I)
	.rst_n(rst),				// reset (I)
	.game_en(game_en),				// enable to play game (I)
	.key(key),					// keypad (I)
	.pressed(pressed),				// if key pad was pressed (I)
	.data_output(flick_master_data_in),		// to ram_ctrl 128b (O)
	.point(flick_master_point)					// 1:get point 0:no point got (O)
);

mora game_mora(
	.clk_100(clk_100),				// 100 HZ (I)
	.rst_n(rst),				// reset (I)
	.game_en(game_en),				// enable to play game (I)
	.key(key),					// keypad (I)
	.pressed(pressed),				// if key pad was pressed (I)
	.data_output(mora_data_in),		// to ram_ctrl 128b (O)
	.point(mora_point)					// 1:get point 0:no point got (O)
);

wire de_pressed_n = ~de_pressed;
high_or_low game_high_or_low(
	.clk_100(clk_100),				// 100 HZ (I)
	.rst_n(rst),				// reset (I)
	.game_en(game_en),				// enable to play game (I)
	.key(key),					// keypad (I)
	.pressed(de_pressed_n),				// if key pad was pressed (I)
	.data_output(high_or_low_data_in),		// to ram_ctrl 128b (O)
	.point(high_or_low_point)					// 1:get point 0:no point got (O)
);

rainfall game_rainfall(
    .game_en(game_en), //game enable (I)
    .clk(clk_100), //100 Hz clock (I)
    .key(key), //returned pressed key (I)
	.pressed(~de_pressed), //whether key pressed (1) or not (0) (I)
    .random(random[7:6]), //randow value 2-bit (I)
    .rst_n(rst), //active low reset (I)
    .data_output(rainfall_data_in), // to ram_ctrl 128b (O)
	.point(rainfall_point) // 1:get point 0:no point got (O)
);

result_screen_secondary result_screen(
	.clk(clk_1), //1Hz clock (I)
	.state(state), //fsm state (I)
	.score_main(score_in), //main board score (I)
	.score_secondary(score), //secondary board score (I)
	.rst_n(rst), //active low reset (I)
	.result_next_state(result_next_state), //game result screen to next state (O)
	.win_lose_main(win_lose_main), //win or lose to main board (O)
	.data_out(result_data_in) //data output (O)
);

display_ctl display_controller(
    .data_out(data_output), //data output (O)
    .game_en(game_en), //game enable (I)
    .state(state), //fsm state (I)
    .initial_data_in(initial_data_in), //initial screen lcd data (I)
	.invite_data_in(invite_data_in), //invite screen lcd data (I)
	.count_down_data_in(count_down_data_in), //count down screen lcd data (I)
	.flick_master_data_in(flick_master_data_in), //flick master screen lcd data (I)
	.mora_data_in(mora_data_in), //mora screen lcd data (I)
	.high_or_low_data_in(high_or_low_data_in), //high or low screen lcd data (I)
	.rainfall_data_in(rainfall_data_in), //rainfall screen lcd data (I)
	.result_data_in(result_data_in) //result screen lcd data (I)
);

point_cal_secondary point_calculator(
    .score_unit(score_unit), //unit score (O)
    .score_tens(score_tens), //tens score (O)
    .score_hund(score_hund), //hund score (O)
    .score(score), //binary score (O)
    .clk(clk_100), //100 Hz clock (I)
    .rst_n(rst), //active low reset (I)
    .game_en(game_en), //game enable (I)
    .state(state), //fsm state (I)
	.flick_master_point(flick_master_point), //flick master point (I)
	.mora_point(mora_point), //mora point (I)
	.high_or_low_point(high_or_low_point), //high or low point (I)
	.rainfall_point(rainfall_point) //rainfall point (I)
);

RAM_ctrl RAM_controller(
    .clk(clk_div), //global clock input
    .rst_n(rst), //active low reset
    .pressed(1'b1), //whether key pressed (1) or not (0)
    .en(en), //LCD enable
    .input_data(data_output), //data input (I)
    .data_valid(out_valid), //whether data valid or not
    .data_out(data_out) //ram data output
);

lcd_ctrl LCD_controller(
    .clk(clk_div), //LCD controller clock (I)
    .rst_n(rst), //active low reset (I)
    .data(data_out), //data re-arrangement buffer ready indicator (I)
    .data_valid(out_valid), //if data_valid = 1 the data is valid (I)
    .LCD_di(LCD_di2), //LCD data/instruction (O)
    .LCD_rw(LCD_rw2), //LCD Read/Write (O)
    .LCD_en(LCD_en2), //LCD enable (O)
    .LCD_rst(LCD_rst2), //LCD reset (O)
    .LCD_data(LCD_data2), //LCD data (O)
    .en_tran(en) //data transfer enable (O)
);

clock_divider #(
    .half_cycle(200), // half cycle = 200 (divided by 400)
    .counter_width(8) // counter width = 8 bits
  ) clk100K (
    .clk_div(clk_div), //divided clock signal (O)
    .clk(clk), //global clock input (I)
    .rst_n(rst) //active low reset (I)
);

rom_lcd_ctrl U_LCDctrl(
  .clk(clk_50k), // LCD controller clock
  .rst_n(rst), // active low reset
  .data_ack(data_ack), // data re-arrangement buffer ready indicator
  .data(data), // byte data transfer from buffer
  .lcd_di(LCD_di1), // LCD data/instruction 
  .lcd_rw(LCD_rw1), // LCD Read/Write
  .lcd_en(LCD_en1), // LCD enable
  .lcd_rst(LCD_rst1), // LCD reset
  .lcd_data(LCD_data1), // LCD data
  .addr(addr), // Address for each picture
  .data_request(data_request) // request for the memory data
);

rom_ctrl U_romctrl(
  .clk(clk_50k), // rom controller clock
  .rst_n(rst), // active low reset
  .en(LCD_en1), // LCD enable
  .data_request(data_request), // request signal from LCD
  .address(addr), // requested address
  .data_ack(data_ack), // data ready acknowledge
  .data(data) // data to be transferred (byte)
);

clock_divider #(
    .half_cycle(400),
    .counter_width(9)
  ) clk50k (
    .rst_n(rst),
    .clk(clk),
    .clk_div(clk_50k)
  );

lcd_switcher lcd_switch(
	.LCD_rst1(LCD_rst1),
	.LCD_rst2(LCD_rst2),
	.LCD_rw1(LCD_rw1),
	.LCD_rw2(LCD_rw2),
	.LCD_di1(LCD_di1),
	.LCD_di2(LCD_di2),
	.LCD_en1(LCD_en1),
	.LCD_en2(LCD_en2),
	.LCD_data1(LCD_data1),
	.LCD_data2(LCD_data2),
	.clk(clk_50k), //global clock input (I)
	.LCD_rst(LCD_rst),
	.LCD_rw(LCD_rw),
	.LCD_di(LCD_di),
	.LCD_en(LCD_en),
	.LCD_cs(LCD_cs),
	.LCD_data(LCD_data)
);

//Note generation
buzzer_ctl buzzer_controllor(
	.clk(clk), //clock from crystal (I)
	.rst_n(rst), //active low reset (I)
	.note_div(note_div), //div for note generation (I)
	.audio_left(audio_in_left), //left sound audio (O)
	.audio_right(audio_in_right) //right sound audio (O)
);

//Speaker controllor
speaker_ctl speaker_controllor(
	.clk(clk), //clock from the crystal (I)
	.rst_n(rst), //active low reset (I)
	.audio_in_left(audio_in_left), //left channel audio data input (I)
	.audio_in_right(audio_in_right), //right channel audio data input (I)
	.audio_appsel(audio_appsel), //playing mode selection (O)
	.audio_sysclk(audio_sysclk), //control clock for DAC (from crystal) (O)
	.audio_bck(audio_bck), //bit clock of audio data (5MHz) (O)
	.audio_ws(audio_ws), //left/right parallel to serial control (O)
	.audio_data(audio_data) //serial output audio data (O)
);

scan_ctl scan_controllor(
    .bcd_in1(score_hund),
    .bcd_in2(score_tens),
    .bcd_in3(score_unit),
    .clk_ctl(clk_ctl),
    .ssd_ctl(control),
    .bcd_out(score_BCD)
);

ssd_decoder decoder(
	.ssd_out(display), //14-segment display output
	.bcd(score_BCD) //BCD input
);

endmodule