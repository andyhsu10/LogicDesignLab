`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu
// 
// Create Date:    03:45:20 05/22/2015 
// Module Name:    music 
// Project Name:   Lab10-2
// Revision: 
// Revision 0.01 - File Created
//
// My Grandfather's Clock
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
`define BIT_WIDTH 10
module music(
	q0, //shifter output
	clk, // global clock
	rst_n //active low reset
);

output reg [`BIT_WIDTH-1:0] q0; //output
reg [`BIT_WIDTH-1:0] q1, q2, q3, q4, q5, q6, q7, q8, q9;
reg [`BIT_WIDTH-1:0] q10, q11, q12, q13, q14, q15, q16, q17, q18, q19;
reg [`BIT_WIDTH-1:0] q20, q21, q22, q23, q24, q25, q26, q27, q28, q29;
reg [`BIT_WIDTH-1:0] q30, q31, q32, q33, q34, q35, q36, q37, q38, q39;
reg [`BIT_WIDTH-1:0] q40, q41, q42, q43, q44, q45, q46, q47, q48, q49;
reg [`BIT_WIDTH-1:0] q50, q51, q52, q53, q54, q55, q56, q57, q58, q59;
reg [`BIT_WIDTH-1:0] q60, q61, q62, q63, q64, q65, q66, q67, q68, q69;
reg [`BIT_WIDTH-1:0] q70, q71, q72, q73, q74, q75, q76, q77, q78, q79;
reg [`BIT_WIDTH-1:0] q80, q81, q82, q83, q84, q85, q86, q87, q88, q89;
reg [`BIT_WIDTH-1:0] q90, q91, q92, q93, q94, q95, q96, q97, q98, q99;
reg [`BIT_WIDTH-1:0] q100, q101, q102, q103, q104, q105, q106, q107, q108, q109;
reg [`BIT_WIDTH-1:0] q110, q111, q112, q113, q114, q115, q116, q117, q118, q119;
reg [`BIT_WIDTH-1:0] q120, q121, q122, q123, q124, q125, q126, q127, q128, q129;
reg [`BIT_WIDTH-1:0] q130, q131, q132;
input clk, rst_n; //clock & global clock

//Sequential logics: Flip Flops
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		begin
			q0 <= {`LIG_FALSE, `BEAT_3, `ENCODE_NA};
			q1 <= {`LIG_FALSE, `BEAT_1, `ENCODE_D4};
			q2 <= {`LIG_FALSE, `BEAT_1, `ENCODE_G4};
			q3 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_F4_};
			q4 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_G4};
			q5 <= {`LIG_FALSE, `BEAT_1, `ENCODE_A4};
			q6 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_G4};
			q7 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_A4};
			q8 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_B4};
			q9 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_B4};
			q10 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_C5};
			q11 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_B4};
			q12 <= {`LIG_FALSE, `BEAT_1, `ENCODE_E4};
			q13 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_A4};
			q14 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_A4};
			q15 <= {`LIG_FALSE, `BEAT_1, `ENCODE_G4};
			q16 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_G4};
			q17 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_G4};
			q18 <= {`LIG_FALSE, `BEAT_1, `ENCODE_F4_};
			q19 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_E4};
			q20 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_F4_};
			q21 <= {`LIG_FALSE, `BEAT_3, `ENCODE_G4};
			q22 <= {`LIG_FALSE, `BEAT_1, `ENCODE_D4};
			q23 <= {`LIG_FALSE, `BEAT_1, `ENCODE_G4};
			q24 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_F4_};
			q25 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_G4};
			q26 <= {`LIG_FALSE, `BEAT_1, `ENCODE_A4};
			q27 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_G4};
			q28 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_A4};
			q29 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_B4};
			q30 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_B4};
			q31 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_C5};
			q32 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_B4};
			q33 <= {`LIG_FALSE, `BEAT_1, `ENCODE_E4};
			q34 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_A4};
			q35 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_A4};
			q36 <= {`LIG_FALSE, `BEAT_1, `ENCODE_G4};
			q37 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_G4};
			q38 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_G4};
			q39 <= {`LIG_FALSE, `BEAT_1, `ENCODE_F4_};
			q40 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_E4};
			q41 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_F4_};
			q42 <= {`LIG_FALSE, `BEAT_3, `ENCODE_G4};
			q43 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_G4};
			q44 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_B4};
			q45 <= {`LIG_FALSE, `BEAT_1, `ENCODE_D5};
			q46 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_B4};
			q47 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_A4};
			q48 <= {`LIG_FALSE, `BEAT_1, `ENCODE_G4};
			q49 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_F4_};
			q50 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_G4};
			q51 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_A4};
			q52 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_G4};
			q53 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_F4_};
			q54 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_E4};
			q55 <= {`LIG_FALSE, `BEAT_1, `ENCODE_D4};
			q56 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_G4};
			q57 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_B4};
			q58 <= {`LIG_FALSE, `BEAT_1, `ENCODE_D5};
			q59 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_B4};
			q60 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_A4};
			q61 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_G4};
			q62 <= {`LIG_FALSE, `BEAT_0_25, `ENCODE_A4};
			q63 <= {`LIG_FALSE, `BEAT_0_25, `ENCODE_G4};
			q64 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_F4_};
			q65 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_G4};
			q66 <= {`LIG_FALSE, `BEAT_3, `ENCODE_A4};
			q67 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_NA};
			q68 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_D4};
			q69 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_G4};
			q70 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_G4};
			q71 <= {`LIG_FALSE, `BEAT_1, `ENCODE_NA};
			q72 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_A4};
			q73 <= {`LIG_FALSE, `BEAT_1, `ENCODE_A4};
			q74 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_NA};
			q75 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_B4};
			q76 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_B4};
			q77 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_C5};
			q78 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_B4};
			q79 <= {`LIG_FALSE, `BEAT_1, `ENCODE_E4};
			q80 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_A4};
			q81 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_A4};
			q82 <= {`LIG_FALSE, `BEAT_1, `ENCODE_G4};
			q83 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_G4};
			q84 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_G4};
			q85 <= {`LIG_FALSE, `BEAT_1, `ENCODE_F4_};
			q86 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_E4};
			q87 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_F4_};
			q88 <= {`LIG_FALSE, `BEAT_3, `ENCODE_G4};
			q89 <= {`LIG_FALSE, `BEAT_1, `ENCODE_D4};
			q90 <= {`LIG_FALSE, `BEAT_1, `ENCODE_G4};
			q91 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_D4};
			q92 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_D4};
			q93 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_E4};
			q94 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_E4};
			q95 <= {`LIG_FALSE, `BEAT_1, `ENCODE_D4};
			q96 <= {`LIG_FALSE, `BEAT_1, `ENCODE_B3};
			q97 <= {`LIG_FALSE, `BEAT_1, `ENCODE_D4};
			q98 <= {`LIG_FALSE, `BEAT_1, `ENCODE_B3};
			q99 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_D4};
			q100 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_D4};
			q101 <= {`LIG_FALSE, `BEAT_1, `ENCODE_G4};
			q102 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_D4};
			q103 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_D4};
			q104 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_E4};
			q105 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_E4};
			q106 <= {`LIG_FALSE, `BEAT_1, `ENCODE_D4};
			q107 <= {`LIG_FALSE, `BEAT_1, `ENCODE_B3};
			q108 <= {`LIG_FALSE, `BEAT_1, `ENCODE_D4};
			q109 <= {`LIG_FALSE, `BEAT_1, `ENCODE_B3};
			q110 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_D4};
			q111 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_D4};
			q112 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_G4};
			q113 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_G4};
			q114 <= {`LIG_FALSE, `BEAT_1, `ENCODE_NA};
			q115 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_A4};
			q116 <= {`LIG_FALSE, `BEAT_1, `ENCODE_A4};
			q117 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_NA};
			q118 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_B4};
			q119 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_B4};
			q120 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_C5};
			q121 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_B4};
			q122 <= {`LIG_FALSE, `BEAT_1, `ENCODE_E4};
			q123 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_A4};
			q124 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_A4};
			q125 <= {`LIG_FALSE, `BEAT_2, `ENCODE_G4};
			q126 <= {`LIG_FALSE, `BEAT_1, `ENCODE_F4_};
			q127 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_E4};
			q128 <= {`LIG_FALSE, `BEAT_0_5, `ENCODE_F4_};
			q129 <= {`LIG_FALSE, `BEAT_3, `ENCODE_G4};
			q130 <= {`LIG_FALSE, `BEAT_1, `ENCODE_NA};
			q131 <= {`LIG_FALSE, `BEAT_4, `ENCODE_NA};
			q132 <= {`LIG_FALSE, `BEAT_4, `ENCODE_NA};
		end
	else
		begin
			q0 <= q1;
			q1 <= q2;
			q2 <= q3;
			q3 <= q4;
			q4 <= q5;
			q5 <= q6;
			q6 <= q7;
			q7 <= q8;
			q8 <= q9;
			q9 <= q10;
			q10 <= q11;
			q11 <= q12;
			q12 <= q13;
			q13 <= q14;
			q14 <= q15;
			q15 <= q16;
			q16 <= q17;
			q17 <= q18;
			q18 <= q19;
			q19 <= q20;
			q20 <= q21;
			q21 <= q22;
			q22 <= q23;
			q23 <= q24;
			q24 <= q25;
			q25 <= q26;
			q26 <= q27;
			q27 <= q28;
			q28 <= q29;
			q29 <= q30;
			q30 <= q31;
			q31 <= q32;
			q32 <= q33;
			q33 <= q34;
			q34 <= q35;
			q35 <= q36;
			q36 <= q37;
			q37 <= q38;
			q38 <= q39;
			q39 <= q40;
			q40 <= q41;
			q41 <= q42;
			q42 <= q43;
			q43 <= q44;
			q44 <= q45;
			q45 <= q46;
			q46 <= q47;
			q47 <= q48;
			q48 <= q49;
			q49 <= q50;
			q50 <= q51;
			q51 <= q52;
			q52 <= q53;
			q53 <= q54;
			q54 <= q55;
			q55 <= q56;
			q56 <= q57;
			q57 <= q58;
			q58 <= q59;
			q59 <= q60;
			q60 <= q61;
			q61 <= q62;
			q62 <= q63;
			q63 <= q64;
			q64 <= q65;
			q65 <= q66;
			q66 <= q67;
			q67 <= q68;
			q68 <= q69;
			q69 <= q70;
			q70 <= q71;
			q71 <= q72;
			q72 <= q73;
			q73 <= q74;
			q74 <= q75;
			q75 <= q76;
			q76 <= q77;
			q77 <= q78;
			q78 <= q79;
			q79 <= q80;
			q80 <= q81;
			q81 <= q82;
			q82 <= q83;
			q83 <= q84;
			q84 <= q85;
			q85 <= q86;
			q86 <= q87;
			q87 <= q88;
			q88 <= q89;
			q89 <= q90;
			q90 <= q91;
			q91 <= q92;
			q92 <= q93;
			q93 <= q94;
			q94 <= q95;
			q95 <= q96;
			q96 <= q97;
			q97 <= q98;
			q98 <= q99;
			q99 <= q100;
			q100 <= q101;
			q101 <= q102;
			q102 <= q103;
			q103 <= q104;
			q104 <= q105;
			q105 <= q106;
			q106 <= q107;
			q107 <= q108;
			q108 <= q109;
			q109 <= q110;
			q110 <= q111;
			q111 <= q112;
			q112 <= q113;
			q113 <= q114;
			q114 <= q115;
			q115 <= q116;
			q116 <= q117;
			q117 <= q118;
			q118 <= q119;
			q119 <= q120;
			q120 <= q121;
			q121 <= q122;
			q122 <= q123;
			q123 <= q124;
			q124 <= q125;
			q125 <= q126;
			q126 <= q127;
			q127 <= q128;
			q128 <= q129;
			q129 <= q130;
			q130 <= q131;
			q131 <= q132;
			q132 <= q0;
		end
endmodule
