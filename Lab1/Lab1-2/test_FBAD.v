`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:43:31 03/11/2015
// Design Name:   FBAD
// Module Name:   I:/College/LogicDesignLab/Lab1-2/test_FBAD.v
// Project Name:  Lab1-2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FBAD
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_FBAD;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg ci;

	// Outputs
	wire [3:0] s;
	wire [3:0] result;
	wire co;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	FBAD uut (
		.s(s), 
		.result(result), 
		.co(co), 
		.cout(cout), 
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
		
		#100 ci=1; a=4'b0001; b=4'b0110;
		#100 a=4'b0010; b=4'b0010;
		#100 ci=0; a=4'b0111; b=4'b1000;
		#100 a=4'b0011; b=4'b1000;
		#100 a=4'b0010; b=4'b0101;
		#100 ci=1; a=4'b0011; b=4'b1000;
		#100 a=4'b0010; b=4'b0101;
        
		// Add stimulus here

	end
      
endmodule

