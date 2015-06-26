`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:56:05 06/25/2015 
// Design Name: 
// Module Name:    rand_00_to_99 
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
module rand_00_to_99(
	clk,//100HZ
	rst_n,
	key,
	pressed,
	rand_out,
	point_out
);

input clk;
input rst_n;
input [3:0]key;
input pressed;

output point_out;
output [6:0]rand_out;

reg point_out_t;
reg [6:0]out_tmp;
reg [6:0]out;

//combinational logics
always@(out)
	out_tmp = out + 7'd1;
	 
//sequential logics: flip flops
always@(posedge clk or negedge rst_n)
	if(~rst_n)
		out <= 0;
	else if (out == 7'd99)
		out <= 0;
	else
		out <= out_tmp;


//register
wire [6:0]now, past;
reg en;
wire on_en;

one_pulse_n OPPP(
	.clk(clk),// clock input
	.rst_n(rst_n), //active low reset
	.in_trig(en), // input trigger
	.out_pulse(on_en) // output one pulse
);

store_number S_NOW(
	.clk(clk),
	.rst_n(rst_n),
	.store_en(on_en),//from fsm
	.in(out),//input
	.out(now)//output
);

store_number S_PAST(
	.clk(clk),
	.rst_n(rst_n),
	.store_en(on_en),//from fsm
	.in(now),//input
	.out(past)//output
);

assign rand_out = now;

always@*
if ( now > past && pressed && key == 4'd6 )
	begin
		en = 1'b1;
		point_out_t = 1'b1;
	end
else if (now == past && pressed && key ==4'd5 )
	begin
		en = 1'b1;
		point_out_t = 1'b1;
	end
else if (now < past && pressed && key ==4'd4 )
	begin
		en = 1'b1;
		point_out_t = 1'b1;
	end
else
	begin
		en = 1'b0;
		point_out_t = 1'b0;
	end


one_pulse ONEP_00_99(
	.clk(clk),// clock input
	.rst_n(rst_n), //active low reset
	.in_trig(point_out_t), // input trigger
	.out_pulse(point_out) // output one pulse
);



endmodule
