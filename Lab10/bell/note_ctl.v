`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu
// 
// Create Date:    04:24:12 05/22/2015 
// Module Name:    note_ctl 
// Project Name:   Lab10-2
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module note_ctl(
	carry, //carryout to enable counting in next stage (O)
	note_div, //div for note generation (O)
	letter1, //letter 1 output  (O)
	letter2, //letter 2 output (O)
	clk, //global clock (I)
	q, //music input (I)
	rst_n //active low reset
);

//I/Os
output carry; //carryout to enable counting in next stage
output [5:0] letter1; //letter 1 output
output [5:0] letter2; //letter 2 output
output [19:0] note_div; //div for note generation
input clk; //global clock
input rst_n; //active low reset
input [9:0] q; //music input

reg carry;
reg [5:0] note;
reg [5:0] beat;
reg [5:0] value; //counter value (in always block)
reg [5:0] value_tmp; //input to dff (in always block)
reg [5:0] letter1; //letter 1 output
reg [5:0] letter2; //letter 2 output
reg [19:0] note_div; //div for note generation

//Combinational logics
always @(value)
	value_tmp = value + 1'b1;

//Sequential lodics: Flip flops
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		begin
			note = 6'd0;
			value <= 6'd0;
			carry = 1'b0;
		end
	else if((value == beat) && (q[9] == `LIG_FALSE))
		begin
			note = 6'd0;
			value <= 6'd0;
			carry = 1'b1;
		end
	else if((value == beat) && (q[9] == `LIG_TRUE))
		begin
			note = q[5:0];
			value <= 6'd0;
			carry = 1'b1;
		end
	else
		begin
			note = q[5:0];
			value <= value_tmp;
			carry = 1'b0;
		end

//Beat decision
always @*
	case(q[8:6])
		`BEAT_0_25: beat = 6'd3;
		`BEAT_0_3: beat = 6'd5;
		`BEAT_0_5: beat = 6'd7;
		`BEAT_1: beat = 6'd15;
		`BEAT_1_5: beat = 6'd23;
		`BEAT_2: beat = 6'd31;
		`BEAT_3: beat = 6'd47;
		`BEAT_4: beat = 6'd63;
	endcase

//Note decision
always @*
	case(note)
		`ENCODE_NA:
			begin
			 	note_div = `NA;
			 	letter1 = 6'd26;
			 	letter2 = 6'd26;
			end
		`ENCODE_C3:
			begin
				note_div = `C3;
				letter1 = 6'd3;
				letter2 = 6'd14;
			end
		`ENCODE_C3_:
			begin
				note_div = `C3_;
				letter1 = 6'd3;
				letter2 = 6'd14;
			end
		`ENCODE_D3:
			begin
				note_div = `D3;
				letter1 = 6'd17;
				letter2 = 6'd4;
			end
		`ENCODE_D3_:
			begin
				note_div = `D3_;
				letter1 = 6'd17;
				letter2 = 6'd4;
			end
		`ENCODE_E3:
			begin
				note_div = `E3;
				letter1 = 6'd12;
				letter2 = 6'd8;
			end
		`ENCODE_F3:
			begin
				note_div = `F3;
				letter1 = 6'd5;
				letter2 = 6'd0;
			end
		`ENCODE_F3_:
			begin
				note_div = `F3_;
				letter1 = 6'd5;
				letter2 = 6'd0;
			end
		`ENCODE_G3:
			begin
				note_div = `G3;
				letter1 = 6'd18;
				letter2 = 6'd14;
			end
		`ENCODE_G3_:
			begin
				note_div = `G3_;
				letter1 = 6'd18;
				letter2 = 6'd14;
			end
		`ENCODE_A3:
			begin
				note_div = `A3;
				letter1 = 6'd11;
				letter2 = 6'd0;
			end
		`ENCODE_A3_:
			begin
				note_div = `A3_;
				letter1 = 6'd11;
				letter2 = 6'd0;
			end
		`ENCODE_B3:
			begin
				note_div = `B3;
				letter1 = 6'd18;
				letter2 = 6'd8;
			end
		`ENCODE_C4:
			begin
				note_div = `C4;
				letter1 = 6'd3;
				letter2 = 6'd14;
			end
		`ENCODE_C4_:
			begin
				note_div = `C4_;
				letter1 = 6'd3;
				letter2 = 6'd14;
			end
		`ENCODE_D4:
			begin
				note_div = `D4;
				letter1 = 6'd17;
				letter2 = 6'd4;
			end
		`ENCODE_D4_:
			begin
				note_div = `D4_;
				letter1 = 6'd17;
				letter2 = 6'd4;
			end
		`ENCODE_E4:
			begin
				note_div = `E4;
				letter1 = 6'd12;
				letter2 = 6'd8;
			end
		`ENCODE_F4:
			begin
				note_div = `F4;
				letter1 = 6'd5;
				letter2 = 6'd0;
			end
		`ENCODE_F4_:
			begin
				note_div = `F4_;
				letter1 = 6'd5;
				letter2 = 6'd0;
			end
		`ENCODE_G4:
			begin
				note_div = `G4;
				letter1 = 6'd18;
				letter2 = 6'd14;
			end
		`ENCODE_G4_:
			begin
				note_div = `G4_;
				letter1 = 6'd18;
				letter2 = 6'd14;
			end
		`ENCODE_A4:
			begin
				note_div = `A4;
				letter1 = 6'd11;
				letter2 = 6'd0;
			end
		`ENCODE_A4_:
			begin
				note_div = `A4_;
				letter1 = 6'd11;
				letter2 = 6'd0;
			end
		`ENCODE_B4:
			begin
				note_div = `B4;
				letter1 = 6'd18;
				letter2 = 6'd8;
			end
		`ENCODE_C5:
			begin
				note_div = `C5;
				letter1 = 6'd3;
				letter2 = 6'd14;
			end
		`ENCODE_C5_:
			begin
				note_div = `C5_;
				letter1 = 6'd3;
				letter2 = 6'd14;
			end
		`ENCODE_D5:
			begin
				note_div = `D5;
				letter1 = 6'd17;
				letter2 = 6'd4;
			end
		`ENCODE_D5_:
			begin
				note_div = `D5_;
				letter1 = 6'd17;
				letter2 = 6'd4;
			end
		`ENCODE_E5:
			begin
				note_div = `E5;
				letter1 = 6'd12;
				letter2 = 6'd8;
			end
		`ENCODE_F5:
			begin
				note_div = `F5;
				letter1 = 6'd5;
				letter2 = 6'd0;
			end
		`ENCODE_F5_:
			begin
				note_div = `F5_;
				letter1 = 6'd5;
				letter2 = 6'd0;
			end
		`ENCODE_G5:
			begin
				note_div = `G5;
				letter1 = 6'd18;
				letter2 = 6'd14;
			end
		`ENCODE_G5_:
			begin
				note_div = `G5_;
				letter1 = 6'd18;
				letter2 = 6'd14;
			end
		`ENCODE_A5:
			begin
				note_div = `A5;
				letter1 = 6'd11;
				letter2 = 6'd0;
			end
		`ENCODE_A5_:
			begin
				note_div = `A5_;
				letter1 = 6'd11;
				letter2 = 6'd0;
			end
		`ENCODE_B5:
			begin
				note_div = `B5;
				letter1 = 6'd18;
				letter2 = 6'd8;
			end
	endcase
	
endmodule
