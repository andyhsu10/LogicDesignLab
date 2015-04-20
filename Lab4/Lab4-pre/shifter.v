`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:52:03 03/31/2015 
// Design Name: 
// Module Name:    shifter 
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
`define BIT_WIDTH 8
module shifter(
	q, //shifter output
	mode,
	data,
	clk, // global clock
	rst_n //active low reset
    );

output reg [`BIT_WIDTH-1:0] q; //output
input mode, data, clk, rst_n; //clock & global clock

//Sequential logics: Flip Flops
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		q <= `BIT_WIDTH'b01010101; //initial value 01010101
	else if(mode == 1)
		begin
			q[7] <= q[0];
			q[6] <= q[7];
			q[5] <= q[6];
			q[4] <= q[5];
			q[3] <= q[4];
			q[2] <= q[3];
			q[1] <= q[2];
			q[0] <= q[1];
		end
	else
		begin
			q[7] <= data;
			q[6] <= q[7];
			q[5] <= q[6];
			q[4] <= q[5];
			q[3] <= q[4];
			q[2] <= q[3];
			q[1] <= q[2];
			q[0] <= q[1];
		end

endmodule
