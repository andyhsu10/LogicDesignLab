`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:05:16 03/31/2015 
// Design Name: 
// Module Name:    shiftreg 
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
module shiftreg(
	led, //LED output
	mode, //multiplexer
	data, //data input
	clk, //global clock
	rst_n //active low reset
    );
	 
output [`BIT_WIDTH-1:0] led; //LED output
input mode, data, clk, rst_n; //global clock & active low reset

wire clk_d; //divided clock

//freq_div F0(.clk_out(clk_d),.clk(clk),.rst_n(rst_n));
shifter S0(.q(led),.mode(mode),.data(data),.clk(clk),.rst_n(rst_n));

endmodule
