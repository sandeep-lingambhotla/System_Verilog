// Code your design here
//Code detects sequence 1011
module seq_detector(in,out,clk,rst);
  
  //inputs
  input clk;
  input in;
  input rst;
  
  //outputs
  output reg out;
  
  //FSM requires 5 states since 4 bits to detect and one state for output.
  typedef enum {zero,one,two,three,four} state_type ;
  
  state_type present, next;
  
  //sequential part
  always@(posedge clk) begin
    if(rst)
      present <= zero;
    else
      present <= next;
  end
  
  //combinational part
  always@(in or present) begin
    case(present)
      zero : if(in == 1'b1) next = one;
      		 else next = zero;
      
      one  : if(in == 1'b0) next = two;
      		 else next = one;
      
      two  : if(in == 1'b1) next = three;
      		 else next = zero;
      
      three: if(in == 1'b1) next = four;
      		 else next = two;
               
      four : if(in == 1'b1) next = one;
      		 else next = two;
    default: next = zero;
      
    endcase
      end
  //output logic
   always@(in or present) begin
    case(present)
      zero : out = 1'b0;
      
      one  : out = 1'b0;
      
      two  : out = 1'b0;
      
      three: out = 1'b0;
               
      four : out = 1'b1;
      
    default: out = 1'b0;
      
    endcase
      end
  
endmodule
