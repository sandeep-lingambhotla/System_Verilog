module top();
  
  reg a;
  wire b;
  reg clk;
  
  initial begin
    clk = 0;
    forever #1 clk = ~clk ;
  end
  
  integer i;
  
  test duv(.a(a),.b(b));
  
  initial begin
     $dumpfile("dump.vcd");
     $dumpvars(1);
    
    #10 a = 0;
    #10 a = 1;
    
    for(i = 0; i < 10; i = i+1)
      #(i) a = ~a ;
    
    #10 $finish();
    
  end
  
endmodule
