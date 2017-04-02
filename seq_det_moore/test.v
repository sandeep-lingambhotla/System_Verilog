// Code your testbench here
// or browse Examples
module top();
  
  reg in;
  reg clk;
  reg rst;
  
  wire out;
  
  seq_detector duv(.in(in),.out(out),.clk(clk),.rst(rst));
  
  initial begin
     $dumpfile("dump.vcd");
	   $dumpvars(1);
    clk = 0;
    forever #5 clk = ~clk ;
  end
  
  initial begin
  	#7
    in = 1'b0;
    rst = 1'b1;
    #1
    rst = 1'b0;
    #10
    in = 1'b1;
    #10
    in = 1'b0;
    #10
    in = 1'b1;
    #10
    in = 1'b0;
    #10
    in = 1'b1;
    #10
    in = 1'b1;
    #10
    in = 1'b1;
    #10
    in = 1'b0;
    
    #10
    $finish();
    
  end
  
endmodule
