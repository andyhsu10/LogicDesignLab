`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:36:32 06/25/2015 
// Design Name: 
// Module Name:    mora 
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
module mora(
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
wire [2:0]rand_number;

assign point = ~point_n;

//generate 3 bit rand number
rand_0_7_ver5 RAND(
	.clk(clk_100),//clk_100 or faster
	.rst_n(rst_n),
	.key(key),
	.pressed(pressed),
	.rand_out(rand_number),
	.point_out(point_n)
);

always@*
begin
	if ( game_en == 3'b001 )
		case (rand_number)
			3'd0:
				data_output = {8'd0, 8'd0, 8'd0, 8'd0, 
									8'd0, `GRAPH_MORA_0_1, `GRAPH_MORA_0_2, 8'd0,
									8'd0, 8'd0, 8'd0, 8'd0,
									8'd0, 8'd0, 8'd0, 8'd0};
			3'd1:
				data_output = {8'd0, 8'd0, 8'd0, 8'd0, 
									8'd0, `GRAPH_MORA_1_1, `GRAPH_MORA_1_2, 8'd0,
									8'd0, 8'd0, 8'd0, 8'd0,
									8'd0, 8'd0, 8'd0, 8'd0};
			3'd2:
				data_output = {8'd0, 8'd0, 8'd0, 8'd0, 
									8'd0, `GRAPH_MORA_2_1, `GRAPH_MORA_2_2, 8'd0,
									8'd0, 8'd0, 8'd0, 8'd0,
									8'd0, 8'd0, 8'd0, 8'd0};
			3'd3:
				data_output = {8'd0, 8'd0, 8'd0, 8'd0, 
									8'd0, `GRAPH_MORA_3_1, `GRAPH_MORA_3_2, 8'd0,
									8'd0, 8'd0, 8'd0, 8'd0,
									8'd0, 8'd0, 8'd0, 8'd0};
			3'd4:
				data_output = {8'd0, 8'd0, 8'd0, 8'd0, 
									8'd0, `GRAPH_MORA_4_1, `GRAPH_MORA_4_2, 8'd0,
									8'd0, 8'd0, 8'd0, 8'd0,
									8'd0, 8'd0, 8'd0, 8'd0};
			3'd5:
				data_output = {8'd0, 8'd0, 8'd0, 8'd0, 
									8'd0, `GRAPH_MORA_5_1, `GRAPH_MORA_5_2, 8'd0,
									8'd0, 8'd0, 8'd0, 8'd0,
									8'd0, 8'd0, 8'd0, 8'd0};
			3'd6:
				data_output = {8'd0, 8'd0, 8'd0, 8'd0, 
									8'd0, `GRAPH_MORA_0_1, `GRAPH_MORA_0_2, 8'd0,
									8'd0, 8'd0, 8'd0, 8'd0,
									8'd0, 8'd0, 8'd0, 8'd0};
			3'd7:
				data_output = {8'd0, 8'd0, 8'd0, 8'd0, 
									8'd0, `GRAPH_MORA_4_1, `GRAPH_MORA_4_2, 8'd0,
									8'd0, 8'd0, 8'd0, 8'd0,
									8'd0, 8'd0, 8'd0, 8'd0};
			default:
				data_output = 128'd0;
		endcase
	else 
		data_output = 128'd0;
end

endmodule
