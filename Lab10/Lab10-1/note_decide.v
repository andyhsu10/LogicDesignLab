`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu
// 
// Create Date:    18:56:50 05/21/2015 
// Module Name:    note_decide 
// Project Name:   Lab10-1
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
`define BIT_WIDTH 4
module note_decide(
	note_div, //div for note generation (O)
	clk, //global clock (I)
	rst_n //active low reset
);

//I/Os
output [19:0] note_div; //div for note generation
input clk; //global clock
input rst_n; //active low reset

reg [`BIT_WIDTH-1:0] value; //counter value (in always block)
reg [`BIT_WIDTH-1:0] value_tmp; //input to dff (in always block)
reg [19:0] note_div; //div for note generation

//Combinational logics
always @(value)
	value_tmp = value + 1'b1;

//Sequential lodics: Flip flops
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		value <= 4'd0;
	else
		value <= value_tmp;

//Note decision
always @*
	case(value)
		`BIT_WIDTH'd0: note_div = `A3;
		`BIT_WIDTH'd1: note_div = `B3;
		`BIT_WIDTH'd2: note_div = `C4;
		`BIT_WIDTH'd3: note_div = `D4;
		`BIT_WIDTH'd4: note_div = `E4;
		`BIT_WIDTH'd5: note_div = `F4;
		`BIT_WIDTH'd6: note_div = `G4;
		`BIT_WIDTH'd7: note_div = `A4;
		`BIT_WIDTH'd8: note_div = `B4;
		`BIT_WIDTH'd9: note_div = `C5;
		`BIT_WIDTH'd10: note_div = `D5;
		`BIT_WIDTH'd11: note_div = `E5;
		`BIT_WIDTH'd12: note_div = `F5;
		`BIT_WIDTH'd13: note_div = `G5;
		`BIT_WIDTH'd14: note_div = `A5;
		`BIT_WIDTH'd15: note_div = `B5;
	endcase
	
endmodule
