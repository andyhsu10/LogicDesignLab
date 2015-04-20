`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:44:33 03/11/2015 
// Design Name: 
// Module Name:    Decoder2_4 
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
module Decoder2_4(d, E, in);
output [3:0] d;
input E;
input [1:0] in;

assign d[0]=E & (~in[1]) & (~in[0]);
assign d[1]=E & (~in[1]) & (in[0]);
assign d[2]=E & (in[1]) & (~in[0]);
assign d[3]=E & (in[1]) & (in[0]);

endmodule
