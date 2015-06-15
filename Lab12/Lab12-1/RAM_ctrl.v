`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu
// 
// Create Date:    18:08:25 06/04/2015 
// Module Name:    RAM_ctrl
// Project Name:   Lab12-1
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
module RAM_ctrl(
    clk, //global clock input (I)
    rst_n, //active low reset (I)
    pressed, //whether key pressed (1) or not (0) (I)
    en, //LCD enable (I)
    input_data, //data input (I)
    data_valid, //whether data valid or not (O)
    data_out //ram data output (O)
);

input clk; //global clock input 
input rst_n; //active low reset 
input pressed; //whether key pressed (1) or not (0) 
input en; //LCD enable
input [95:0] input_data; //data input
output data_valid; //whether data valid or not
output [7:0] data_out; //ram data output

parameter IDLE  = 2'd0;
parameter WRITE = 2'd1;
parameter GETDATA = 2'd2;
parameter TRANSDATA = 2'd3;

reg data_valid;
reg [7:0] data_out;
reg [5:0] addr, addr_next;
reg [5:0] counter_word, counter_word_next;
reg [63:0] data_in;
reg [1:0] cnt, cnt_next; //count mark row
reg [511:0] mem, mem_next;
reg [1:0] state, state_next;
reg flag, flag_next;
reg [7:0] data_out_next;
reg data_valid_next;
reg wen, wen_next;
reg temp_pressed, temp_pressed_next;
reg [23:0] translate;

wire [15:0] in_temp0, in_temp1, in_temp2, in_temp3;
wire [255:0] mark1, mark2, mark3, mark4;
wire [63:0] data_out_64;

always @*
    case(cnt)
        2'd0: translate = input_data[95:72];
        2'd1: translate = input_data[71:48];
        2'd2: translate = input_data[47:24];
        2'd3: translate = input_data[23:0];
    endcase

lcd_decoder decoder1(
    .font(translate[23:18]),
    .mark(mark1)
);

lcd_decoder decoder2(
    .font(translate[17:12]),
    .mark(mark2)
);

lcd_decoder decoder3(
    .font(translate[11:6]),
    .mark(mark3)
);

lcd_decoder decoder4(
    .font(translate[5:0]),
    .mark(mark4)
);

assign in_temp0 = mark1[(240-((addr%16)*16))+:16];
assign in_temp1 = mark2[(240-((addr%16)*16))+:16];
assign in_temp2 = mark3[(240-((addr%16)*16))+:16];
assign in_temp3 = mark4[(240-((addr%16)*16))+:16];

RAM R1(
    .clka(clk),
    .wea(wen),
    .addra(addr),
    .dina(data_in),
    .douta(data_out_64)
);

always @(posedge clk or negedge rst_n)
    if(~rst_n)
        begin
            addr = 6'd0;
            cnt = 2'd0;
            mem = 512'd0;
            state = IDLE;
            flag = 1'b0;
            counter_word = 6'd0;
            data_out = 8'd0;
            data_valid = 1'd0;
            wen = 1'b1;
            temp_pressed = 1'b0;
        end
    else
        begin
            addr = addr_next;
            cnt = cnt_next;
            mem = mem_next;
            state = state_next;
            flag = flag_next;
            counter_word = counter_word_next;
            data_out = data_out_next;
            data_valid = data_valid_next;
            wen = wen_next;
            temp_pressed = temp_pressed_next;
        end

always @*
    begin
        state_next = state;
        case(state)
            IDLE:
                begin
                    if(wen)
                        state_next = WRITE;
                    else
                        state_next = GETDATA;
                end
            WRITE:
                begin
                    if(addr == 6'd63)
                        state_next = GETDATA;
                end
            GETDATA:
                begin
                    if(flag == 1'b1)
                        state_next = TRANSDATA;
                end
            TRANSDATA:
                begin
                    if(addr == 6'd0 && counter_word == 6'd63 && en)
                        state_next = IDLE;
                    else if(counter_word == 6'd63 && en)
                        state_next = GETDATA;
                end
        endcase
    end

always @*
    begin
        addr_next = addr;
        data_in = 64'd0;
        cnt_next = cnt;
        mem_next = mem;
        flag_next = 1'b0;
        counter_word_next = counter_word;
        data_valid_next = 1'd0;
        data_out_next = 8'd0;
        case(state)
            WRITE:
                begin
                    addr_next = addr + 1'b1;
                    data_in = {in_temp0, in_temp1, in_temp2, in_temp3};
                if(addr == 6'd15 || addr == 6'd31 || addr == 6'd47 || addr == 6'd63)
                    cnt_next = cnt + 1'd1;
                end
            GETDATA:
                begin
                    if(~flag)
                        addr_next = addr + 1'b1;

                    if((addr%8) == 6'd7)
                        flag_next = 1'b1;

                    if((addr%8) >= 6'd1 || flag)
                        mem_next[(((addr-1)%8)*64)+:64] = data_out_64;
                end
            TRANSDATA:
                begin
                    if(en)
                        begin
                            counter_word_next = counter_word + 1'b1;
                            data_valid_next = 1'b1;
                            data_out_next = {mem[511 - counter_word],
                                mem[447 - counter_word],
                                mem[383 - counter_word],
                                mem[319 - counter_word],
                                mem[255 - counter_word],
                                mem[191 - counter_word],
                                mem[127 - counter_word],
                                mem[63 - counter_word]};
                        end
                end
        endcase
    end
 
// wen control
always @*
    begin
        wen_next = wen;
        temp_pressed_next = temp_pressed;
        if(pressed)
            temp_pressed_next = 1'b1;
    
        if(state == WRITE && addr == 6'd63)
            wen_next = 1'b0;

        if(state == TRANSDATA && addr == 6'd0 && counter_word == 6'd63 && temp_pressed == 1'b1)
            begin
                temp_pressed_next = 1'b0;
                wen_next = 1'b1;
            end
    end
endmodule
