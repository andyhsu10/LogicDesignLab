`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:27:40 04/09/2015 
// Design Name: 
// Module Name:    fsm 
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
`define STAT_ADDEND 2'd0
`define STAT_AUGEND 2'd1
`define STAT_EQUAL 2'd2
`define DISABLED 1'b0
`define ENABLED 1'b1
module fsm(
	num_enable1, //number storage enabled 1
	num_enable2, //number storage enabled 2
	ans_enable, //answer enable
	in, //input control
	clk, //global clock signal
	rst_n //low active reset
);

output num_enable1; //number storage enabled 1
output num_enable2; //number storage enabled 2
output ans_enable; //answer enable
input clk; //global signal input
input rst_n; //low active reset
input in; //input control

reg num_enable1; //number storage enabled 1
reg num_enable2; //number storage enabled 2 
reg ans_enable; //answer enable
reg [1:0] state; //state of FSM
reg [1:0] next_state; //next state of FSM

//FSM state transition
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		state <= 2'd0;
	else
		state <= next_state;                                      

//FSM state decision
always @*
	case(state)
		`STAT_ADDEND:
			if(~in)
				begin
					next_state = `STAT_AUGEND;
					num_enable1 = `DISABLED;
					num_enable2 = `ENABLED;
					ans_enable = `DISABLED;
				end
			else
				begin
					next_state = `STAT_ADDEND;
					num_enable1 = `ENABLED;
					num_enable2 = `DISABLED;
					ans_enable = `DISABLED;
				end
		`STAT_AUGEND:
			if(~in)
				begin
					next_state = `STAT_EQUAL;
					num_enable1 = `DISABLED;
					num_enable2 = `DISABLED;
					ans_enable = `ENABLED;
				end
			else
				begin
					next_state = `STAT_AUGEND;
					num_enable1 = `DISABLED;
					num_enable2 = `ENABLED;
					ans_enable = `DISABLED;
				end
		`STAT_EQUAL:
			begin
				next_state = `STAT_EQUAL;
				num_enable1 = `DISABLED;
				num_enable2 = `DISABLED;
				ans_enable = `ENABLED;
			end
		default:
			begin
				next_state = `STAT_ADDEND;
				num_enable1 = `ENABLED;
				num_enable2 = `DISABLED;
				ans_enable = `DISABLED;
			end
	endcase
endmodule