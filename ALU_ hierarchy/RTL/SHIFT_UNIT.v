module SHIFT_UNIT
//declaring parameters
#(parameter WIDTH = 4)
//declaring inputs and outputs
(
input wire [WIDTH-1: 0] A,B,
input wire [1:0]        ALU_FUN,
input wire              CLK,Shift_Enable,RST,

output reg [WIDTH-1: 0] SHIFT_OUT,
output reg              SHIFT_Flag  
);

//declare internal signals
reg [WIDTH-1: 0] SHIFT_OUT_comb;

// storing in Active low Ascynchronous register
always@(posedge CLK)
  begin
    if(!RST)
      begin
        SHIFT_OUT  <= 'b0;
        SHIFT_Flag <= 'b0;
      end
    else
      SHIFT_OUT <= SHIFT_OUT_comb;
  end
  
// Shifting operations
always@(*)
  begin
    if(Shift_Enable)
      begin
        SHIFT_Flag = 1'b1;
        case(ALU_FUN)
          2'b00:begin
                  SHIFT_OUT_comb = A >> 1 ;
                end    
          2'b01:begin
                  SHIFT_OUT_comb = A << 1 ;
                end    
          2'b10: begin
                  SHIFT_OUT_comb = B >> 1 ;
                end    
          2'b11: begin
                  SHIFT_OUT_comb = B << 1;
                end
        endcase
      end
	  else
	    begin
		    SHIFT_OUT_comb = 'b0;
			SHIFT_Flag = 1'b0;
	    end
  end
  
endmodule