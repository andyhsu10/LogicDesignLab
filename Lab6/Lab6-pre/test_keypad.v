`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:22:29 04/16/2015
// Design Name:   keypad_scan
// Module Name:   D:/OneDrive/LogicDesignLab/Lab6/Lab6-pre/test_keypad.v
// Project Name:  Lab6-pre
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: keypad_scan
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_keypad;

	// Inputs
	reg clk;
	reg rst_n;
	reg [3:0] col_n;

	// Outputs
	wire [3:0] row_n;
	wire [3:0] key;
	wire pressed;

	// Instantiate the Unit Under Test (UUT)
	keypad_scan uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.col_n(col_n), 
		.row_n(row_n), 
		.key(key), 
		.pressed(pressed)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 0;
		col_n = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#5 clk=1; #5 clk=0; col_n=4'b0111;
		#5 clk=1; #5 clk=0;
		#5 clk=1; #5 clk=0; rst_n=1;
		#5 clk=1; #5 clk=0;
		#5 clk=1; #5 clk=0;
		#5 clk=1; #5 clk=0;
		#5 clk=1; #5 clk=0;
		#5 clk=1; #5 clk=0;
		#5 clk=1; #5 clk=0;
		#5 clk=1; #5 clk=0; col_n=4'b1011;
		#5 clk=1; #5 clk=0;
		#5 clk=1; #5 clk=0;
		#5 clk=1; #5 clk=0;
		#5 clk=1; #5 clk=0;
		#5 clk=1; #5 clk=0;
		#5 clk=1; #5 clk=0;
		#5 clk=1; #5 clk=0;
		#5 clk=1; #5 clk=0;
		#5 clk=1; #5 clk=0; col_n=4'b1101;
		#5 clk=1; #5 clk=0;
		#5 clk=1; #5 clk=0;
		#5 clk=1; #5 clk=0;
		#5 clk=1; #5 clk=0;
		#5 clk=1; #5 clk=0;
		#5 clk=1; #5 clk=0;
		#5 clk=1; #5 clk=0;
		#5 clk=1; #5 clk=0;
		#5 clk=1; #5 clk=0; col_n=4'b1110;
		#5 clk=1; #5 clk=0;
		#5 clk=1; #5 clk=0;
		#5 clk=1; #5 clk=0;
		#5 clk=1; #5 clk=0;
		#5 clk=1; #5 clk=0;
		#5 clk=1; #5 clk=0; 
		#5 clk=1; #5 clk=0;
		#5 clk=1; #5 clk=0;

	end
      
endmodule

