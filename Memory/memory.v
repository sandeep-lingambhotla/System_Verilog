module ram(read_memory_data, write_memory_data, read_memory, write_memory, address, clk);
  
  parameter ADDRESS_MAX = 16;
  parameter ADDRESS_BITS = 4;
  parameter DATA_WIDTH = 16;
  
  input write_memory,read_memory,clk;
  input [ADDRESS_BITS-1:0] address;
  input [DATA_WIDTH-1:0]  write_memory_data;
  output reg [DATA_WIDTH-1:0]  read_memory_data;
  
  reg [DATA_WIDTH-1:0] ram [ADDRESS_MAX-1:0];
  
  always@(posedge clk)begin
    if(read_memory)
      read_memory_data <= ram[address];
    else
      ;
  end
  
  always@(negedge clk)begin
    if(write_memory)
      ram[address] <= write_memory_data;
    else
      ;
  end
  
endmodule
  
