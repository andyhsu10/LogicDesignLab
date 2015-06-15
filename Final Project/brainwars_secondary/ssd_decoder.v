`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu & Hsin-Ho Lu
// 
// Create Date:    20:52:22 06/15/2015 
// Module Name:    ssd_decoder
// Project Name:   2015 Spring Logic Design Laboratory Final Project
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module ssd_decoder(
	ssd_out, //14-segment display output
	bcd //BCD input
);

output [14:0] ssd_out;
input [5:0] bcd;

reg [14:0] ssd_out;

//Combinational logics:
always @(bcd)
	case (bcd)
		6'd0:
			ssd_out = `FTSD_A; //A
		6'd1:
			ssd_out = `FTSD_B; //B
		6'd2:
			ssd_out = `FTSD_C; //C
		6'd3:
			ssd_out = `FTSD_D; //D
		6'd4:
			ssd_out = `FTSD_E; //E
		6'd5:
			ssd_out = `FTSD_F; //F
		6'd6:
			ssd_out = `FTSD_G; //G
		6'd7:
			ssd_out = `FTSD_H; //H
		6'd8:
			ssd_out = `FTSD_I; //I
		6'd9:
			ssd_out = `FTSD_J; //J
		6'd10:
			ssd_out = `FTSD_K; //K
		6'd11:
			ssd_out = `FTSD_L; //L
		6'd12:
			ssd_out = `FTSD_M; //M
		6'd13:
			ssd_out = `FTSD_N; //N
		6'd14:
			ssd_out = `FTSD_O; //O
		6'd15:
			ssd_out = `FTSD_P; //P
		6'd16:
			ssd_out = `FTSD_Q; //Q
		6'd17:
			ssd_out = `FTSD_R; //R
		6'd18:
			ssd_out = `FTSD_S; //S
		6'd19:
			ssd_out = `FTSD_T; //T
		6'd20:
			ssd_out = `FTSD_U; //U
		6'd21:
			ssd_out = `FTSD_V; //V
		6'd22:
			ssd_out = `FTSD_W; //W
		6'd23:
			ssd_out = `FTSD_X; //X
		6'd24:
			ssd_out = `FTSD_Y; //Y
		6'd25:
			ssd_out = `FTSD_Z; //Z
		6'd26:
			ssd_out = 15'b1111_1111_1111_111; //Show nothing
		default:
			ssd_out = 15'b1111_1111_1111_110; //.
	endcase

endmodule