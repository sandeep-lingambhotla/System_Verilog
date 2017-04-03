// Code your testbench here
// or browse Examples
module test();
  
  reg [2:0]a;
  
  dummy d1(.a(a));
  
  initial
    begin
       $dumpfile("dump.vcd");
	   $dumpvars(1);
      

      a = 3'b010;
      #5
      a = 3'b0xz;
      #5
      a = 3'b0zx;
      #5
      $finish;
      
    end
  
  
  
endmodule
