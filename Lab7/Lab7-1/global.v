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

//Up Counter
`define ENABLED 1'b1
`define DISABLED 1'b0
`define INCREMENT 1'b1
`define BCD_ZERO 4'd0
`define BCD_ONE 4'd1
`define BCD_TWO 4'd2
`define BCD_THREE 4'd3
`define BCD_FOUR 4'd4
`define BCD_FIVE 4'd5
`define BCD_SIX 4'd6
`define BCD_NINE 4'd9

//Clock Generator
`define DIV_BY_20M 20_000_000
`define DIV_BY_20M_BIT_WIDTH 25
`define DIV_BY_200K 200_000
`define DIV_BY_200K_BIT_WIDTH 18

//fsm
`define STAT_12_ONE 2'd0
`define STAT_12_TWO 2'd1
`define STAT_24_ONE 2'd2
`define STAT_24_TWO 2'd3

//letter
`define LETTER_A 4'd10
`define LETTER_P 4'd11
`define LETTER_M 4'd12
