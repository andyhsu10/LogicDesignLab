`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:47:32 03/11/2015
// Design Name:   Decoder2_4
// Module Name:   I:/College/LogicDesignLab/Lab1-3/testdecoder.v
// Project Name:  Lab1-3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Decoder2_4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testdecoder;

	// Inputs
	reg E;
	reg [1:0] in;

	// Outputs
	wire [3:0] d;

	// Instantiate the Unit Under Test (UUT)
	Decoder2_4 uut (
		.d(d), 
		.E(E), 
		.in(in)
	);

	initial begin
		// Initialize Inputs
		E = 0;
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
		#100 E=0; in=2'b10;
		#100 E=1; in=2'b00;
		#100 in=2'b01;
		#100 in=2'b10;
		#100 in=2'b11;
        
		// Add stimulus here

	end
      
endmodule

