module dummy(a);
  
  input [2:0]a;
  
  always@(*) begin
  casez(a)
      3'b00?: $display("0 or 1");
      
      3'b0??: $display("2 or 3");
      
      default: $display("default");
    endcase
  end
      
endmodule
      
      
