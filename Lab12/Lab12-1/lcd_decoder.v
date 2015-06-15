`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu
// 
// Create Date:    21:42:59 06/15/2015 
// Module Name:    lcd_decoder
// Project Name:   Lab12-1
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module lcd_decoder(
    font,
    mark
);

// I/Os
input [5:0] font;
output reg [255:0] mark;

always @(font)
	case(font)
		`FONT_0: mark = `LCD_0;
		`FONT_1: mark = `LCD_1;
		`FONT_2: mark = `LCD_2;
		`FONT_3: mark = `LCD_3;
		`FONT_4: mark = `LCD_4;
		`FONT_5: mark = `LCD_5;
		`FONT_6: mark = `LCD_6;
		`FONT_7: mark = `LCD_7;
		`FONT_8: mark = `LCD_8;
		`FONT_9: mark = `LCD_9;
		`FONT_A: mark = `LCD_A;
		`FONT_B: mark = `LCD_B;
		`FONT_C: mark = `LCD_C;
		`FONT_D: mark = `LCD_D;
		`FONT_E: mark = `LCD_E;
		`FONT_F: mark = `LCD_F;
		`FONT_G: mark = `LCD_G;
		`FONT_H: mark = `LCD_H;
		`FONT_I: mark = `LCD_I;
		`FONT_J: mark = `LCD_J;
		`FONT_K: mark = `LCD_K;
		`FONT_L: mark = `LCD_L;
		`FONT_M: mark = `LCD_M;
		`FONT_N: mark = `LCD_N;
		`FONT_O: mark = `LCD_O;
		`FONT_P: mark = `LCD_P;
/*		`FONT_Q: mark = `LCD_Q;
		`FONT_R: mark = `LCD_R;
		`FONT_S: mark = `LCD_S;
		`FONT_T: mark = `LCD_T;
		`FONT_U: mark = `LCD_U;
		`FONT_V: mark = `LCD_V;
		`FONT_W: mark = `LCD_W;
		`FONT_X: mark = `LCD_X;
		`FONT_Y: mark = `LCD_Y;
		`FONT_Z: mark = `LCD_Z;	*/
		`FONT_NONE: mark = `LCD_NONE;
		default: mark = `LCD_NONE;
	endcase

endmodule
