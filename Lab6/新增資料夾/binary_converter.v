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
	answer_in, //binary answer input
	answer_unit, //answer unit digit output
	answer_tens, //answer tens digit output
	answer_hund //answer hundreds digit output
);

//I/Os
input [7:0] answer_in; //answer input
output reg [3:0] answer_unit; //answer unit digit output
output reg [3:0] answer_tens; //answer tens digit output
output reg [3:0] answer_hund; //answer hundreds digit output
reg [3:0] unit_tmp; //temp unit digit
reg [3:0] tens_tmp; //temp tens digit
reg [3:0] hund_tmp; //temp hundreds digit
wire [3:0] c1,c2,c3,c4,c5,c6,c7;
wire [3:0] d1,d2,d3,d4,d5,d6,d7;

//Calculations
assign d1 = {1'b0,answer_in[7:5]};
assign d2 = {c1[2:0],answer_in[4]};
assign d3 = {c2[2:0],answer_in[3]};
assign d4 = {c3[2:0],answer_in[2]};
assign d5 = {c4[2:0],answer_in[1]};
assign d6 = {1'b0,c1[3],c2[3],c3[3]};
assign d7 = {c6[2:0],c4[3]};

add3 m1(d1,c1);
add3 m2(d2,c2);
add3 m3(d3,c3);
add3 m4(d4,c4);
add3 m5(d5,c5);
add3 m6(d6,c6);
add3 m7(d7,c7);

always @*
	begin
		unit_tmp = {c5[2:0],answer_in[0]};
		tens_tmp = {c7[2:0],c5[3]};
		hund_tmp = {2'd0,c6[3],c7[3]};
	end

always @*
	if(tens_tmp == 4'd0 && hund_tmp == 4'd0)
		begin
			answer_unit = unit_tmp;
			answer_tens = 4'd15;
			answer_hund = 4'd15;
		end
	else if(hund_tmp == 4'd0)
		begin
			answer_unit = unit_tmp;
			answer_tens = tens_tmp;
			answer_hund = 4'd15;
		end
	else
		begin
			answer_unit = unit_tmp;
			answer_tens = tens_tmp;
			answer_hund = hund_tmp;
		end

endmodule