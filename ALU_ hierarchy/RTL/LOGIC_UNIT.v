module LOGIC_UNIT
//declaring parameters
#(parameter WIDTH = 4)
//declaring inputs and outputs
(
input wire [WIDTH-1: 0] A,B,
input wire [1:0]        ALU_FUN,
input wire              CLK,Logic_Enable,RST,

output reg [WIDTH-1: 0] Logic_OUT,
output reg              Logic_Flag
);

// declare internal signal
reg [WIDTH-1: 0] Logic_OUT_comb;

// storing in Active low Ascynchronous register
always@(posedge CLK)
  begin
    if(!RST)
      begin
        Logic_OUT  <= 'b0;
        Logic_Flag <= 'b0;
      end
    else
      Logic_OUT <= Logic_OUT_comb;
  end
  
  
// Logic operations
always@(*)
  begin
    if(Logic_Enable)
      begin
        Logic_Flag = 1'b1;
        case(ALU_FUN)
          2'b00:begin
                  Logic_OUT_comb = A & B;
                end    
          2'b01:begin
                  Logic_OUT_comb = A | B;
                end    
          2'b10: begin
                  Logic_OUT_comb = ~(A & B);
                end    
          2'b11: begin
                  Logic_OUT_comb = ~(A | B);
                end
        endcase
      end
	  else
	    begin
		    Logic_OUT_comb = 'b0;
			Logic_Flag = 1'b0;

	    end
  end
  
endmodule