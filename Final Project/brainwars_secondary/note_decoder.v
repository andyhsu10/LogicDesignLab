`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu & Hsin-Ho Lu
// 
// Create Date:    20:50:55 06/15/2015 
// Module Name:    note_decode 
// Project Name:   2015 Spring Logic Design Laboratory Final Project
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module note_decode(
	note, //note from main board (I)
	note_div //div for note generation (O)
);

//I/Os
output [19:0] note_div; //div for note generation
input [5:0] note; //note from from main board

reg [19:0] note_div; //div for note generation

//Note decision
always @*
	case(note)
		`ENCODE_NA: note_div = `NA;
		`ENCODE_C3: note_div = `C3;
		`ENCODE_C3_: note_div = `C3_;
		`ENCODE_D3: note_div = `D3;
		`ENCODE_D3_: note_div = `D3_;
		`ENCODE_E3: note_div = `E3;
		`ENCODE_F3: note_div = `F3;
		`ENCODE_F3_: note_div = `F3_;
		`ENCODE_G3: note_div = `G3;
		`ENCODE_G3_: note_div = `G3_;
		`ENCODE_A3: note_div = `A3;
		`ENCODE_A3_: note_div = `A3_;
		`ENCODE_B3: note_div = `B3;
		`ENCODE_C4: note_div = `C4;
		`ENCODE_C4_: note_div = `C4_;
		`ENCODE_D4: note_div = `D4;
		`ENCODE_D4_: note_div = `D4_;
		`ENCODE_E4: note_div = `E4;
		`ENCODE_F4: note_div = `F4;
		`ENCODE_F4_: note_div = `F4_;
		`ENCODE_G4: note_div = `G4;
		`ENCODE_G4_: note_div = `G4_;
		`ENCODE_A4: note_div = `A4;
		`ENCODE_A4_: note_div = `A4_;
		`ENCODE_B4: note_div = `B4;
		`ENCODE_C5: note_div = `C5;
		`ENCODE_C5_: note_div = `C5_;
		`ENCODE_D5: note_div = `D5;
		`ENCODE_D5_: note_div = `D5_;
		`ENCODE_E5: note_div = `E5;
		`ENCODE_F5: note_div = `F5;
		`ENCODE_F5_: note_div = `F5_;
		`ENCODE_G5: note_div = `G5;
		`ENCODE_G5_: note_div = `G5_;
		`ENCODE_A5: note_div = `A5;
		`ENCODE_A5_: note_div = `A5_;
		`ENCODE_B5: note_div = `B5;
	endcase
	
endmodule
