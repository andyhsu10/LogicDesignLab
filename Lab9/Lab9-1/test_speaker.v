`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu
// 
// Create Date:    17:46:16 05/20/2015 
// Module Name:    test_speaker 
// Project Name:   Lab9-1
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
module test_speaker;
	//Inputs
	reg clk;
	reg rst_n;

	//Outputs
	wire audio_appsel;
	wire audio_sysclk;
	wire audio_bck;
	wire audio_ws;
	wire audio_data;

	//Instantiate the Unit UNder Test (UUT)
	speaker uut(
		.clk(clk),
		.rst_n(rst_n),
		.audio_appsel(audio_appsel),
		.audio_sysclk(audio_sysclk),
		.audio_bck(audio_bck),
		.audio_ws(audio_ws),
		.audio_data(audio_data)
	);

	initial begin
		//Initialize Inputs
		clk = 0;
		rst_n = 0;

		//Wait 20 ns for global reset to finish
		#20;

		//Add stimulus here
		#10 rst_n = 1;
	end

	//More stimulus here
	always
		#1 clk = ~clk;

endmodule