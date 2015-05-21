`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:44:31 04/18/2015 
// Design Name: 
// Module Name:    debounce_one_pulse 
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
module debounce_one_pulse(
	de_clk, //debounce clock (I)
	pulse_clk, //one pulse clock (I)
	rst_n, //low active reset (I)
	in, //push button input (I)
	out //pulsed push button output (O)
);

//I/Os
input de_clk, pulse_clk, rst_n, in;
output out; //debounced push button output
wire debounced;

debounce debounce(
	.clk(de_clk),
	.rst_n(rst_n),
	.pb_in(in),
	.pb_debounced(debounced)
);

one_pulse pulse(
	.clk(pulse_clk),
	.rst_n(rst_n),
	.in_trig(debounced),
	.out_pulse(out)
);

endmodule
