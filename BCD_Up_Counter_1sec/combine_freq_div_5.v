`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:34:57 03/23/2015 
// Design Name: 
// Module Name:    combine_freq_div_5 
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
module combine_freq_div_5(
	clk_out,
	clk,
	rst_n
    );

output clk_out;
input clk, rst_n;
wire [4:0] w;

freq_div_5 FF1(.clk_out(w[0]),.clk(clk),.rst_n(rst_n));
freq_div_5 FF2(.clk_out(w[1]),.clk(w[0]),.rst_n(rst_n));
freq_div_5 FF3(.clk_out(w[2]),.clk(w[1]),.rst_n(rst_n));
freq_div_5 FF4(.clk_out(w[3]),.clk(w[2]),.rst_n(rst_n));
freq_div_5 FF5(.clk_out(w[4]),.clk(w[3]),.rst_n(rst_n));
freq_div_5 FF6(.clk_out(clk_out),.clk(w[4]),.rst_n(rst_n));

endmodule
