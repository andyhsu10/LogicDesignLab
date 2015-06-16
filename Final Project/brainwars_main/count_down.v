`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu & Hsin-Ho Lu
//
// Create Date:    02:13:51 06/16/2015
// Module Name:    count_down
// Project Name:   2015 Spring Logic Design Laboratory Final Project
// Revision:
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module count_down(
	q0, //shifter output
	clk, // global clock
	rst_n //active low reset
);

//I/Os
output [31:0] q0; //output
input clk, rst_n; //clock & global clock

reg [31:0] q0, q1, q2, q3, q4, q5, q6, q7, q8, q9;
reg [31:0] q10, q11, q12, q13, q14, q15, q16, q17, q18, q19;
reg [31:0] q20, q21, q22, q23, q24, q25, q26, q27, q28, q29;
reg [31:0] q30, q31, q32, q33, q34, q35, q36, q37, q38, q39;
reg [31:0] q40, q41, q42, q43, q44, q45, q46, q47, q48, q49;
reg [31:0] q50, q51, q52, q53, q54, q55, q56, q57, q58, q59;
reg [31:0] q60, q61, q62, q63, q64, q65;

//Sequential logics: Flip Flops
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		begin
			q0 <= {`GRAPH_LU_1, `GRAPH_RU_1, `GRAPH_LD_1, `GRAPH_RD_1};
			q1 <= {`GRAPH_LU_1, `GRAPH_RU_2, `GRAPH_LD_1, `GRAPH_RD_1};
			q2 <= {`GRAPH_LU_1, `GRAPH_RU_3, `GRAPH_LD_1, `GRAPH_RD_1};
			q3 <= {`GRAPH_LU_1, `GRAPH_RU_4, `GRAPH_LD_1, `GRAPH_RD_1};
			q4 <= {`GRAPH_LU_1, `GRAPH_RU_5, `GRAPH_LD_1, `GRAPH_RD_1};
			q5 <= {`GRAPH_LU_1, `GRAPH_RU_6, `GRAPH_LD_1, `GRAPH_RD_1};
			q6 <= {`GRAPH_LU_1, `GRAPH_RU_7, `GRAPH_LD_1, `GRAPH_RD_1};
			q7 <= {`GRAPH_LU_1, `GRAPH_RU_8, `GRAPH_LD_1, `GRAPH_RD_1};
			q8 <= {`GRAPH_LU_1, `GRAPH_RU_9, `GRAPH_LD_1, `GRAPH_RD_1};
			q9 <= {`GRAPH_LU_1, `GRAPH_RU_10, `GRAPH_LD_1, `GRAPH_RD_1};
			q10 <= {`GRAPH_LU_1, `GRAPH_RU_11, `GRAPH_LD_1, `GRAPH_RD_1};
			q11 <= {`GRAPH_LU_1, `GRAPH_RU_12, `GRAPH_LD_1, `GRAPH_RD_1};
			q12 <= {`GRAPH_LU_1, `GRAPH_RU_13, `GRAPH_LD_1, `GRAPH_RD_1};
			q13 <= {`GRAPH_LU_2, `GRAPH_RU_14, `GRAPH_LD_2, `GRAPH_RD_2};
			q14 <= {`GRAPH_LU_2, `GRAPH_RU_15, `GRAPH_LD_2, `GRAPH_RD_2};
			q15 <= {`GRAPH_LU_2, `GRAPH_RU_16, `GRAPH_LD_2, `GRAPH_RD_2};
			q16 <= {`GRAPH_LU_2, `GRAPH_RU_17, `GRAPH_LD_2, `GRAPH_RD_2};
			q17 <= {`GRAPH_LU_2, `GRAPH_RU_17, `GRAPH_LD_2, `GRAPH_RD_3};
			q18 <= {`GRAPH_LU_2, `GRAPH_RU_17, `GRAPH_LD_2, `GRAPH_RD_4};
			q19 <= {`GRAPH_LU_2, `GRAPH_RU_17, `GRAPH_LD_2, `GRAPH_RD_5};
			q20 <= {`GRAPH_LU_2, `GRAPH_RU_17, `GRAPH_LD_2, `GRAPH_RD_6};
			q21 <= {`GRAPH_LU_2, `GRAPH_RU_17, `GRAPH_LD_2, `GRAPH_RD_7};
			q22 <= {`GRAPH_LU_2, `GRAPH_RU_17, `GRAPH_LD_2, `GRAPH_RD_8};
			q23 <= {`GRAPH_LU_2, `GRAPH_RU_17, `GRAPH_LD_2, `GRAPH_RD_9};
			q24 <= {`GRAPH_LU_2, `GRAPH_RU_17, `GRAPH_LD_2, `GRAPH_RD_10};
			q25 <= {`GRAPH_LU_2, `GRAPH_RU_17, `GRAPH_LD_2, `GRAPH_RD_11};
			q26 <= {`GRAPH_LU_3, `GRAPH_RU_18, `GRAPH_LD_3, `GRAPH_RD_12};
			q27 <= {`GRAPH_LU_3, `GRAPH_RU_18, `GRAPH_LD_3, `GRAPH_RD_13};
			q28 <= {`GRAPH_LU_3, `GRAPH_RU_18, `GRAPH_LD_3, `GRAPH_RD_14};
			q29 <= {`GRAPH_LU_3, `GRAPH_RU_18, `GRAPH_LD_3, `GRAPH_RD_15};
			q30 <= {`GRAPH_LU_3, `GRAPH_RU_18, `GRAPH_LD_3, `GRAPH_RD_16};
			q31 <= {`GRAPH_LU_3, `GRAPH_RU_18, `GRAPH_LD_3, `GRAPH_RD_17};
			q32 <= {`GRAPH_LU_3, `GRAPH_RU_18, `GRAPH_LD_3, `GRAPH_RD_18};
			q33 <= {`GRAPH_LU_3, `GRAPH_RU_18, `GRAPH_LD_4, `GRAPH_RD_18};
			q34 <= {`GRAPH_LU_3, `GRAPH_RU_18, `GRAPH_LD_5, `GRAPH_RD_18};
			q35 <= {`GRAPH_LU_3, `GRAPH_RU_18, `GRAPH_LD_6, `GRAPH_RD_18};
			q36 <= {`GRAPH_LU_3, `GRAPH_RU_18, `GRAPH_LD_7, `GRAPH_RD_18};
			q37 <= {`GRAPH_LU_3, `GRAPH_RU_18, `GRAPH_LD_8, `GRAPH_RD_18};
			q38 <= {`GRAPH_LU_3, `GRAPH_RU_18, `GRAPH_LD_9, `GRAPH_RD_18};
			q39 <= {`GRAPH_LU_4, `GRAPH_RU_19, `GRAPH_LD_10, `GRAPH_RD_19};
			q40 <= {`GRAPH_LU_4, `GRAPH_RU_19, `GRAPH_LD_11, `GRAPH_RD_19};
			q41 <= {`GRAPH_LU_4, `GRAPH_RU_19, `GRAPH_LD_12, `GRAPH_RD_19};
			q42 <= {`GRAPH_LU_4, `GRAPH_RU_19, `GRAPH_LD_13, `GRAPH_RD_19};
			q43 <= {`GRAPH_LU_4, `GRAPH_RU_19, `GRAPH_LD_14, `GRAPH_RD_19};
			q44 <= {`GRAPH_LU_4, `GRAPH_RU_19, `GRAPH_LD_15, `GRAPH_RD_19};
			q45 <= {`GRAPH_LU_4, `GRAPH_RU_19, `GRAPH_LD_16, `GRAPH_RD_19};
			q46 <= {`GRAPH_LU_4, `GRAPH_RU_19, `GRAPH_LD_17, `GRAPH_RD_19};
			q47 <= {`GRAPH_LU_4, `GRAPH_RU_19, `GRAPH_LD_18, `GRAPH_RD_19};
			q48 <= {`GRAPH_LU_4, `GRAPH_RU_19, `GRAPH_LD_19, `GRAPH_RD_19};
			q49 <= {`GRAPH_LU_5, `GRAPH_RU_19, `GRAPH_LD_19, `GRAPH_RD_19};
			q50 <= {`GRAPH_LU_6, `GRAPH_RU_19, `GRAPH_LD_19, `GRAPH_RD_19};
			q51 <= {`GRAPH_LU_7, `GRAPH_RU_19, `GRAPH_LD_19, `GRAPH_RD_19};
			q52 <= {`GRAPH_LU_8, `GRAPH_RU_20, `GRAPH_LD_20, `GRAPH_RD_20};
			q53 <= {`GRAPH_LU_9, `GRAPH_RU_20, `GRAPH_LD_20, `GRAPH_RD_20};
			q54 <= {`GRAPH_LU_10, `GRAPH_RU_20, `GRAPH_LD_20, `GRAPH_RD_20};
			q55 <= {`GRAPH_LU_11, `GRAPH_RU_20, `GRAPH_LD_20, `GRAPH_RD_20};
			q56 <= {`GRAPH_LU_12, `GRAPH_RU_20, `GRAPH_LD_20, `GRAPH_RD_20};
			q57 <= {`GRAPH_LU_13, `GRAPH_RU_20, `GRAPH_LD_20, `GRAPH_RD_20};
			q58 <= {`GRAPH_LU_14, `GRAPH_RU_20, `GRAPH_LD_20, `GRAPH_RD_20};
			q59 <= {`GRAPH_LU_15, `GRAPH_RU_20, `GRAPH_LD_20, `GRAPH_RD_20};
			q60 <= {`GRAPH_LU_16, `GRAPH_RU_20, `GRAPH_LD_20, `GRAPH_RD_20};
			q61 <= {`GRAPH_LU_17, `GRAPH_RU_20, `GRAPH_LD_20, `GRAPH_RD_20};
			q62 <= {`GRAPH_LU_18, `GRAPH_RU_20, `GRAPH_LD_20, `GRAPH_RD_20};
			q63 <= {`GRAPH_LU_19, `GRAPH_RU_20, `GRAPH_LD_20, `GRAPH_RD_20};
			q64 <= {`GRAPH_LU_20, `GRAPH_RU_20, `GRAPH_LD_20, `GRAPH_RD_20};
			q65 <= {`GRAPH_LU_21, `GRAPH_RU_21, `GRAPH_LD_21, `GRAPH_RD_21};
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
			q65 <= q0;
		end
endmodule