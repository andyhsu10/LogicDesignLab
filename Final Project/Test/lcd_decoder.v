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
		`GRAPH_FLICK_MASTER_1_up_lu: mark = `LCD_FLICK_MASTER_1_up_lu;
		`GRAPH_FLICK_MASTER_1_up_ru: mark = `LCD_FLICK_MASTER_1_up_ru;
		`GRAPH_FLICK_MASTER_1_up_ld: mark = `LCD_FLICK_MASTER_1_up_ld;
		`GRAPH_FLICK_MASTER_1_up_rd: mark = `LCD_FLICK_MASTER_1_up_rd;
		`GRAPH_FLICK_MASTER_1_down_lu: mark = `LCD_FLICK_MASTER_1_down_lu;
		`GRAPH_FLICK_MASTER_1_down_ru: mark = `LCD_FLICK_MASTER_1_down_ru;
		`GRAPH_FLICK_MASTER_1_down_ld: mark = `LCD_FLICK_MASTER_1_down_ld;
		`GRAPH_FLICK_MASTER_1_down_rd: mark = `LCD_FLICK_MASTER_1_down_rd;
		`GRAPH_FLICK_MASTER_1_right_lu: mark = `LCD_FLICK_MASTER_1_right_lu;
		`GRAPH_FLICK_MASTER_1_right_ru: mark = `LCD_FLICK_MASTER_1_right_ru;
		`GRAPH_FLICK_MASTER_1_right_ld: mark = `LCD_FLICK_MASTER_1_right_ld;
		`GRAPH_FLICK_MASTER_1_right_rd: mark = `LCD_FLICK_MASTER_1_right_rd;
		`GRAPH_FLICK_MASTER_1_left_lu: mark = `LCD_FLICK_MASTER_1_left_lu;
		`GRAPH_FLICK_MASTER_1_left_ru: mark = `LCD_FLICK_MASTER_1_left_ru;
		`GRAPH_FLICK_MASTER_1_left_ld: mark = `LCD_FLICK_MASTER_1_left_ld;
		`GRAPH_FLICK_MASTER_1_left_rd: mark = `LCD_FLICK_MASTER_1_left_rd;
		`GRAPH_FLICK_MASTER_0_up_lu: mark = `LCD_FLICK_MASTER_0_up_lu;
		`GRAPH_FLICK_MASTER_0_up_ru: mark = `LCD_FLICK_MASTER_0_up_ru;
		`GRAPH_FLICK_MASTER_0_up_ld: mark = `LCD_FLICK_MASTER_0_up_ld;
		`GRAPH_FLICK_MASTER_0_up_rd: mark = `LCD_FLICK_MASTER_0_up_rd;
		`GRAPH_FLICK_MASTER_0_down_lu: mark = `LCD_FLICK_MASTER_0_down_lu;
		`GRAPH_FLICK_MASTER_0_down_ru: mark = `LCD_FLICK_MASTER_0_down_ru;
		`GRAPH_FLICK_MASTER_0_down_ld: mark = `LCD_FLICK_MASTER_0_down_ld;
		`GRAPH_FLICK_MASTER_0_down_rd: mark = `LCD_FLICK_MASTER_0_down_rd;
		`GRAPH_FLICK_MASTER_0_right_lu: mark = `LCD_FLICK_MASTER_0_right_lu;
		`GRAPH_FLICK_MASTER_0_right_ru: mark = `LCD_FLICK_MASTER_0_right_ru;
		`GRAPH_FLICK_MASTER_0_right_ld: mark = `LCD_FLICK_MASTER_0_right_ld;
		`GRAPH_FLICK_MASTER_0_right_rd: mark = `LCD_FLICK_MASTER_0_right_rd;
		`GRAPH_FLICK_MASTER_0_left_lu: mark = `LCD_FLICK_MASTER_0_left_lu;
		`GRAPH_FLICK_MASTER_0_left_ru: mark = `LCD_FLICK_MASTER_0_left_ru;
		`GRAPH_FLICK_MASTER_0_left_ld: mark = `LCD_FLICK_MASTER_0_left_ld;
		`GRAPH_FLICK_MASTER_0_left_rd: mark = `LCD_FLICK_MASTER_0_left_rd;
		`GRAPH_INITIAL_1: mark = `LCD_INITIAL_1;
		`GRAPH_INITIAL_2: mark = `LCD_INITIAL_2;
		`GRAPH_INITIAL_3: mark = `LCD_INITIAL_3;
		`GRAPH_INITIAL_4: mark = `LCD_INITIAL_4;
		`GRAPH_INITIAL_5: mark = `LCD_INITIAL_5;
		`GRAPH_INITIAL_6: mark = `LCD_INITIAL_6;
		`GRAPH_INITIAL_7: mark = `LCD_INITIAL_7;
		`GRAPH_INITIAL_8: mark = `LCD_INITIAL_8;
		`GRAPH_INVITE_WORD_1: mark = `LCD_INVITE_WORD_1;
		`GRAPH_INVITE_WORD_2: mark = `LCD_INVITE_WORD_2;
		`GRAPH_INVITE_WORD_3: mark = `LCD_INVITE_WORD_3;
		`GRAPH_INVITE_WORD_4: mark = `LCD_INVITE_WORD_4;
		`GRAPH_INVITE_WORD_5: mark = `LCD_INVITE_WORD_5;
		`GRAPH_INVITE_WORD_6: mark = `LCD_INVITE_WORD_6;
		`GRAPH_INVITE_WORD_7: mark = `LCD_INVITE_WORD_7;
		`GRAPH_INVITE_WORD_8: mark = `LCD_INVITE_WORD_8;
		`GRAPH_INVITE_L1: mark = `LCD_INVITE_L1;
		`GRAPH_INVITE_R5: mark = `LCD_INVITE_R5;
		`GRAPH_INVITE_R4: mark = `LCD_INVITE_R4;
		`GRAPH_INVITE_R3: mark = `LCD_INVITE_R3;
		`GRAPH_INVITE_R2: mark = `LCD_INVITE_R2;
		`GRAPH_INVITE_R1: mark = `LCD_INVITE_R1;
		`GRAPH_INVITE_R0: mark = `LCD_INVITE_R0;
		`GRAPH_INVITE_9_1: mark = `LCD_INVITE_9_1;
		`GRAPH_INVITE_9_2: mark = `LCD_INVITE_9_2;
		`GRAPH_INVITE_8_1: mark = `LCD_INVITE_8_1;
		`GRAPH_INVITE_8_2: mark = `LCD_INVITE_8_2;
		`GRAPH_INVITE_7_1: mark = `LCD_INVITE_7_1;
		`GRAPH_INVITE_7_2: mark = `LCD_INVITE_7_2;
		`GRAPH_INVITE_6_1: mark = `LCD_INVITE_6_1;
		`GRAPH_INVITE_6_2: mark = `LCD_INVITE_6_2;
		`GRAPH_INVITE_5_1: mark = `LCD_INVITE_5_1;
		`GRAPH_INVITE_5_2: mark = `LCD_INVITE_5_2;
		`GRAPH_INVITE_4_1: mark = `LCD_INVITE_4_1;
		`GRAPH_INVITE_4_2: mark = `LCD_INVITE_4_2;
		`GRAPH_INVITE_3_1: mark = `LCD_INVITE_3_1;
		`GRAPH_INVITE_3_2: mark = `LCD_INVITE_3_2;
		`GRAPH_INVITE_2_1: mark = `LCD_INVITE_2_1;
		`GRAPH_INVITE_2_2: mark = `LCD_INVITE_2_2;
		`GRAPH_INVITE_1_1: mark = `LCD_INVITE_1_1;
		`GRAPH_INVITE_1_2: mark = `LCD_INVITE_1_2;
		default: mark = `LCD_NONE;
	endcase

endmodule
