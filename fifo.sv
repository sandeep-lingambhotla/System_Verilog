module fifo (
  clk,
  resetN,
  write_en,
  read_en,
  data_in,
  data_out,
  full,
  empty
);
  
  parameter FIFO_WIDTH = 8;
  parameter FIFO_DEPTH = 16;
  
  input clk;
  input resetN;
  input write_en;
  input read_en;
  input [FIFO_WIDTH - 1:0]data_in;
  
  output [FIFO_WIDTH-1 : 0]data_out;
  output full;
  output empty;
  
  wire clk;
  wire resetN;
  wire write_en;
  wire read_en;
  wire [FIFO_WIDTH-1 : 0]data_in;
  
  reg [FIFO_WIDTH-1 : 0]data_out;
  
  wire full;
  wire empty;
  
  reg [FIFO_WIDTH-1 : 0] ram [FIFO_DEPTH-1 : 0];
  
  reg tmp_empty ;
  reg tmp_full ;
  
  integer write_ptr;
  integer read_ptr;
  
  always@(negedge resetN) begin
  
    data_out <= 0;
    tmp_empty <= 1'b1;
    tmp_full <= 1'b0;
    write_ptr <= 0;
    read_ptr <= 0;
    
  end
  
  assign full = tmp_full ;
  assign empty = tmp_empty ;
  
  always@(posedge clk) begin
  
    if(write_en == 1'b1 && full != 1'b1) begin
      ram[write_ptr] <= data_in ;
      tmp_empty <= 1'b0;
      write_ptr = (write_ptr + 1) % FIFO_DEPTH ;
    
        if(read_ptr == write_ptr) begin
        tmp_full = 1'b1;
        end
    end
  
    if(read_en == 1'b1 && empty != 1'b1) begin
      data_out <= ram[read_ptr];
      tmp_full <= 1'b0;
      read_ptr = (read_ptr + 1) % FIFO_DEPTH ;
    
         if(write_ptr == read_ptr) begin
         tmp_empty = 1'b1;
         end
    end
 
  end
 
endmodule
  
