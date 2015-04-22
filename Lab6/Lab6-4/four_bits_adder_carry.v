`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:59:11 03/05/2015 
// Design Name: 
// Module Name:    four_bits_adder_carry
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
module four_bits_adder_carry(
	result, //answer output
	cout, //carry out output
	a, //addend input
	b, //augend input
	ci //carry in
);

output cout; //carry out output
output [3:0] result; //answer output
input [3:0] a, b; //addend & augend input
input ci; //carry in

wire t0, t1, t2;
wire a1, a2;

fulladder F0(.a(a[0]),.b(b[0]),.ci(ci),.s(result[0]),.co(t0));
fulladder F1(.a(a[1]),.b(b[1]),.ci(t0),.s(result[1]),.co(t1));
fulladder F2(.a(a[2]),.b(b[2]),.ci(t1),.s(result[2]),.co(t2));
fulladder F3(.a(a[3]),.b(b[3]),.ci(t2),.s(result[3]),.co(cout));

endmodule
