`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:53:38 06/25/2015 
// Design Name: 
// Module Name:    high_or_low 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module high_or_low(
	clk_100,				// 100 HZ (I)
	rst_n,				// reset (I)
	game_en,				// enable to play game (I)
	key,					// keypad (I)
	pressed,				// if key pad was pressed (I)
	data_output,		// to ram_ctrl 128b (O)
	point					// 1:get point 0:no point got (O)
);

input clk_100, rst_n;
input [2:0]game_en;
input [3:0]key;
input pressed;

output reg [127:0]data_output;
output point;

wire point_n;
wire [6:0]rand_number_7b;
wire [7:0]rand_number_8b;
assign rand_number_8b = {1'b0, rand_number_7b};
assign point = ~point_n;

//generate 3 bit rand number
rand_00_to_99 RAND_00_99(
	.clk(clk_100),//100HZ
	.rst_n(rst_n),
	.key(key),
	.pressed(pressed),
	.rand_out(rand_number_7b),
	.point_out(point_n)
);

wire [3:0]rand0, rand1;

binary_converter BCD_conv(
	.answer_in(rand_number_8b), //binary answer (I)
	.answer_unit(rand0), //answer unit digit (O)
	.answer_tens(rand1) //answer tens digit (O)
	///.answer_hund //answer hundreds digit (O)
);
reg [7:0]dig1, dig0;

always@*
begin
	case (rand0)
		4'd0: dig0 = `FONT_0;
		4'd1: dig0 = `FONT_1;
		4'd2: dig0 = `FONT_2;
		4'd3: dig0 = `FONT_3;
		4'd4: dig0 = `FONT_4;
		4'd5: dig0 = `FONT_5;
		4'd6: dig0 = `FONT_6;
		4'd7: dig0 = `FONT_7;
		4'd8: dig0 = `FONT_8;
		4'd9: dig0 = `FONT_9;
	default: dig0 = `FONT_NONE;
	endcase

case (rand1)
		4'd0: dig1 = `FONT_0;
		4'd1: dig1 = `FONT_1;
		4'd2: dig1 = `FONT_2;
		4'd3: dig1 = `FONT_3;
		4'd4: dig1 = `FONT_4;
		4'd5: dig1 = `FONT_5;
		4'd6: dig1 = `FONT_6;
		4'd7: dig1 = `FONT_7;
		4'd8: dig1 = `FONT_8;
		4'd9: dig1 = `FONT_9;
	default: dig1 = `FONT_NONE;
	endcase
	
end

always@*
begin
	if ( game_en == 3'b010 )
			data_output = {8'd0, 8'd0, 8'd0, 8'd0, 
								8'd0, dig1, dig0, 8'd0,
								8'd0, 8'd0, 8'd0, 8'd0, 
								8'd0, 8'd0, 8'd0, 8'd0};
	else 
		data_output = 128'd0;
end

endmodule
