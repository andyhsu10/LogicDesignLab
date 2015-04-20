`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:27:35 03/16/2015 
// Design Name: 
// Module Name:    FA 
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
module FA(
   output cout,
    output s,
    input x,
    input y,
    input cin
    );
wire t0, t1, t2;

HA H0(.s(t0),.co(t1),.a(x),.b(y));
HA H1(.s(s),.co(t2),.a(t0),.b(cin));

assign cout=t1|t2;

endmodule
