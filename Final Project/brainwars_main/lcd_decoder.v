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
input [7:0] font;
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
		`GRAPH_LU_1: mark = `LCD_LU_1;
		`GRAPH_LU_2: mark = `LCD_LU_2;
		`GRAPH_LU_3: mark = `LCD_LU_3;
		`GRAPH_LU_4: mark = `LCD_LU_4;
		`GRAPH_LU_5: mark = `LCD_LU_5;
		`GRAPH_LU_6: mark = `LCD_LU_6;
		`GRAPH_LU_7: mark = `LCD_LU_7;
		`GRAPH_LU_8: mark = `LCD_LU_8;
		`GRAPH_LU_9: mark = `LCD_LU_9;
		`GRAPH_LU_10: mark = `LCD_LU_10;
		`GRAPH_LU_11: mark = `LCD_LU_11;
		`GRAPH_LU_12: mark = `LCD_LU_12;
		`GRAPH_LU_13: mark = `LCD_LU_13;
		`GRAPH_LU_14: mark = `LCD_LU_14;
		`GRAPH_LU_15: mark = `LCD_LU_15;
		`GRAPH_LU_16: mark = `LCD_LU_16;
		`GRAPH_LU_17: mark = `LCD_LU_17;
		`GRAPH_LU_18: mark = `LCD_LU_18;
		`GRAPH_LU_19: mark = `LCD_LU_19;
		`GRAPH_LU_20: mark = `LCD_LU_20;
		`GRAPH_LU_21: mark = `LCD_LU_21;
		`GRAPH_RU_1: mark = `LCD_RU_1;
		`GRAPH_RU_2: mark = `LCD_RU_2;
		`GRAPH_RU_3: mark = `LCD_RU_3;
		`GRAPH_RU_4: mark = `LCD_RU_4;
		`GRAPH_RU_5: mark = `LCD_RU_5;
		`GRAPH_RU_6: mark = `LCD_RU_6;
		`GRAPH_RU_7: mark = `LCD_RU_7;
		`GRAPH_RU_8: mark = `LCD_RU_8;
		`GRAPH_RU_9: mark = `LCD_RU_9;
		`GRAPH_RU_10: mark = `LCD_RU_10;
		`GRAPH_RU_11: mark = `LCD_RU_11;
		`GRAPH_RU_12: mark = `LCD_RU_12;
		`GRAPH_RU_13: mark = `LCD_RU_13;
		`GRAPH_RU_14: mark = `LCD_RU_14;
		`GRAPH_RU_15: mark = `LCD_RU_15;
		`GRAPH_RU_16: mark = `LCD_RU_16;
		`GRAPH_RU_17: mark = `LCD_RU_17;
		`GRAPH_RU_18: mark = `LCD_RU_18;
		`GRAPH_RU_19: mark = `LCD_RU_19;
		`GRAPH_RU_20: mark = `LCD_RU_20;
		`GRAPH_RU_21: mark = `LCD_RU_21;
		`GRAPH_LD_1: mark = `LCD_LD_1;
		`GRAPH_LD_2: mark = `LCD_LD_2;
		`GRAPH_LD_3: mark = `LCD_LD_3;
		`GRAPH_LD_4: mark = `LCD_LD_4;
		`GRAPH_LD_5: mark = `LCD_LD_5;
		`GRAPH_LD_6: mark = `LCD_LD_6;
		`GRAPH_LD_7: mark = `LCD_LD_7;
		`GRAPH_LD_8: mark = `LCD_LD_8;
		`GRAPH_LD_9: mark = `LCD_LD_9;
		`GRAPH_LD_10: mark = `LCD_LD_10;
		`GRAPH_LD_11: mark = `LCD_LD_11;
		`GRAPH_LD_12: mark = `LCD_LD_12;
		`GRAPH_LD_13: mark = `LCD_LD_13;
		`GRAPH_LD_14: mark = `LCD_LD_14;
		`GRAPH_LD_15: mark = `LCD_LD_15;
		`GRAPH_LD_16: mark = `LCD_LD_16;
		`GRAPH_LD_17: mark = `LCD_LD_17;
		`GRAPH_LD_18: mark = `LCD_LD_18;
		`GRAPH_LD_19: mark = `LCD_LD_19;
		`GRAPH_LD_20: mark = `LCD_LD_20;
		`GRAPH_LD_21: mark = `LCD_LD_21;
		`GRAPH_RD_1: mark = `LCD_RD_1;
		`GRAPH_RD_2: mark = `LCD_RD_2;
		`GRAPH_RD_3: mark = `LCD_RD_3;
		`GRAPH_RD_4: mark = `LCD_RD_4;
		`GRAPH_RD_5: mark = `LCD_RD_5;
		`GRAPH_RD_6: mark = `LCD_RD_6;
		`GRAPH_RD_7: mark = `LCD_RD_7;
		`GRAPH_RD_8: mark = `LCD_RD_8;
		`GRAPH_RD_9: mark = `LCD_RD_9;
		`GRAPH_RD_10: mark = `LCD_RD_10;
		`GRAPH_RD_11: mark = `LCD_RD_11;
		`GRAPH_RD_12: mark = `LCD_RD_12;
		`GRAPH_RD_13: mark = `LCD_RD_13;
		`GRAPH_RD_14: mark = `LCD_RD_14;
		`GRAPH_RD_15: mark = `LCD_RD_15;
		`GRAPH_RD_16: mark = `LCD_RD_16;
		`GRAPH_RD_17: mark = `LCD_RD_17;
		`GRAPH_RD_18: mark = `LCD_RD_18;
		`GRAPH_RD_19: mark = `LCD_RD_19;
		`GRAPH_RD_20: mark = `LCD_RD_20;
		`GRAPH_RD_21: mark = `LCD_RD_21;
		`GRAPH_SMILE: mark = `LCD_SMILE;
		`GRAPH_ANGRY: mark = `LCD_ANGRY;
		`GRAPH_SLEEPY: mark = `LCD_SLEEPY;
		`GRAPH_SHINE: mark = `LCD_SHINE;
		`GRAPH_LOVE: mark = `LCD_LOVE;
		`GRAPH_SAD: mark = `LCD_SAD;
		`GRAPH_LIKE: mark = `LCD_LIKE;
		`GRAPH_FUCK: mark = `LCD_FUCK;
		default: mark = `LCD_NONE;
	endcase

endmodule
