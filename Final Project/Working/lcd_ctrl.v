`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu
// 
// Create Date:    17:47:30 06/04/2015 
// Module Name:    lcd_ctrl
// Project Name:   Lab12-1
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
module lcd_ctrl(
    clk, //global clock (I)
    rst_n, //active low reset (I)
    data, //memory value (I) 
    data_valid, //if data_valid = 1 the data is valid (I)
    LCD_di, //LCD data/instruction (O)
    LCD_rw, //LCD Read/Write (O)
    LCD_en, //LCD enable (O)
    LCD_rst, //LCD reset (O)
    LCD_cs, //LCD frame select (O)
    LCD_data, //LCD data (O)
    en_tran //data transfer enable (O)
);

// I/Os
input clk; //global clock
input rst_n; //active low reset
input [7:0] data; //memory value  
input data_valid; //if data_valid = 1 the data is valid
output LCD_di; //LCD data/instruction 
output LCD_rw; //LCD Read/Write 
output LCD_en; //LCD enable
output LCD_rst; //LCD reset
output [1:0] LCD_cs; //LCD frame select
output [7:0] LCD_data; //LCD data
output en_tran; //data transfer enable
 
parameter SETDSL = 3'd0;
parameter SetY = 3'd1;
parameter SetX = 3'd2;
parameter Display = 3'd3;
parameter IDLE = 3'd4;
parameter EARSE = 3'd5;

assign LCD_rst = rst_n;
assign LCD_cs = 2'b10;
assign LCD_rw = 1'b0;

reg LCD_di;
reg LCD_en;
reg [7:0] LCD_data;
reg en_tran;
reg LCD_di_next;
reg [7:0] LCD_data_next;
reg LCD_en_next;
reg [2:0] state,state_next;
reg en_tran_next;
reg [5:0] y_cnt, y_cnt_next;
reg [1:0] flag, flag_next;
reg [2:0] x_cnt, x_cnt_next;
 
always @(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            begin
                LCD_di = 1'd0;
                LCD_data = 8'b0000_0000;
                LCD_en = 1'b1;
                state = SETDSL;
                en_tran = 1'b0;
                y_cnt = 6'd0;
                x_cnt = 3'd0;
                flag = 2'd0;
            end
        else
            begin
                LCD_di = LCD_di_next;
                LCD_data = LCD_data_next;
                LCD_en = LCD_en_next;
                state = state_next;
                en_tran = en_tran_next;
                y_cnt = y_cnt_next;
                x_cnt = x_cnt_next;
                flag = flag_next;
            end
    end
  
always @*
    begin
        state_next = state;
        if(LCD_en == 1'b0)
            begin
                case(state)
                    SETDSL: state_next = EARSE;
                    EARSE:
                        begin
                            if({x_cnt,y_cnt} == {3'd7,6'd63})
                                state_next = SetX;
                        end
                    SetX: state_next = SetY;
                    SetY: state_next = IDLE;
                    Display:
                        begin
                            if(flag == 1'b1 && x_cnt == 3'd0 && y_cnt == 6'd0)
                                state_next = IDLE;
                        end
                    IDLE: state_next = Display;
                endcase
            end
    end
 
always @*
    begin
        LCD_en_next = ~LCD_en;
        LCD_data_next = LCD_data;
        LCD_di_next = LCD_di;
        en_tran_next = 1'd0;
        y_cnt_next = y_cnt;
        x_cnt_next = x_cnt;
        flag_next = flag;
    if(LCD_en ==1'd0)
        begin
            case(state)
                SETDSL:
                    begin
                        LCD_data_next = 8'b1100_0000;
                        LCD_di_next   = 1'd0;
                    end
                EARSE:
                    begin
                        if(flag == 2'b0)
                            begin
                                LCD_di_next   = 1'd0;
                                LCD_data_next = {5'b10111,x_cnt};
                                flag_next = flag + 1'b1;
                            end
                        else if(flag == 2'b1)
                            begin
                                LCD_di_next   = 1'd0;
                                LCD_data_next = 8'b0100_0000;
                                flag_next = flag + 1'b1;
                            end
                        else
                            begin
                                LCD_di_next   = 1'd1;
                                LCD_data_next  = 8'b0000_0000;
                            if(y_cnt == 6'd63)
                                begin
                                    y_cnt_next = 6'd0;
                                    flag_next = 2'd0;
                                    x_cnt_next = x_cnt + 1'b1;
                                end
                            else
                                y_cnt_next = y_cnt + 1'b1;
                            end
                    end
                SetX:
                    begin
                        LCD_data_next = 8'b10111000;
                        LCD_di_next   = 1'd0;
                    end
                SetY:
                    begin
                        LCD_data_next = 8'b0100_0000;
                        LCD_di_next   = 1'd0;
                    end
                Display:
                    begin
                        if(flag == 2'b0)
                            en_tran_next = 1'd1;
                        else if(flag == 2'd1)
                            begin
                                LCD_data_next = {5'b10111, x_cnt};
                                LCD_di_next = 1'd0;
                                flag_next = 2'd0;
                            end

                        if(data_valid)
                            begin
                                y_cnt_next = y_cnt + 1'b1;
                                LCD_di_next = 1'd1;
                                LCD_data_next = data;
                            if(y_cnt == 6'd63)
                                begin
                                    flag_next = flag + 1'b1;
                                    x_cnt_next = x_cnt + 1'b1;
                                end
                            end
                    end
                IDLE:
                    begin
                        LCD_di_next = 1'd0;
                        LCD_data_next = 8'b0011_1111;
                    end
            endcase
        end
    end
endmodule
