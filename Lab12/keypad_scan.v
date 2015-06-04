`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////
// Department of Computer Science
// National Tsing Hua University
// Project   : Design Gadgets for Hardware Lab
// Module    : keypad_scan
// Author    : Chih-Tsun Huang
// E-mail    : cthuang@cs.nthu.edu.tw
// Revision  : 2
// Date      : 2011/04/13
module keypad_scan(
  row,  
  change,
  key,
  col,
  clk,
  rst_n
);

output [3:0] row;
output change;
output [15:0] key;
input [3:0] col;
input clk;
input rst_n;

reg change;
reg [1:0] sel, sel_next; //a repetitive counter for row-wise scan
reg [1:0] sel_tmp;
reg [3:0] row;
reg [15:0] key;
reg [15:0] key_next;
reg [15:0] key_temp;
reg [15:0] key_temp_next;

// A repetitive counter for row-wise scan
always @(posedge clk or negedge rst_n)
  if (~rst_n)
    sel = 2'b00;
  else
    sel = sel_tmp;

always @(sel)
  sel_tmp = sel + 1'b1;
  
// row-wise scan
always @(sel)
  case (sel)
    2'd0: row = 4'b0111;
    2'd1: row = 4'b1011;
    2'd2: row = 4'b1101;
    2'd3: row = 4'b1110;
    default: row=4'b1111;
  endcase

// column-wise readout
always @(posedge clk or negedge rst_n)
  if (~rst_n)
  begin
    key <= 16'd0;
    key_temp <= 16'd0;
  end
  else
  begin
    key <= key_next;
    key_temp <= key_temp_next;
  end
always @*
begin
  key_next = key;
  key_temp_next = key_temp;
  change = 1'b0;
  case (row)
    8'b0111: 
    begin
      key_next[15:12] = 4'd0;
      if (col[3]==1'b0) key_next[15] = 1'b1;
      if (col[2]==1'b0) key_next[14] = 1'b1;
      if (col[1]==1'b0) key_next[13] = 1'b1;
      if (col[0]==1'b0) key_next[12] = 1'b1;
    end
    8'b1011: 
    begin
      key_next[11:8] = 4'd0;
      if (col[3]==1'b0) key_next[11] = 1'b1;
      if (col[2]==1'b0) key_next[10] = 1'b1;
      if (col[1]==1'b0) key_next[9] = 1'b1;
      if (col[0]==1'b0) key_next[8] = 1'b1;
    end
    8'b1101: 
    begin
      key_next[7:4] = 4'd0;
      if (col[3]==1'b0) key_next[7] = 1'b1;
      if (col[2]==1'b0) key_next[6] = 1'b1;
      if (col[1]==1'b0) key_next[5] = 1'b1;
      if (col[0]==1'b0) key_next[4] = 1'b1;
    end
    8'b1110: 
    begin
      key_next[3:0] = 4'd0;
      if (col[3]==1'b0) key_next[3] = 1'b1;
      if (col[2]==1'b0) key_next[2] = 1'b1;
      if (col[1]==1'b0) key_next[1] = 1'b1;
      if (col[0]==1'b0) key_next[0] = 1'b1;
    end
  endcase
  //detect change;
  if (sel == 2'd0 && key != key_temp) 
  begin
    change = 1'b1;
    key_temp_next = key;
  end
end

endmodule
