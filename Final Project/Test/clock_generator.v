`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu & Hsin-Ho Lu
//
// Create Date:    16:49:10 06/16/2015
// Module Name:    clock_generator
// Project Name:   2015 Spring Logic Design Laboratory Final Project
// Revision:
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module clock_generator(
  clk, // clock from crystal (I)
  rst_n, // active low reset (I)
  clk_1, // generated 1 Hz clock (O)
  clk_2, // generated 2 Hz clock (O)
  clk_66, // generated 66 Hz clock (O)
  clk_100 // generated 100 Hz clock (O)
);

// Declare I/Os
input clk; // clock from crystal
input rst_n; // active low reset
output clk_1; // generated 1 Hz clock
output clk_2; // generated 2 Hz clock
output clk_66; // generated 66 Hz clock
output clk_100; // generated 100 Hz clock
reg clk_1; // generated 1 Hz clock
reg clk_2; // generated 2 Hz clock
reg clk_66; // generated 66 Hz clock
reg clk_100; // generated 100 Hz clock

// Declare internal nodes
reg [`DIV_BY_20M_BIT_WIDTH-1:0] count_20M, count_20M_next;
reg [`DIV_BY_10M_BIT_WIDTH-1:0] count_10M, count_10M_next;
reg [`DIV_BY_200K_BIT_WIDTH-1:0] count_200K, count_200K_next;
reg [`DIV_BY_1515151_BIT_WIDTH-1:0] count_1515151, count_1515151_next;
reg clk_1_next;
reg clk_2_next;
reg clk_100_next;
reg clk_66_next;

// *******************
// Clock divider for 1 Hz
// *******************
// Clock Divider: Counter operation
always @*
  if (count_20M == `DIV_BY_20M-1)
  begin
    count_20M_next = `DIV_BY_20M_BIT_WIDTH'd0;
    clk_1_next = ~clk_1;
  end
  else
  begin
    count_20M_next = count_20M + 1'b1;
    clk_1_next = clk_1;
  end

// Counter flip-flops
always @(posedge clk or negedge rst_n)
  if (~rst_n)
  begin
    count_20M <=`DIV_BY_20M_BIT_WIDTH'b0;
    clk_1 <=1'b0;
  end
  else
  begin
    count_20M <= count_20M_next;
    clk_1 <= clk_1_next;
  end

// *******************
// Clock divider for 2 Hz
// *******************
// Clock Divider: Counter operation
always @*
  if (count_10M == `DIV_BY_10M-1)
  begin
    count_10M_next = `DIV_BY_10M_BIT_WIDTH'd0;
    clk_2_next = ~clk_2;
  end
  else
  begin
    count_10M_next = count_10M + 1'b1;
    clk_2_next = clk_2;
  end

// Counter flip-flops
always @(posedge clk or negedge rst_n)
  if (~rst_n)
  begin
    count_10M <=`DIV_BY_10M_BIT_WIDTH'b0;
    clk_2 <=1'b0;
  end
  else
  begin
    count_10M <= count_10M_next;
    clk_2 <= clk_2_next;
  end

// *********************
// Clock divider for 100 Hz
// *********************
// Clock Divider: Counter operation 
always @*
  if (count_200K == `DIV_BY_200K-1)
  begin
    count_200K_next = `DIV_BY_200K_BIT_WIDTH'd0;
    clk_100_next = ~clk_100;
  end
  else
  begin
    count_200K_next = count_200K + 1'b1;
    clk_100_next = clk_100;
  end


// Counter flip-flops
always @(posedge clk or negedge rst_n)
  if (~rst_n)
  begin
    count_200K <=`DIV_BY_200K_BIT_WIDTH'b0;
    clk_100 <=1'b0;
  end
  else
  begin
    count_200K <= count_200K_next;
    clk_100 <= clk_100_next;
  end

  // *********************
// Clock divider for 66 Hz
// *********************
// Clock Divider: Counter operation 
always @*
  if (count_1515151 == `DIV_BY_1515151-1)
  begin
    count_1515151_next = `DIV_BY_1515151_BIT_WIDTH'd0;
    clk_66_next = ~clk_66;
  end
  else
  begin
    count_1515151_next = count_1515151 + 1'b1;
    clk_66_next = clk_66;
  end


// Counter flip-flops
always @(posedge clk or negedge rst_n)
  if (~rst_n)
  begin
    count_1515151 <=`DIV_BY_1515151_BIT_WIDTH'b0;
    clk_66 <=1'b0;
  end
  else
  begin
    count_1515151 <= count_1515151_next;
    clk_66 <= clk_66_next;
  end

endmodule
