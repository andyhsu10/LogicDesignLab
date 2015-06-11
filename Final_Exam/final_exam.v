`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:00:00 06/11/2015 
// Design Name: 
// Module Name:    final_exam 
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
module final_exam(
	clk, //global clock input
	DIP, //DIP switch
	rst_n, //active low reset
	col_n, //pressed colume index
	row_n, //scanned row index
	control, //SSD control signal
	display, //SSD output
	LED1, //LED1
	LED2 //LED2
);

//I/Os
input clk; //global clock input
input DIP; //DIP switch
input rst_n; //active low reset
input [3:0] col_n; //pressed colume index
output [3:0] row_n; //scanned row index
output [3:0] LED1, LED2; //LEDs
output [3:0] control; //SSD control signal
output [14:0] display; //SSD ouput

reg [3:0] LED1, LED2;

wire clk_out, clk_100;
wire [1:0] clk_ctl;
wire [3:0] key;
wire [3:0] out, display0, display1, display2, display3;
wire [3:0] LED1_tmp, LED2_tmp;

freq_div frequency_divider(
	.clk_out(clk_out), //divided clock output
	.clk_ctl(clk_ctl), //divided clock output for scan freq
	.clk(clk), //global clock input
	.rst_n(rst_n) //active low reset
);

clock_generator clk_generate(
	.clk(clk), // clock from crystal
	.rst_n(rst_n), // active low reset
	.clk_100(clk_100) // generated 100 Hz clock
);

keypad_scan keypad_scanner(
	.clk(clk_100), //scan clock
	.rst_n(rst_n), //scan clock
	.col_n(col_n), //pressed column index
	.row_n(row_n), //scanned row index
	.key(key) //returned pressed key
);

shifter shift_register(
	.q0(display0), //shifter output
	.q1(display1),
	.q2(display2),
	.q3(display3),
	.LED1_tmp(LED1_tmp),
	.LED2_tmp(LED2_tmp),
	.clk(clk_out), // global clock
	.DIP(DIP), //DIP switch
	.key(key), //returned pressed key
	.rst_n(rst_n) //active low reset
);

always @*
	if(DIP == 1'b0)
		begin
			LED1 = 4'd0;
			LED2 = 4'd0;
		end
	else
		begin
			LED1 = LED1_tmp;
			LED2 = LED2_tmp;
		end

scan_ctl scan_controller(
    .clk_ctl(clk_ctl),
	.display0(display0),
	.display1(display1),
	.display2(display2),
	.display3(display3),
    .ctl(control),
    .out(out)
);

ssd_decoder decoder(
	.ssd_out(display), //14-segment display output
	.bcd(out) //BCD input
);

endmodule
