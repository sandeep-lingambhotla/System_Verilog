// Testbench
module top();
  
  reg d;
  reg clk;
  reg rst;
  wire q;
  
  // Instantiate design under test
  dff DFF(.clk(clk), .rst(rst),
          .d(d), .q(q));
          
  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    rst = 1;
    d = 1'bx;
    display;
    
    d = 1;
    rst = 0;
    display;

    #10 d = 0;
    display;
    
    #10 d = 1;
    display;
    
    #10 rst = 1;
    display;
    
    #10 rst = 0;
    display;
    
    #10 d = 0;
    display;
    
	#10 $finish ;
    
  end
  
  task display;
		$display("d:%0h, q:%0h",d, q);
  endtask
  
  initial begin
    clk = 0;
    forever
    #5  clk = ~clk;
  end

endmodule
