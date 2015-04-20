`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:05:36 04/15/2015 
// Design Name: 
// Module Name:    global 
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

`define KEYPAD_WIDTH 4
`define KEYPAD_PAUSE_PERIOD 4
`define KEYPAD_PRESSED 1'b1
`define KEYPAD_NOT_PRESSED 1'b0

//Key Detected
`define KEY_0 4'd0
`define KEY_1 4'd1
`define KEY_2 4'd2
`define KEY_3 4'd3
`define KEY_4 4'd4
`define KEY_5 4'd5
`define KEY_6 4'd6
`define KEY_7 4'd7
`define KEY_8 4'd8
`define KEY_9 4'd9
`define KEY_A 4'd10
`define KEY_B 4'd11
`define KEY_C 4'd12
`define KEY_D 4'd13
`define KEY_E 4'd14
`define KEY_F 4'd15

//FSM State
`define SCAN 1'b1
`define PAUSE 1'b0
