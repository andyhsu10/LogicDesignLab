`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:09:24 04/11/2015 
// Design Name: 
// Module Name:    down_cnt_30sec 
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
`define BCD_NINE 4'd9
`define BCD_ZERO 4'd0
module down_cnt_30sec(
	display,
	control,
	ini_val,
	clk,
	rst_n
    );
	 
output [14:0] display;
output [3:0] control;
input [3:0] ini_val;
input clk, rst_n;
wire br0, w1;
wire [1:0] w2;
wire [3:0] w3, w4, w5;
reg decrease;

freq_div F(.clk_out(w1),.clk_ctl(w2),.clk(clk),.rst_n(rst_n));

down_cnt digit0(.value(w3),.borrow(br0),.clk(w1),.rst_n(rst_n),.decrease(decrease),.limit(`BCD_NINE),.ini(`BCD_ZERO));
down_cnt digit1(.value(w4),.clk(w1),.rst_n(rst_n),.decrease(br0),.limit(ini_val),.ini(ini_val));
always @*
	if(w3==4'd0 && w4==4'd0)
		decrease = 1'd0;
	else
		decrease = 1'd1;

scan_ctl SC(.display0(w3),.display1(w4),.clk_ctl(w2),.ctl(control),.out(w5));
bcd_display BD(.display(display),.bcd(w5)); 

endmodule
