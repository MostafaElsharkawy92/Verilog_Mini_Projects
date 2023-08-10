module ARITHMETIC_UNIT
// declaring parameterized width
#(parameter WIDTH = 4)
// declaring input and outpur ports
(
input wire [WIDTH-1: 0] A,B,
input wire [1:0]        ALU_FUN,
input wire              CLK, Arith_Enable,RST,

output reg [WIDTH-1: 0] Arith_OUT,
output reg              Carry_OUT,
output reg              Arith_Flag  
);
//declare internal signals
reg [WIDTH-1: 0] Arith_OUT_comb;

// storing in Active low Ascynchronous register
always@(posedge CLK)
  begin
    if(!RST)
      begin
        Arith_OUT  <= 'b0;
        Arith_Flag <= 'b0;
        Carry_OUT  <= 'b0;
      end
    else
      begin
        Arith_OUT  <= Arith_OUT_comb;
      end
  end

// Arithmatic operations
always@(*)
  begin
    if(Arith_Enable)
      begin
        Arith_Flag = 1'b1;
        case(ALU_FUN)
          2'b00:begin
                  {Carry_OUT,Arith_OUT_comb} = A + B;
                end    
          2'b01:begin
                  {Carry_OUT,Arith_OUT_comb} = A - B;
                end    
          2'b10: begin
                  {Carry_OUT,Arith_OUT_comb} = A * B;
                end    
          2'b11: begin
                  {Carry_OUT,Arith_OUT_comb} = A / B;
                end
        endcase
      end
	  else
	    begin
			Arith_Flag = 1'b0; 
		    Arith_OUT_comb = 'b0;
	    end
  end
  
endmodule