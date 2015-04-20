`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:40:13 03/20/2015 
// Design Name: 
// Module Name:    bcd_cnt 
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
`define BUC_BIT_WIDTH 4
module bcd_cnt(
	out0, //output 1
	out1, //output 2
	led, //LED
	clk, //clock
	pause, //ause
	rst_n //active low reset
    );

output[`BUC_BIT_WIDTH-1:0] out0, out1; //counter output
output reg [15:0] led;
input clk; //clock
input pause; //pause
input rst_n; //active low reset

reg[`BUC_BIT_WIDTH-1:0] out0; //counter output (in always block)
reg[`BUC_BIT_WIDTH-1:0] out0_tmp; //input to dff (in always block)
reg[`BUC_BIT_WIDTH-1:0] out1; //counter output (in always block)
reg[`BUC_BIT_WIDTH-1:0] out1_tmp; //input to dff (in always block)

//Combinational logic
always @(out0)
	out0_tmp = out0 - 1'b1;
always @(out1)
	out1_tmp = out1 - 1'b1;
	
//Sequential lodics: Flip flops
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		begin
			out0 <= 4'b0;
			out1 <= 4'd3;
			led = 16'd0;
		end
	else if(~pause)
			out0 <= out0;
	else if(out0 == 4'd0 & out1 == 4'd0)
		begin
			out0 <= out0;
			out1 <= out1;
			led = 16'd65535;
		end
	else if(out0 == 4'd0)
		begin
			out0 <= 4'd9;
			out1 <= out1_tmp;
		end
	else
		 out0 <= out0_tmp;
	
endmodule
