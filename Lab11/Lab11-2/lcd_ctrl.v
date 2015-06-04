`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: An-Ting Hsu
// 
// Create Date:    17:11:14 05/28/2015 
// Module Name:    lcd_ctl
// Project Name:   Lab11-1
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module lcd_ctrl(
    clk, //LCD controller clock (I)
    rst_n, //active low reset (I)
    data_ack, //data re-arrangement buffer ready indicator (I)
    data, //byte data transfer from buffer (I)
    lcd_di, //LCD data/instruction (O)
    lcd_rw, //LCD Read/Write (O)
    lcd_en, //LCD enable (O)
    lcd_rst, //LCD reset (O)
    lcd_cs, //LCD frame select (O)
    lcd_data, //LCD data (O)
    addr, //Address for each picture (O)
    data_request //request for the memory data (O)
);

//I/Os
input clk; //LCD controller clock
input rst_n; //active low reset
input data_ack; //data re-arrangement buffer ready indicator
input [7:0] data; //byte data transfer from buffer
output lcd_di; //LCD data/instruction 
output lcd_rw; //LCD Read/Write
output lcd_en; //LCD enable
output lcd_rst; //LCD reset
output [1:0] lcd_cs; //LCD frame select
output [7:0] lcd_data; //LCD data
output [6:0] addr; //Address for each picture
output data_request; //request for the memory data

reg lcd_di; //LCD data/instruction 
reg lcd_rw; //LCD Read/Write
reg [7:0] lcd_data; //LCD data
reg lcd_di_next; //LCD data/instruction 
reg lcd_rw_next; //LCD Read/Write
reg [7:0] lcd_data_next; //LCD data
reg data_request; //request for the memory data
reg data_request_next; //request for the memory data
reg lcd_en; //LCD enable

reg [2:0] state; //FSM state definition
reg [2:0] state_next; //FSM state definition

reg [7:0] counter_y; //y counter
reg [7:0] counter_y_next; //y counter
reg [3:0] counter_page; //page counter
reg [3:0] counter_page_next; //page counter

reg [3:0] image; //image counter
reg [3:0] image_next; //image counter

reg [13:0] idle_counter; //idle time counter
reg [13:0] idle_counter_next; //idle time counter

reg [14:0] pause_counter; //pause time counter
reg [14:0] pause_counter_next; //pause time counter

wire lcd_en_next; //LCD enable

assign addr = {image, counter_page[2:0]};
assign lcd_rst = rst_n;
assign lcd_cs = 2'b11;

// Counter for the LCD
// counter_y: counter for the y axis
// counter_page: counter for the pages

// FSM for LCD
always @*
    begin
        //set_lcd_value(`LCD_DISPLAY_IDLE,lcd_di_next,lcd_rw_next,lcd_data_next); 
        {lcd_di_next,lcd_rw_next,lcd_data_next} = `LCD_DISPLAY_IDLE;
        state_next = state;
        counter_page_next = counter_page;
        counter_y_next = counter_y;
        image_next = image;
        idle_counter_next = idle_counter;
        data_request_next = data_request;
        pause_counter_next = pause_counter;
    if(~lcd_en)
        begin
            case (state)
                `INIT_LCD:
                    begin
                        {lcd_di_next,lcd_rw_next,lcd_data_next} = `LCD_SET_DSL;
                        state_next = `ERASE_LCD;
                        counter_y_next = 7'd0;
                        counter_page_next = 4'd0;
                    end
                `ERASE_LCD:
                    begin
                        if((counter_page <= 4'd7) && (counter_y < 7'd63))
                            begin
                                {lcd_di_next, lcd_rw_next, lcd_data_next} = `LCD_ERASE;			 
                                counter_y_next = counter_y + 1'b1;
                            end //Erase first 63 bytes in same page
                        else if((counter_page <= 4'd7) && (counter_y == 7'd63))
                            begin
                                {lcd_di_next, lcd_rw_next, lcd_data_next} = `LCD_ERASE;
                                counter_y_next = counter_y + 1'b1;
                                counter_page_next = counter_page + 1'b1;
                            end //Erase last byte in page and prepare change to next page
                        else if((counter_page <= 4'd7) && (counter_y == 7'd64))
                            begin
                                {lcd_di_next, lcd_rw_next, lcd_data_next} = {7'b0_0_10111, counter_page[2:0]};
                                counter_y_next = 7'b0;
                            end //change to next page for erasing
                        else if((counter_page == 4'd8) && (counter_y == 7'd64))
                            begin
                                {lcd_di_next, lcd_rw_next, lcd_data_next} = {4'b0_0_01, 6'b0};
                                counter_y_next = counter_y + 1'b1;
                            end //Set Y
                        else if((counter_page == 4'd8) && (counter_y==7'd65))
                            begin
                                {lcd_di_next, lcd_rw_next, lcd_data_next} = {7'b0_0_10111, 3'd0};
                                counter_y_next = 7'd0;
                                counter_page_next = 4'b0;
                                state_next = `LCD_IDLE;
                                image_next = 4'd0;
                            end //Set X
                    end
                `LCD_IDLE:
                    begin
                        {lcd_di_next,lcd_rw_next,lcd_data_next} = `LCD_DISPLAY_IDLE;
                    if(idle_counter >= 14'd10000)
                        begin
                            state_next = `REQUEST_DATA;
                            idle_counter_next = 14'd0;
                            counter_y_next = 7'd0;
                            counter_page_next = 4'd0;
                        end
                    else
                        begin
                            state_next = `LCD_IDLE;
                            idle_counter_next = idle_counter + 1'b1;
                        end
                    end
                `REQUEST_DATA:
                    begin
                        data_request_next = `ENABLED;
                    if(data_ack == `ENABLED) //rom controller has finished rom reading
                        begin
                            state_next = `READ_DATA;
                            data_request_next = `DISABLED;
                            counter_y_next = 7'd0;
                            {lcd_di_next,lcd_rw_next,lcd_data_next} = {7'b0_0_10111, counter_page[2:0]};
                        end
                    end
                `READ_DATA:
                    begin
                        if(counter_y < 7'd63)
                            begin
                                {lcd_di_next,lcd_rw_next,lcd_data_next} = {2'b1_0,data};
                                counter_y_next = counter_y + 1'b1;
                            end
                        else if(counter_y == 7'd63)
                            begin
                                {lcd_di_next,lcd_rw_next,lcd_data_next} = {2'b1_0,data};
                                counter_y_next = counter_y + 1'b1;
                                counter_page_next = counter_page + 1'b1;
                            end
                        else if(counter_y == 7'd64)
                            begin
                                counter_y_next = 7'd0;
                            if(counter_page==4'd8)
                                begin
                                    if(image == 4'd8)
                                        begin
                                            image_next = 4'd0;
                                            state_next = `LCD_PAUSE;
                                        end
                                    else
                                        begin
                                            image_next = image + 1'b1; // change to next image
                                            state_next = `LCD_IDLE;
                                        end
                                end
                            else
                                state_next = `REQUEST_DATA;
                            end
                    end
                `LCD_PAUSE:
                    begin
                        if(pause_counter == 15'd16000)
                            begin
                                state_next = `LCD_IDLE;
                                pause_counter_next = 15'd0;
                            end
                        else
                            begin
                                state_next = `LCD_PAUSE;
                                pause_counter_next = pause_counter + 1'b1;
                            end
                    end
            endcase
        end
    end

always @(posedge clk or negedge rst_n)
    if(~rst_n)
        begin
            state <= 3'd0;
            counter_y <= 7'd0;
            counter_page <= 4'd0;
            image <= 4'd0;
            idle_counter <= 12'd0;
            data_request <= 1'b0;
            lcd_di <= 1'b0;
            lcd_rw <= 1'b0;
            lcd_data <= 8'd0;
            lcd_en <= 1'b0;
            pause_counter <= 15'd0;
        end
    else
        begin
            state <= state_next;
            counter_y <= counter_y_next;
            counter_page <= counter_page_next;
            image <= image_next;
            idle_counter <= idle_counter_next;
            data_request <= data_request_next;
            lcd_di <= lcd_di_next;
            lcd_rw <= lcd_rw_next;
            lcd_data <= lcd_data_next;
            lcd_en <= lcd_en_next;
            pause_counter <= pause_counter_next;
        end

assign lcd_en_next = ~lcd_en;

endmodule
