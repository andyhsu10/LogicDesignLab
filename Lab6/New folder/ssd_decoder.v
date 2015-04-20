`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:36:33 03/20/2015 
// Design Name: 
// Module Name:    bcd_display 
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
module ssd_decoder(
   ssd_out, //14-segment display output
	bcd //BCD input
    );

output [14:0] ssd_out;
input [3:0] bcd;

reg [14:0] ssd_out;

//Combinational logics:
always @(bcd)
	case (bcd)
		4'd0:
			ssd_out = 15'b0000_0011_1111_111; //0
		4'd1:
			ssd_out = 15'b1001_1111_1111_111; //1
		4'd2:
			ssd_out = 15'b0010_0100_1111_111; //2
		4'd3:
			ssd_out = 15'b0000_1100_1111_111; //3
		4'd4:
			ssd_out = 15'b1001_1000_1111_111; //4
		4'd5:
			ssd_out = 15'b0100_1000_1111_111; //5
		4'd6:
			ssd_out = 15'b0100_0000_1111_111; //6
		4'd7:
			ssd_out = 15'b0001_1111_1111_111; //7
		4'd8:
			ssd_out = 15'b0000_0000_1111_111; //8
		4'd9:
			ssd_out = 15'b0000_1000_1111_111; //9
/*		4'd10:
			ssd_out = 15'b0001_0000_1111_111; //A
		4'd11:
			ssd_out = 15'b0000_1110_1011_011; //B
		4'd12:
			ssd_out = 15'b0110_0011_1111_111; //C
		4'd13:
			ssd_out = 15'b0000_1111_1011_011; //D
		4'd14:
			ssd_out = 15'b0110_0000_1111_111; //E */
		4'd15:
			ssd_out = 15'b1111_1111_1111_111; //show nothing
			//ssd_out = 15'b0111_0000_1111_111; //F
		default:
			ssd_out = 15'b1111_1111_1111_110; //.
	endcase

endmodule