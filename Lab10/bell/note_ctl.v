`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu
// 
// Create Date:    04:24:12 05/22/2015 
// Module Name:    note_ctl 
// Project Name:   Lab10-2
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module note_ctl(
	carry, //carryout to enable counting in next stage (O)
	note_div, //div for note generation (O)
	letter1, //letter 1 output  (O)
	letter2, //letter 2 output (O)
	clk, //global clock (I)
	q, //music input (I)
	rst_n //active low reset
);

//I/Os
output carry; //carryout to enable counting in next stage
output [5:0] letter1; //letter 1 output
output [5:0] letter2; //letter 2 output
output [19:0] note_div; //div for note generation
input clk; //global clock
input rst_n; //active low reset
input [9:0] q; //music input

reg carry;
reg [3:0] note;
reg [5:0] value; //counter value (in always block)
reg [5:0] value_tmp; //input to dff (in always block)
reg [5:0] letter1; //letter 1 output
reg [5:0] letter2; //letter 2 output
reg [19:0] note_div; //div for note generation

//Combinational logics
always @(value)
	value_tmp = value + 1'b1;

//Sequential lodics: Flip flops
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		begin
			value <= 6'd0;
			carry = 1'b0;
		end
	else if(value == q[9:4])
		begin
			value <= 6'd0;
			carry = 1'b1;
		end
	else if(value >= (q[9:4]-1'd1))
		begin
			note = 4'd0;
			value <= value_tmp;
			carry = 1'b0;
		end
	else
		begin
			note = q[3:0];
			value <= value_tmp;
			carry = 1'b0;
		end

//Note decision
always @*
	case(note)
		4'd0:
			begin
			 	note_div = `NA;
			 	letter1 = 6'd26;
			 	letter2 = 6'd26;
			end
		4'd1:
			begin
			 	note_div = `B3;
			 	letter1 = 6'd18;
				letter2 = 6'd8;
			end
		4'd2:
			begin
			 	note_div = `D4;
			 	letter1 = 6'd17;
				letter2 = 6'd4;
			end
		4'd3:
			begin
			 	note_div = `E4;
			 	letter1 = 6'd12;
				letter2 = 6'd8;
			end
		4'd4:
			begin
			 	note_div = `F4_;
			 	letter1 = 6'd5;
				letter2 = 6'd0;
			end
		4'd5:
			begin
			 	note_div = `G4;
			 	letter1 = 6'd18;
				letter2 = 6'd14;
			end
		4'd6:
			begin
			 	note_div = `A4;
			 	letter1 = 6'd11;
				letter2 = 6'd0;
			end
		4'd7:
			begin
			 	note_div = `B4;
			 	letter1 = 6'd18;
				letter2 = 6'd8;
			end
		4'd8:
			begin
			 	note_div = `C5;
			 	letter1 = 6'd3;
				letter2 = 6'd14;
			end
		4'd9:
			begin
			 	note_div = `D5;
			 	letter1 = 6'd17;
				letter2 = 6'd4;
			end

	endcase
	
endmodule
