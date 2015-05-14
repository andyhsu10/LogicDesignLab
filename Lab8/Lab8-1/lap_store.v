`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:53 05/14/2015 
// Design Name: 
// Module Name:    lap_store 
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
`define BCD_BIT_WIDTH 4
module lap_store(
	bcd_out1, //bcd number 1 (O)
	bcd_out2, //bcd number 2 (O)
	bcd_out3, //bcd number 3 (O)
	bcd_out4, //bcd number 4 (O)
	bcd_in1, //bcd number 1 (I)
	bcd_in2, //bcd number 2 (I)
	bcd_in3, //bcd number 3 (I)
	bcd_in4, //bcd number 4 (I)
	state, //state (I)
	clk, //global clock (I)
	rst_n //active low reset
);

output [`BCD_BIT_WIDTH-1:0] bcd_out1, bcd_out2, bcd_out3, bcd_out4; //bcd number output
input [`BCD_BIT_WIDTH-1:0] bcd_in1, bcd_in2, bcd_in3, bcd_in4; //bcd number input
input [1:0] state; //state
input clk; //global clock
input rst_n; //active low reset

reg [`BCD_BIT_WIDTH-1:0] bcd_out1, bcd_out2, bcd_out3, bcd_out4; //bcd number output
reg [`BCD_BIT_WIDTH-1:0] next_bcd_out1, next_bcd_out2, next_bcd_out3, next_bcd_out4; //bcd number output

always @*
	case(state)
		`STAT_START:
			begin
				next_bcd_out1 = bcd_in1;
				next_bcd_out2 = bcd_in2;
				next_bcd_out3 = bcd_in3;
				next_bcd_out4 = bcd_in4;
			end
		`STAT_STOP:
			begin
				next_bcd_out1 = bcd_in1;
				next_bcd_out2 = bcd_in2;
				next_bcd_out3 = bcd_in3;
				next_bcd_out4 = bcd_in4;
			end
		`STAT_LAP_FREEZE:
			begin
				next_bcd_out1 = bcd_out1;
				next_bcd_out2 = bcd_out2;
				next_bcd_out3 = bcd_out3;
				next_bcd_out4 = bcd_out4;
			end
		default:
			begin
				next_bcd_out1 = 4'd15;
				next_bcd_out2 = 4'd15;
				next_bcd_out3 = 4'd15;
				next_bcd_out4 = 4'd15;
			end
	endcase
	
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		begin
			bcd_out1 = `BCD_ZERO;
			bcd_out2 = `BCD_ZERO;
			bcd_out3 = `BCD_ZERO;
			bcd_out4 = `BCD_ZERO;
		end
	else
		begin
			bcd_out1 = next_bcd_out1;
			bcd_out2 = next_bcd_out2;
			bcd_out3 = next_bcd_out3;
			bcd_out4 = next_bcd_out4;
		end

endmodule
