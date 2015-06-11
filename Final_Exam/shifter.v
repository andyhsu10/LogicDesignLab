`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:52:03 03/31/2015 
// Design Name: 
// Module Name:    shifter0 
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
`define BIT_WIDTH 4
module shifter(
	q0, //shifter output
	q1,
	q2,
	q3,
	LED1_tmp,
	LED2_tmp,
	clk, // global clock
	DIP, //DIP switch
	key, //returned pressed key
	rst_n //active low reset
    );

output reg [`BIT_WIDTH-1:0] q0, q1, q2, q3; //output
output reg [`BIT_WIDTH-1:0] LED1_tmp, LED2_tmp;
reg [`BIT_WIDTH-1:0] q4, q5, q6, q7, q8;
input clk, rst_n; //clock & global clock
input [3:0] key; //returned pressed key
input DIP; //DIP switch

//Sequential logics: Flip Flops
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		begin
			q0 <= 4'd0;
			q1 <= 4'd0;
			q2 <= 4'd0;
			q3 <= 4'd0;
			q4 <= 4'd0;
			q5 <= 4'd0;
			q6 <= 4'd0;
			q7 <= 4'd0;
			q8 <= 4'd0;
		end
	else if(DIP == 1'b0)
		begin
			LED1_tmp = q0;
			LED2_tmp = key;
			q0 <= key;
			q1 <= q0;
			q2 <= q1;
			q3 <= q2;
			q4 <= q3;
			q5 <= q4;
			q6 <= q5;
			q7 <= q6;
			q8 <= q7;
		end
	else
		begin
			q0 <= q8;
			q1 <= q0;
			q2 <= q1;
			q3 <= q2;
			q4 <= q3;
			q5 <= q4;
			q6 <= q5;
			q7 <= q6;
			q8 <= q7;
		end
endmodule
