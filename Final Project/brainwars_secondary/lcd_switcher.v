`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu & Hsin-Ho Lu
// 
// Create Date:    21:50:05 06/17/2015 
// Module Name:    lcd_switcher
// Project Name:   2015 Spring Logic Design Laboratory Final Project
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
module lcd_switcher(
	LCD_rst1,
	LCD_rst2,
	LCD_rw1,
	LCD_rw2,
	LCD_di1,
	LCD_di2,
	LCD_en1,
	LCD_en2,
	LCD_data1,
	LCD_data2,
	clk, //global clock input (I)
	LCD_rst,
	LCD_rw,
	LCD_di,
	LCD_en,
	LCD_cs,
	LCD_data
);
	 
//I/Os
input LCD_rst1, LCD_rst2;
input LCD_rw1, LCD_rw2;
input LCD_di1, LCD_di2;
input LCD_en1, LCD_en2;
input [7:0] LCD_data1, LCD_data2;
input clk;
output LCD_rst;
output LCD_rw;
output LCD_di;
output LCD_en;
output [1:0] LCD_cs;
output [7:0] LCD_data;

reg LCD_rst;
reg LCD_rw;
reg LCD_di;
reg LCD_en;
reg [1:0] LCD_cs;
reg [7:0] LCD_data;

always @(clk)
	case(clk)
		1'b0:
			begin
				LCD_rst = LCD_rst1;
				LCD_rw = LCD_rw1;
				LCD_di = LCD_di1;
				LCD_en = LCD_en1;
				LCD_cs = 2'b01;
				LCD_data = LCD_data1;
			end
		1'b1:
			begin
				LCD_rst = LCD_rst2;
				LCD_rw = LCD_rw2;
				LCD_di = LCD_di2;
				LCD_en = LCD_en2;
				LCD_cs = 2'b10;
				LCD_data = LCD_data2;
			end
		default:
			begin
				LCD_rst = 1'b0;
				LCD_rw = 1'b0;
				LCD_di = 1'b0;
				LCD_en = 1'b0;
				LCD_cs = 2'b11;
				LCD_data = 7'd0;
			end
	endcase

endmodule
