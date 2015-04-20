`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:04:42 03/17/2015
// Design Name:   BUC_4bit
// Module Name:   C:/Users/An-Ting/OneDrive/LogicDesignLab/Lab3/Lab3-pre/test_BUC_4bit.v
// Project Name:  Lab3-pre
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BUC_4bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_BUC_4bit;

	// Inputs
	reg clk;
	reg rst_n;

	// Outputs
	wire [3:0] out;

	// Instantiate the Unit Under Test (UUT)
	BUC_4bit uut (
		.out(out), 
		.clk(clk), 
		.rst_n(rst_n)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 0;

		// Wait 100 ns for global reset to finish
		#100;
		#10 rst_n=1;
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
		#10 clk=1;
		#10 clk=0;
        
		// Add stimulus here

	end
      
endmodule

