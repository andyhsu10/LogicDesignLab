`define IDLE      2'b00
`define READ_ROM  2'b01
`define TRANS2LCD 2'b10
`define DISABLED 1'b0
`define ENABLED  1'b1

module rom_ctrl(
  clk, // rom controller clock
  rst_n, // active low reset
  en, // LCD enable
  data_request, // request signal from LCD
  address, // requested address
  data_ack, // data ready acknowledge
  data // data to be transferred (byte)
);

// I/O declaration
input clk; // rom controller clock
input rst_n; // active low reset
input en; // LCD enable
input data_request; // request signal from LCD
input [6:0] address; // requested address
output data_ack; // data ready acknowledge
output [7:0] data; // data to be transferred (byte)

// Internal node declaration
reg [3:0] counter_word; // word counter for ROM
reg [3:0] counter_word_next; // word counter for ROM
reg [3:0] tmp;
reg [5:0] counter_byte; // byte counter for data to LCD
reg [5:0] counter_byte_next; // byte counter for data to LCD
reg [511:0] mem; // memory re-arrangement buffer
reg [511:0] mem_next; // memory re-arrangement buffer 

reg [9:0] addr_rom; // address of rom
wire [63:0] rom_out; // output of rom

reg [1:0] state; // state of FSM
reg [1:0] state_next; // state of FSM
reg data_ack; // data ready acknowledge
reg data_ack_next; // data ready acknowledge
reg [7:0] data; // data to be transferred (byte)
reg [7:0] data_next; // data to be transferred (byte)

// ROM
ROM R1(
  .clka(clk),
  .addra(addr_rom),
  .douta(rom_out)
);

// FSM behavior for data transfer
always @*
begin
  // Initial value
  counter_word_next = counter_word; 
  counter_byte_next = counter_byte; 
  mem_next = mem;
  data_ack_next = `DISABLED;
  data_next = 8'd0;
  state_next = state;
  addr_rom = 10'd0;
  case (state)
    `IDLE:
    begin
      counter_word_next = 4'd1; 
      counter_byte_next = 6'd0; 
      data_ack_next = `DISABLED;
      if (data_request==`ENABLED)
      begin
        state_next = `READ_ROM;
        addr_rom = {address,3'd0};
      end
    end
    `READ_ROM:
    begin
      addr_rom = {address,counter_word[2:0]};
      counter_word_next = counter_word + 1'b1;
      mem_next[((counter_word-1)*64)+:64] = rom_out;
      if (counter_word == 4'd8)
      begin
        counter_byte_next = 6'd0;
        state_next = `TRANS2LCD;
        data_ack_next = `ENABLED;
      end
      if (counter_word == 4'd7)
        data_ack_next = `ENABLED;
    end
    `TRANS2LCD:
     begin
      if (en)
      begin
        counter_byte_next = counter_byte + 1'b1;
        data_next = {mem[511-counter_byte],
                     mem[447-counter_byte],
                     mem[383-counter_byte],
                     mem[319-counter_byte],
                     mem[255-counter_byte],
                     mem[191-counter_byte],
                     mem[127-counter_byte],
                     mem[63-counter_byte]};
      end 
      if (en && counter_byte==6'd63)
      begin
        data_ack_next = `DISABLED;
        state_next = `IDLE;
      end
     end
  endcase
end

// Data buffers for key registers
always @(posedge clk or negedge rst_n)
  if (~rst_n)
  begin
    counter_word <= 4'd0;
    counter_byte <= 6'd0;
    mem <= 512'd0;
    data_ack <= 1'b0;
    data <= 8'd0;
    state <= 2'd0;
  end
  else
  begin
    counter_word <= counter_word_next;
    counter_byte <= counter_byte_next;
    mem <= mem_next;
    data_ack <= data_ack_next;
    data <= data_next;
    state <= state_next;
  end

endmodule
