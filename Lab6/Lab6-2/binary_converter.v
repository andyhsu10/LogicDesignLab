`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:58:14 04/16/2015 
// Design Name: 
// Module Name:    binary_converter 
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
module binary_converter(
	answer_unit, //answer unit digit output
	answer_tens, //answer tens digit output
	answer_in, //answer input
	rst_n //low active reset
);

//I/Os
input rst_n; //low active reset
input [4:0] answer_in; //answer input
output reg [3:0] answer_unit, answer_tens; //answer BCD output
reg [4:0] answer_tmp;

always @*
	if(~rst_n)
		begin
			answer_unit = 4'd0;
			answer_tens = 4'd0;
			answer_tmp = 5'd0;
		end
	else if(answer_in > 5'd9)
		begin
			answer_tmp = answer_in + 5'd6;
			answer_tens = {3'd0, answer_tmp[4]};
			answer_unit = answer_tmp[3:0];
		end
	else
		begin
			answer_tmp = answer_in;
			answer_tens = {3'd0, answer_tmp[4]};
			answer_unit = answer_tmp[3:0];
		end

endmodule
