`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:14:40 04/01/2015
// Design Name:   shiftreg
// Module Name:   D:/OneDrive/LogicDesignLab/Lab4/Lab4-pre/test_shiftreg.v
// Project Name:  Lab4-pre
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shiftreg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_shiftreg;

	// Inputs
	reg mode;
	reg data;
	reg clk;
	reg rst_n;

	// Outputs
	wire [7:0] led;

	// Instantiate the Unit Under Test (UUT)
	shiftreg uut (
		.led(led), 
		.mode(mode), 
		.data(data), 
		.clk(clk), 
		.rst_n(rst_n)
	);

	initial begin
		// Initialize Inputs
		mode = 0;
		data = 0;
		clk = 0;
		rst_n = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		#10 mode=1; clk=1; rst_n=1;
		#10 clk=0; rst_n=0;
		#10 clk=1;
		#10 clk=0;
		#10 clk=1;
		#10 clk=0; rst_n=1;
		#10 clk=1;
		#10 clk=0;
		#10 clk=1;
		#10 clk=0;
		#10 clk=1;
		#10 clk=0;
		#10 clk=1;
		#10 clk=0;
		#10 clk=1;
		#10 clk=0;
		#10 mode=0; clk=1;
		#10 clk=0;
		#10 clk=1;
		#10 clk=0;
		#10 clk=1;
		#10 clk=0;
		#10 clk=1;
		#10 clk=0; data=1;
		#10 clk=1;
		#10 clk=0;
		#10 clk=1;
		#10 clk=0;
		#10 clk=1; data=0;
		#10 clk=0;
		#10 clk=1;
		#10 clk=0;
        
		// Add stimulus here

	end
      
endmodule

