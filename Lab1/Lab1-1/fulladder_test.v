`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:48:18 03/05/2015
// Design Name:   fulladder
// Module Name:   F:/College/LogicDesignLab/Lab1-2/fulladder_test.v
// Project Name:  Lab1-2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fulladder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fulladder_test;

	// Inputs
	reg a;
	reg b;
	reg ci;

	// Outputs
	wire co;
	wire s;

	// Instantiate the Unit Under Test (UUT)
	fulladder uut (
		.co(co), 
		.s(s), 
		.a(a), 
		.b(b), 
		.ci(ci)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		ci = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		#100 a=1;
		#100 a=0; b=1;
		#100 a=1;
		#100 a=0; b=0; ci=1;
		#100 a=1;
		#100 a=0; b=1;
		#100 a=1;
        
		// Add stimulus here

	end
      
endmodule

