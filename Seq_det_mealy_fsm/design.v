// Code your design here
//Code detects sequence 1011
module seq_detector(in,out,clk,rst);
  
  //inputs
  input clk;
  input in;
  input rst;
  
  //outputs
  output reg out;
  
  //FSM requires 4 states since 4 bits to detect
  typedef enum {one,two,three,four} state_type ;
  
  state_type present, next;
  
  //sequential part
  always@(posedge clk) begin
    if(rst)
      present <= one;
    else
      present <= next;
  end
  
  //combinational part
  always@(in or present) begin
    case(present)
      
      one: begin
        	if(in == 1'b1) next = two;
      		else next = one;
	        end
      two: begin
        	if(in == 1'b0) next = three;
      		else next = two;
	        end
      three: begin
        	  if(in == 1'b1) next = four;
      		  else next = one;
		      end
      four: begin
        	 if(in == 1'b1) next = one;
      		 else next = three;
      		 end
      default: next = one;
      
      endcase
  end
  
  //output logic
  always@(posedge clk) begin
      
        case(present)
          
    	  one: out = 1'b0;
	
    	  two: out = 1'b0;
      
	      three: out = 1'b0;
      
          four: begin
            	 if(in == 1'b1) out = 1'b1;
      			 else out = 1'b0;
          		 end
	      
          default: out = 1'b0;
          	
          endcase
      end
  
endmodule
