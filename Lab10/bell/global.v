`timescale 1ns / 1ps

//Up Counter
`define ENABLED 1'b1
`define DISABLED 1'b0
`define INCREMENT 1'b1
`define DECREMENT 1'b1
`define BCD_ZERO 4'd0
`define BCD_ONE 4'd1
`define BCD_TWO 4'd2
`define BCD_THREE 4'd3
`define BCD_FOUR 4'd4
`define BCD_FIVE 4'd5
`define BCD_SIX 4'd6
`define BCD_SEVEN 4'd7
`define BCD_EIGHT 4'd8
`define BCD_NINE 4'd9

//Keypad
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

//Clock Generator
`define DIV_BY_20M 20_000_000
`define DIV_BY_20M_BIT_WIDTH 25
`define DIV_BY_200K 200_000
`define DIV_BY_200K_BIT_WIDTH 18

//Volumes
`define VOL_1 16'h0000
`define VOL_2 16'h0027
`define VOL_3 16'h004E
`define VOL_4 16'h0075
`define VOL_5 16'h009C
`define VOL_6 16'h00C3
`define VOL_7 16'h00EA
`define VOL_8 16'h0111
`define VOL_9 16'h0138
`define VOL_10 16'h015F
`define VOL_11 16'h0186
`define VOL_12 16'h01AD
`define VOL_13 16'h01D4
`define VOL_14 16'h01FB
`define VOL_15 16'h0222
`define VOL_16 16'h0249

//Decode Notes
`define NA 20'd0

`define C3 20'd152894
`define C3_ 20'd144311
`define D3 20'd136212
`define D3_ 20'd128568
`define E3 20'd121352
`define F3 20'd114541
`define F3_ 20'd108108
`define G3 20'd102041
`define G3_ 20'd96316
`define A3 20'd90909
`define A3_ 20'd85807
`define B3 20'd80991

`define C4 20'd76444
`define C4_ 20'd72155
`define D4 20'd68106
`define D4_ 20'd64282
`define E4 20'd60674
`define F4 20'd57269
`define F4_ 20'd54056
`define G4 20'd51020
`define G4_ 20'd48158
`define A4 20'd45455
`define A4_ 20'd42904
`define B4 20'd40496

`define C5 20'd38223
`define C5_ 20'd36077
`define D5 20'd34052
`define D5_ 20'd32141
`define E5 20'd30337
`define F5 20'd28634
`define F5_ 20'd27027
`define G5 20'd25511
`define G5_ 20'd24079
`define A5 20'd22727
`define A5_ 20'd21452
`define B5 20'd20248

//Encode Notes
`define ENCODE_NA 6'd0

`define ENCODE_C3 6'd1
`define ENCODE_C3_ 6'd2
`define ENCODE_D3 6'd3
`define ENCODE_D3_ 6'd4
`define ENCODE_E3 6'd5
`define ENCODE_F3 6'd6
`define ENCODE_F3_ 6'd7
`define ENCODE_G3 6'd8
`define ENCODE_G3_ 6'd9
`define ENCODE_A3 6'd10
`define ENCODE_A3_ 6'd11
`define ENCODE_B3 6'd12

`define ENCODE_C4 6'd13
`define ENCODE_C4_ 6'd14
`define ENCODE_D4 6'd15
`define ENCODE_D4_ 6'd16
`define ENCODE_E4 6'd17
`define ENCODE_F4 6'd18
`define ENCODE_F4_ 6'd19
`define ENCODE_G4 6'd20
`define ENCODE_G4_ 6'd21
`define ENCODE_A4 6'd22
`define ENCODE_A4_ 6'd23
`define ENCODE_B4 6'd24

`define ENCODE_C5 6'd25
`define ENCODE_C5_ 6'd26
`define ENCODE_D5 6'd27
`define ENCODE_D5_ 6'd28
`define ENCODE_E5 6'd29
`define ENCODE_F5 6'd30
`define ENCODE_F5_ 6'd31
`define ENCODE_G5 6'd32
`define ENCODE_G5_ 6'd33
`define ENCODE_A5 6'd34
`define ENCODE_A5_ 6'd35
`define ENCODE_B5 6'd36

//Beats
`define BEAT_0_25 3'd0
`define BEAT_0_5 3'd1
`define BEAT_1 3'd2
`define BEAT_1_5 3'd3
`define BEAT_2 3'd4
`define BEAT_3 3'd5
`define BEAT_4 3'd6

//Ligature
`define LIG_FALSE 1'd1
`define LIG_TRUE 1'd1

//14SD Letters
`define FTSD_A 15'b0001_0000_1111_111 //A 0
`define FTSD_B 15'b0000_1110_1011_011 //B 1
`define FTSD_C 15'b0110_0011_1111_111 //C 2
`define FTSD_D 15'b0000_1111_1011_011 //D 3 
`define FTSD_E 15'b0110_0000_1111_111 //E 4
`define FTSD_F 15'b0111_0000_1111_111 //F 5
`define FTSD_G 15'b0100_0010_1111_111 //G 6
`define FTSD_H 15'b1001_0000_1111_111 //H 7
`define FTSD_I 15'b0110_1111_1011_011 //I 8
`define FTSD_J 15'b1000_0111_1111_111 //J 9
`define FTSD_K 15'b1111_0001_1101_101 //K 10
`define FTSD_L 15'b1110_0011_1111_111 //L 11
`define FTSD_M 15'b1001_0011_0101_111 //M 12
`define FTSD_N 15'b1001_0011_0111_101 //N 13
`define FTSD_O 15'b0000_0011_1111_111 //O 14
`define FTSD_P 15'b0011_0000_1111_111 //P 15
`define FTSD_Q 15'b0000_0011_1111_101 //Q 16
`define FTSD_R 15'b0011_0000_1111_101 //R 17
`define FTSD_S 15'b0100_1100_0111_111 //S 18
`define FTSD_T 15'b0111_1111_1011_111 //T 19
`define FTSD_U 15'b1000_0011_1111_111 //U 20
`define FTSD_V 15'b1111_0011_1100_111 //V 21
`define FTSD_W 15'b1001_0011_1110_101 //W 22
`define FTSD_X 15'b1111_1111_0100_101 //X 23
`define FTSD_Y 15'b1111_1111_0101_011 //Y 24
`define FTSD_Z 15'b0110_1111_1100_111 //Z 25
