`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu
// 
// Create Date:    02:24:21 06/04/2015 
// Module Name:    lcd_display2
// Project Name:   Lab12-1
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
module lcd_display2(
    clk, //global clock input (I)
    col_n, //pressed column index (I)
    rst_n, //active low reset (I)
    row_n, //scanned row index (O)
    LCD_rst, //LCD reset (O)
    LCD_cs, //LCD frame selection (O)
    LCD_rw, //LCD read/write control (O)
    LCD_di, //LCD data/instruction (O)
    LCD_data, //LCD data (O)
    LCD_en, //LCD enable (O)
);

//I/Os
input clk; //global clock input
input rst_n; //active low reset
input [3:0] col_n; //pressed column index
output [3:0] row_n; //scanned row index
output LCD_rst; //LCD reset
output [1:0] LCD_cs; //LCD frame selection
output LCD_rw; //LCD read/write control
output LCD_di; //LCD data/instruction
output [7:0] LCD_data; //LCD data
output LCD_en; //LCD enable

wire clk_div;
wire pressed,en,out_valid;
wire [7:0] data_out;
wire [15:0] key

keypad_scan keypad_scanner(
    .clk(clk_div), //scan clock (I)
    .rst_n(rst_n), //active low reset (I)
    .col(col_n), //pressed column index (I)
    .row(row_n), //scanned row index (O)
    .key(key), //returned pressed key (O)
    .pressed(pressed) //whether key pressed (1) or not (0) (O)
);


RAM_ctrl RAM_controller(
    .clk(clk_div),
    .rst_n(rst_n),
    .pressed(pressed),
    .key(key),
    .en(en),
    .data_out(data_out),
    .data_valid(out_valid)
);

lcd_ctrl LCD_controller(
    .clk(clk_div), //LCD controller clock (I)
    .rst_n(rst_n), //active low reset (I)
    .data(data_out), //data re-arrangement buffer ready indicator (I)
    .data_valid(out_valid),
    .LCD_di(LCD_di),
    .LCD_rw(LCD_rw),
    .LCD_en(LCD_en),
    .LCD_rst(LCD_rst),
    .LCD_cs(LCD_cs),
    .LCD_data(LCD_data),
    .en_tran(en)
);

clock_divider #(
    .half_cycle(200), // half cycle = 200 (divided by 400)
    .counter_width(8) // counter width = 8 bits
  ) clk100K (
    .rst_n(rst_n),
    .clk(clk),
    .clk_div(clk_div)
);

endmodule
