`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu
// 
// Create Date:    19:56:23 05/21/2015 
// Module Name:    note_ctl 
// Project Name:   Lab10-2
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module note_ctl(
	letter1, //letter 1 output  (O)
	letter2, //letter 2 output (O)
	note_div, //div for note generation (O)
	clk, //global clock signal (I)
	pressed, //whether key pressed (1) or not (0) (I)
	key, //returned pressed key (I)
	rst_n //active low reset (I)
);

//I/Os
input clk; //global signal input
input pressed; //whether key pressed (1) or not (0)
input rst_n; //active low reset
input [3:0] key; //returned pressed key
output [5:0] letter1; //letter 1 output
output [5:0] letter2; //letter 2 output
output [19:0] note_div; //div for note generation

reg [5:0] letter1; //letter 1
reg [5:0] letter2; //letter 2
reg [19:0] note_div; //div for note generation

always @*
	if(~rst_n)
		begin
			note_div = `C3;
			letter1 = 6'd3;
			letter2 = 6'd14;
		end
	else if((key == `KEY_0) && (pressed == 1'b1))
		begin
			note_div = `C3;
			letter1 = 6'd3;
			letter2 = 6'd14;
		end
	else if((key == `KEY_1) && (pressed == 1'b1))
		begin
			note_div = `D3;
			letter1 = 6'd17;
			letter2 = 6'd4;
		end
	else if((key == `KEY_2) && (pressed == 1'b1))
		begin
			note_div = `E3;
			letter1 = 6'd12;
			letter2 = 6'd8;
		end
	else if((key == `KEY_3) && (pressed == 1'b1))
		begin
			note_div = `F3;
			letter1 = 6'd5;
			letter2 = 6'd0;
		end
	else if((key == `KEY_4) && (pressed == 1'b1))
		begin
			note_div = `G3;
			letter1 = 6'd18;
			letter2 = 6'd14;
		end
	else if((key == `KEY_5) && (pressed == 1'b1))
		begin
			note_div = `A3;
			letter1 = 6'd11;
			letter2 = 6'd0;
		end
	else if((key == `KEY_6) && (pressed == 1'b1))
		begin
			note_div = `B3;
			letter1 = 6'd18;
			letter2 = 6'd8;
		end
	else if((key == `KEY_7) && (pressed == 1'b1))
		begin
			note_div = `C4;
			letter1 = 6'd3;
			letter2 = 6'd14;
		end
	else if((key == `KEY_8) && (pressed == 1'b1))
		begin
			note_div = `D4;
			letter1 = 6'd17;
			letter2 = 6'd4;
		end
	else if((key == `KEY_9) && (pressed == 1'b1))
		begin
			note_div = `E4;
			letter1 = 6'd12;
			letter2 = 6'd8;
		end
	else if((key == `KEY_A) && (pressed == 1'b1))
		begin
			note_div = `F4;
			letter1 = 6'd5;
			letter2 = 6'd0;
		end
	else if((key == `KEY_B) && (pressed == 1'b1))
		begin
			note_div = `G4;
			letter1 = 6'd18;
			letter2 = 6'd14;
		end
	else if((key == `KEY_C) && (pressed == 1'b1))
		begin
			note_div = `A4;
			letter1 = 6'd11;
			letter2 = 6'd0;
		end
	else if((key == `KEY_D) && (pressed == 1'b1))
		begin
			note_div = `B4;
			letter1 = 6'd18;
			letter2 = 6'd8;
		end
	else if((key == `KEY_E) && (pressed == 1'b1))
		begin
			note_div = `C5;
			letter1 = 6'd3;
			letter2 = 6'd14;
		end
	else if((key == `KEY_F) && (pressed == 1'b1))
		begin
			note_div = `D5;
			letter1 = 6'd17;
			letter2 = 6'd4;
		end
	else
		begin
			note_div = 20'd0;
			letter1 = 6'd26;
			letter2 = 6'd26;
		end

endmodule