module CMP_UNIT
//declaring parameters
#(parameter WIDTH = 4)
//declaring inputs and outputs
(
input wire [WIDTH-1: 0] A,B,
input wire [1:0]        ALU_FUN,
input wire              CLK, CMP_Enable,RST,

output reg [WIDTH-1: 0] CMP_OUT,
output reg              CMP_Flag  
);

//declare internal signals
reg [WIDTH-1: 0] CMP_OUT_comb;

// storing in Active low Ascynchronous register
always@(posedge CLK)
  begin
    if(!RST)
      begin
        CMP_OUT  <= 'b0;
        CMP_Flag <= 'b0;
      end
    else
      CMP_OUT <= CMP_OUT_comb;
  end


// Comparison operations
always@(*)
  begin
    if(CMP_Enable)
      begin
        CMP_Flag = 1'b1;
        case(ALU_FUN)
          2'b00:begin
                  CMP_OUT_comb = 'b0;
                end    
          2'b01:begin
                  if (A == B)
                    CMP_OUT_comb = 'd1;
                  else
                    CMP_OUT_comb = 'd0;
                end    
          2'b10: begin
                  if (A > B)
                    CMP_OUT_comb = 'd2;
                  else
                    CMP_OUT_comb = 'd0;            
                 end    
          2'b11: begin
                  if (A < B)
                    CMP_OUT_comb = 'd3;
                  else
                    CMP_OUT_comb = 'd0;                  
                 end
        endcase
      end
	  else
	    begin
		    CMP_OUT_comb = 'b0;
			CMP_Flag = 1'b0;
	    end
  end
endmodule