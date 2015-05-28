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
	letter1, //letter 1 output (O)
	letter2, //letter 2 output (O)
	letter3, //letter 3 output (O)
	letter4, //letter 4 output (O)
	note_div_left, //left div for note generation (O)
	note_div_right, //right div for note generation (O)
	clk, //global clock signal (I)
	DIP, //DIP switch (I)
	pressed, //whether key pressed (1) or not (0) (I)
	key, //returned pressed key (I)
	rst_n //active low reset (I)
);

//I/Os
input clk; //global signal input
input DIP; //DIP switch
input pressed; //whether key pressed (1) or not (0)
input rst_n; //active low reset
input [3:0] key; //returned pressed key
output [5:0] letter1; //letter 1 output
output [5:0] letter2; //letter 2 output
output [5:0] letter3; //letter 3 output
output [5:0] letter4; //letter 4 output
output [19:0] note_div_left, note_div_right; //left and right div for note generation

reg [5:0] letter1; //letter 1
reg [5:0] letter2; //letter 2
reg [5:0] letter3; //letter 3
reg [5:0] letter4; //letter 4
reg [19:0] note_div_left, note_div_right; //left and right div for note generation

always @*
	if(~rst_n)
		begin
			note_div_left = `C3;
			note_div_right = `C3;
			letter1 = 6'd26;
			letter2 = 6'd26;
			letter3 = 6'd3;
			letter4 = 6'd14;
		end

	//DIP == 0
	else if((key == `KEY_0) && (pressed == 1'b1) && (DIP == 1'b0))
		begin
			note_div_left = `C3;
			note_div_right = `C3;
			letter1 = 6'd26;
			letter2 = 6'd26;
			letter3 = 6'd3;
			letter4 = 6'd14;
		end
	else if((key == `KEY_1) && (pressed == 1'b1) && (DIP == 1'b0))
		begin
			note_div_left = `D3;
			note_div_right = `D3;
			letter1 = 6'd26;
			letter2 = 6'd26;
			letter3 = 6'd17;
			letter4 = 6'd4;
		end
	else if((key == `KEY_2) && (pressed == 1'b1) && (DIP == 1'b0))
		begin
			note_div_left = `E3;
			note_div_right = `E3;
			letter1 = 6'd26;
			letter2 = 6'd26;
			letter3 = 6'd12;
			letter4 = 6'd8;
		end
	else if((key == `KEY_3) && (pressed == 1'b1) && (DIP == 1'b0))
		begin
			note_div_left = `F3;
			note_div_right = `F3;
			letter1 = 6'd26;
			letter2 = 6'd26;
			letter3 = 6'd5;
			letter4 = 6'd0;
		end
	else if((key == `KEY_4) && (pressed == 1'b1) && (DIP == 1'b0))
		begin
			note_div_left = `G3;
			note_div_right = `G3;
			letter1 = 6'd26;
			letter2 = 6'd26;
			letter3 = 6'd18;
			letter4 = 6'd14;
		end
	else if((key == `KEY_5) && (pressed == 1'b1) && (DIP == 1'b0))
		begin
			note_div_left = `A3;
			note_div_right = `A3;
			letter1 = 6'd26;
			letter2 = 6'd26;
			letter3 = 6'd11;
			letter4 = 6'd0;
		end
	else if((key == `KEY_6) && (pressed == 1'b1) && (DIP == 1'b0))
		begin
			note_div_left = `B3;
			note_div_right = `B3;
			letter1 = 6'd26;
			letter2 = 6'd26;
			letter3 = 6'd18;
			letter4 = 6'd8;
		end
	else if((key == `KEY_7) && (pressed == 1'b1) && (DIP == 1'b0))
		begin
			note_div_left = `C4;
			note_div_right = `C4;
			letter1 = 6'd26;
			letter2 = 6'd26;
			letter3 = 6'd3;
			letter4 = 6'd14;
		end
	else if((key == `KEY_8) && (pressed == 1'b1) && (DIP == 1'b0))
		begin
			note_div_left = `D4;
			note_div_right = `D4;
			letter1 = 6'd26;
			letter2 = 6'd26;
			letter3 = 6'd17;
			letter4 = 6'd4;
		end
	else if((key == `KEY_9) && (pressed == 1'b1) && (DIP == 1'b0))
		begin
			note_div_left = `E4;
			note_div_right = `E4;
			letter1 = 6'd26;
			letter2 = 6'd26;
			letter3 = 6'd12;
			letter4 = 6'd8;
		end
	else if((key == `KEY_A) && (pressed == 1'b1) && (DIP == 1'b0))
		begin
			note_div_left = `F4;
			note_div_right = `F4;
			letter1 = 6'd26;
			letter2 = 6'd26;
			letter3 = 6'd5;
			letter4 = 6'd0;
		end
	else if((key == `KEY_B) && (pressed == 1'b1) && (DIP == 1'b0))
		begin
			note_div_left = `G4;
			note_div_right = `G4;
			letter1 = 6'd26;
			letter2 = 6'd26;
			letter3 = 6'd18;
			letter4 = 6'd14;
		end
	else if((key == `KEY_C) && (pressed == 1'b1) && (DIP == 1'b0))
		begin
			note_div_left = `A4;
			note_div_right = `A4;
			letter1 = 6'd26;
			letter2 = 6'd26;
			letter3 = 6'd11;
			letter4 = 6'd0;
		end
	else if((key == `KEY_D) && (pressed == 1'b1) && (DIP == 1'b0))
		begin
			note_div_left = `B4;
			note_div_right = `B4;
			letter1 = 6'd26;
			letter2 = 6'd26;
			letter3 = 6'd18;
			letter4 = 6'd8;
		end
	else if((key == `KEY_E) && (pressed == 1'b1) && (DIP == 1'b0))
		begin
			note_div_left = `C5;
			note_div_right = `C5;
			letter1 = 6'd26;
			letter2 = 6'd26;
			letter3 = 6'd3;
			letter4 = 6'd14;
		end
	else if((key == `KEY_F) && (pressed == 1'b1) && (DIP == 1'b0))
		begin
			note_div_left = `D5;
			note_div_right = `D5;
			letter1 = 6'd26;
			letter2 = 6'd26;
			letter3 = 6'd17;
			letter4 = 6'd4;
		end

	//DIP == 1'b1
	else if((key == `KEY_0) && (pressed == 1'b1) && (DIP == 1'b1))
		begin
			note_div_left = `C3;
			note_div_right = `E3;
			letter1 = 6'd3;
			letter2 = 6'd14;
			letter3 = 6'd12;
			letter4 = 6'd8;
		end
	else if((key == `KEY_1) && (pressed == 1'b1) && (DIP == 1'b1))
		begin
			note_div_left = `D3;
			note_div_right = `F3;
			letter1 = 6'd17;
			letter2 = 6'd4;
			letter3 = 6'd5;
			letter4 = 6'd0;
		end
	else if((key == `KEY_2) && (pressed == 1'b1) && (DIP == 1'b1))
		begin
			note_div_left = `E3;
			note_div_right = `G3;
			letter1 = 6'd12;
			letter2 = 6'd8;
			letter3 = 6'd18;
			letter4 = 6'd14;
		end
	else if((key == `KEY_3) && (pressed == 1'b1) && (DIP == 1'b1))
		begin
			note_div_left = `F3;
			note_div_right = `A3;
			letter1 = 6'd5;
			letter2 = 6'd0;
			letter3 = 6'd11;
			letter4 = 6'd0;
		end
	else if((key == `KEY_4) && (pressed == 1'b1) && (DIP == 1'b1))
		begin
			note_div_left = `G3;
			note_div_right = `B3;
			letter1 = 6'd18;
			letter2 = 6'd14;
			letter3 = 6'd18;
			letter4 = 6'd8;
		end
	else if((key == `KEY_5) && (pressed == 1'b1) && (DIP == 1'b1))
		begin
			note_div_left = `A3;
			note_div_right = `C4;
			letter1 = 6'd11;
			letter2 = 6'd0;
			letter3 = 6'd3;
			letter4 = 6'd14;
		end
	else if((key == `KEY_6) && (pressed == 1'b1) && (DIP == 1'b1))
		begin
			note_div_left = `B3;
			note_div_right = `D4;
			letter1 = 6'd18;
			letter2 = 6'd8;
			letter3 = 6'd17;
			letter4 = 6'd4;
		end
	else if((key == `KEY_7) && (pressed == 1'b1) && (DIP == 1'b1))
		begin
			note_div_left = `C4;
			note_div_right = `E4;
			letter1 = 6'd3;
			letter2 = 6'd14;
			letter3 = 6'd12;
			letter4 = 6'd8;
		end
	else if((key == `KEY_8) && (pressed == 1'b1) && (DIP == 1'b1))
		begin
			note_div_left = `D4;
			note_div_right = `F4;
			letter1 = 6'd17;
			letter2 = 6'd4;
			letter3 = 6'd5;
			letter4 = 6'd0;
		end
	else if((key == `KEY_9) && (pressed == 1'b1) && (DIP == 1'b1))
		begin
			note_div_left = `E4;
			note_div_right = `G4;
			letter1 = 6'd12;
			letter2 = 6'd8;
			letter3 = 6'd18;
			letter4 = 6'd14;
		end
	else if((key == `KEY_A) && (pressed == 1'b1) && (DIP == 1'b1))
		begin
			note_div_left = `F4;
			note_div_right = `A4;
			letter1 = 6'd5;
			letter2 = 6'd0;
			letter3 = 6'd11;
			letter4 = 6'd0;
		end
	else if((key == `KEY_B) && (pressed == 1'b1) && (DIP == 1'b1))
		begin
			note_div_left = `G4;
			note_div_right = `B4;
			letter1 = 6'd18;
			letter2 = 6'd14;
			letter3 = 6'd18;
			letter4 = 6'd8;
		end
	else if((key == `KEY_C) && (pressed == 1'b1) && (DIP == 1'b1))
		begin
			note_div_left = `A4;
			note_div_right = `C5;
			letter1 = 6'd11;
			letter2 = 6'd0;
			letter3 = 6'd3;
			letter4 = 6'd14;
		end
	else if((key == `KEY_D) && (pressed == 1'b1) && (DIP == 1'b1))
		begin
			note_div_left = `B4;
			note_div_right = `D5;
			letter1 = 6'd18;
			letter2 = 6'd8;
			letter3 = 6'd17;
			letter4 = 6'd4;
		end
	else if((key == `KEY_E) && (pressed == 1'b1) && (DIP == 1'b1))
		begin
			note_div_left = `C5;
			note_div_right = `E5;
			letter1 = 6'd3;
			letter2 = 6'd14;
			letter3 = 6'd12;
			letter4 = 6'd8;
		end
	else if((key == `KEY_F) && (pressed == 1'b1) && (DIP == 1'b1))
		begin
			note_div_left = `D5;
			note_div_right = `F5;
			letter1 = 6'd17;
			letter2 = 6'd4;
			letter3 = 6'd5;
			letter4 = 6'd0;
		end
	else
		begin
			note_div_left = 20'd0;
			note_div_right = 20'd0;
			letter1 = 6'd26;
			letter2 = 6'd26;
			letter3 = 6'd26;
			letter4 = 6'd26;
		end

endmodule