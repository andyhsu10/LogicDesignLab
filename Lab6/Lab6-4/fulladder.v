`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:58:29 03/05/2015 
// Design Name: 
// Module Name:    fulladder 
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
module fulladder(
    output co,
    output s,
    input a,
    input b,
    input ci
    );

wire t0, t1, t2;

halfadder H0(.s(t0),.co(t1),.a(a),.b(b));
halfadder H1(.s(s),.co(t2),.a(t0),.b(ci));

assign co=t1|t2;

endmodule
