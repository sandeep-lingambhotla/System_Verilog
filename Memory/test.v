module top();
  
  parameter ADDRESS_MAX = 16;
  parameter ADDRESS_BITS = 4;
  parameter DATA_WIDTH = 16;
  
  reg [DATA_WIDTH-1:0] write_memory_data;
  reg read_memory, write_memory;
  reg [ADDRESS_BITS-1:0] address;
  reg clk;
  
  wire [DATA_WIDTH-1:0] read_memory_data;
  
  ram dut(.read_memory_data(read_memory_data),
      .write_memory_data(write_memory_data),
      .read_memory(read_memory), 		
      .write_memory(write_memory), 
      .address(address),
      .clk(clk));

  initial begin
    $dumpfile("dump.vcd");
	   $dumpvars(1);
    
    clk = 0;
    write_memory = 0;
    read_memory = 0;
    address = 0;
    forever #5 clk = ~clk;
  end
  
  task run();
    #15
    address = 4'hf;
    write_memory = 1'b1;
    write_memory_data = 16'hffff;
  	#15 write_memory = 1'b0; 
    #15
    address = 4'he;
    write_memory = 1'b1;
    write_memory_data = 16'hff00;
    #15 write_memory = 1'b0; 
    #15
    address = 4'hf;
    read_memory = 1'b1;
    //write_memory_data = 16'hffff;
    #15 read_memory = 1'b0;
    #15
    address = 4'he;
    read_memory = 1'b1;
    //write_memory_data = 16'hffff;
    #15;
endtask
  
  initial begin
	#10
    run();
    $finish();
  end
  
endmodule
