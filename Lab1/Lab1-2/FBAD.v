`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:59:11 03/05/2015 
// Design Name: 
// Module Name:    FBAD 
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
module FBAD(result,s,co,cout,a,b,ci);
output [3:0] result, s;
output co, cout;
input [3:0] a, b;
input ci;
wire t0, t1, t2, t3, t4, t5;
wire a1, a2;

fulladder F0(.a(a[0]),.b(b[0]),.ci(ci),.s(s[0]),.co(t0));
fulladder F1(.a(a[1]),.b(b[1]),.ci(t0),.s(s[1]),.co(t1));
fulladder F2(.a(a[2]),.b(b[2]),.ci(t1),.s(s[2]),.co(t2));
fulladder F3(.a(a[3]),.b(b[3]),.ci(t2),.s(s[3]),.co(co));

assign a1 = s[3] & s[2];
assign a2 = s[3] & s[1];
assign cout = co | a1 | a2;

fulladder F4(.a(s[0]),.b(0),.ci(0),.s(result[0]),.co(t3));
fulladder F5(.a(s[1]),.b(cout),.ci(t3),.s(result[1]),.co(t4));
fulladder F6(.a(s[2]),.b(cout),.ci(t4),.s(result[2]),.co(t5));
fulladder F7(.a(s[3]),.b(0),.ci(t5),.s(result[3]));

endmodule
