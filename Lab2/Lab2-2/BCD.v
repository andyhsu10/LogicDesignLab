`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:08:02 03/16/2015 
// Design Name: 
// Module Name:    BCD 
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
module BCD(
	display, //14-segment display
	led, //LED
	bcd //BCD
    );

output [14:0] display;
output [3:0] led;
input [3:0] bcd;

reg [14:0] display;
reg [3:0] led;

//Combinational logics:
always @(bcd)
	case (bcd)
		4'd0:
			begin
			display = 15'b0000_0011_1111_111; //0
			led = 4'b0000;
			end
		4'd1:
			begin
			display = 15'b1111_1111_1011_011; //1
			led = 4'b0001;
			end
		4'd2:
			begin
			display = 15'b0010_0100_1111_111; //2
			led = 4'b0010;
			end
		4'd3:
			begin
			display = 15'b0000_1100_1111_111; //3
			led = 4'b0011;
			end
		4'd4:
			begin
			display = 15'b1001_1000_1111_111; //4
			led = 4'b0100;
			end
		4'd5:
			begin
			display = 15'b0100_1000_1111_111; //5
			led = 4'b0101;
			end
		4'd6:
			begin
			display = 15'b0100_0000_1111_111; //6
			led = 4'b0110;
			end
		4'd7:
			begin
			display = 15'b0001_1111_1111_111; //7
			led = 4'b0111;
			end
		4'd8:
			begin
			display = 15'b0000_0000_1111_111; //8
			led = 4'b1000;
			end
		4'd9:
			begin
			display = 15'b0000_1000_1111_111; //9
			led = 4'b1001;
			end
		4'd10:
			begin
			display = 15'b0111_0000_1111_111; //F
			led = 4'b1010;
			end
		4'd11:
			begin
			display = 15'b0111_0000_1111_111; //F
			led = 4'b1011;
			end
		4'd12:
			begin
			display = 15'b0111_0000_1111_111; //F
			led = 4'b1100;
			end
		4'd13:
			begin
			display = 15'b0111_0000_1111_111; //F
			led = 4'b1101;
			end
		4'd14:
			begin
			display = 15'b0111_0000_1111_111; //F
			led = 4'b1110;
			end
		4'd15:
			begin
			display = 15'b0111_0000_1111_111; //F
			led = 4'b1111;
			end
	endcase

endmodule
