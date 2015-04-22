`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:11:50 04/22/2015 
// Design Name: 
// Module Name:    multiplier 
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
module multiplier(
	a,
	b,
	c
);

//I/Os
output [7:0] c; //answer output
input [3:0] a, b;

wire cout1, cout2, cout3;
wire [3:0] b0, b1, b2, b3;
wire [3:0] sout1, sout2, sout3;

assign b0[0] = a[0] & b[0];
assign b0[1] = a[1] & b[0];
assign b0[2] = a[2] & b[0];
assign b0[3] = a[3] & b[0];

assign b1[0] = a[0] & b[1];
assign b1[1] = a[1] & b[1];
assign b1[2] = a[2] & b[1];
assign b1[3] = a[3] & b[1];

assign b2[0] = a[0] & b[2];
assign b2[1] = a[1] & b[2];
assign b2[2] = a[2] & b[2];
assign b2[3] = a[3] & b[2];

assign b3[0] = a[0] & b[3];
assign b3[1] = a[1] & b[3];
assign b3[2] = a[2] & b[3];
assign b3[3] = a[3] & b[3];

four_bits_adder_carry FBA0(
	.result(sout1), //answer output
	.cout(cout1), //carry out output
	.a({1'b0,b0[3:1]}), //addend input
	.b(b1), //augend input
	.ci(1'b0) //carry in
);

four_bits_adder_carry FBA1(
	.result(sout2), //answer output
	.cout(cout2), //carry out output
	.a({cout1,sout1[3:1]}), //addend input
	.b(b2), //augend input
	.ci(1'b0) //carry in
);

four_bits_adder_carry FBA2(
	.result(sout3), //answer output
	.cout(cout3), //carry out output
	.a({cout2,sout2[3:1]}), //addend input
	.b(b3), //augend input
	.ci(1'b0) //carry in
);

assign c[0] = b0[0];
assign c[1] = sout1[0];
assign c[2] = sout2[0];
assign c[7:3] = {cout3, sout3};

endmodule
