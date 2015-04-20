`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:42:43 04/20/2015 
// Design Name: 
// Module Name:    fsm_num_store 
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
`define STAT_UNIT 2'd0
`define STAT_TENS 2'd1
`define STAT_PAUSE 2'd2
`define DISABLED 1'b0
`define ENABLED 1'b1
module fsm_num_store(
	state, //number memory state check
	store_enable1,
	store_enable2,
	pressed, //button pressed input
	enable, //enable
	clk, //clock input
	rst_n //low active reset
);

output [1:0] state; //number memory state output
output store_enable1, store_enable2;
input pressed; //button pressed input
input enable;
input clk;
input rst_n; //low active reset

reg [1:0] state; //number memory state
reg [1:0] next_state; //number memory next state
reg store_enable1, store_enable2;

//FSM state transition
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		state <= 2'd0;
	else
		state <= next_state;

//FSM state decision
always @*
	case(state)
		`STAT_UNIT:
			if(pressed && enable)
				begin
					next_state = `STAT_TENS;
					store_enable1 = `DISABLED;
					store_enable2 = `ENABLED;
				end	
			else
				begin
					next_state = `STAT_UNIT;
					store_enable1 = `ENABLED;
					store_enable2 = `DISABLED;
				end
		`STAT_TENS:
			if(pressed && enable)
				begin
					next_state = `STAT_PAUSE;
					store_enable1 = `DISABLED;
					store_enable2 = `DISABLED;
				end
			else
				begin
					next_state = `STAT_TENS;
					store_enable1 = `DISABLED;
					store_enable2 = `ENABLED;
				end
		`STAT_PAUSE:
			begin
					next_state = `STAT_PAUSE;
					store_enable1 = `DISABLED;
					store_enable2 = `DISABLED;
			end
		default:
			begin
				next_state = `STAT_UNIT;
				store_enable1 = `DISABLED;
				store_enable2 = `DISABLED;
			end
	endcase

endmodule
