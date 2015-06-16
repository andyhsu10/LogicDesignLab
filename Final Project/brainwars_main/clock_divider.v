`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu
// 
// Create Date:    17:48:51 06/04/2015 
// Module Name:    clock_divider
// Project Name:   Lab12-1
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
module clock_divider(
    clk_div, //divided clock signal (O)
    clk, //global clock input (I)
    rst_n //active low reset (I)
);

//Parameters
parameter counter_width = 14;
parameter half_cycle = 10000; // to generate a half clock period of 10000 cycles

//I/Os
output clk_div; //divided clock signal
input clk; //global clock input
input rst_n; //active low reset

//internal signals
reg [counter_width-1:0] count, count_next;
reg clk_div, clk_div_next;

always @*
    begin
        if(count == (half_cycle-1))
            begin
                count_next <= 0;
                clk_div_next <= ~clk_div;
            end
        else
            begin
                count_next <= count + 1'b1;
                clk_div_next <= clk_div;
            end
    end
  
always @(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            begin
                count = 0;
                clk_div = 0;
            end
        else
            begin
                count = count_next;
                clk_div = clk_div_next;
            end
    end
endmodule
