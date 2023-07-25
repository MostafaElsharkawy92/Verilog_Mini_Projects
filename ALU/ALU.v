module ALU (
// declare inputs and output ports
input wire [15:0] A,
input wire [15:0] B,
input wire [3:0] ALU_FUN,
input wire       CLK,RST, //clock and reset signal of flip flop

output reg [15:0] ALU_OUT,
output reg        Arith_Flag, Logic_Flag, CMP_Flag, Shift_Flag);

reg [15:0] ALU_OUT_comb; //output of flip flop

// storing ALU output in Flip flop
always @(posedge CLK)
      begin
      if (RST)
          begin
            ALU_OUT <= 16'b0;
            Arith_Flag <= 1'b0;
            Logic_Flag <= 1'b0;
            CMP_Flag <= 1'b0;
            Shift_Flag <= 1'b0;
          end
      else
          begin
            ALU_OUT <= ALU_OUT_comb;
          end
      end

// defining aithmatic, logical, comparison, and shifting requirments of ALU
always @(*)
  begin
    Arith_Flag = 1'b0;
    Logic_Flag = 1'b0;
    CMP_Flag   = 1'b0;
    Shift_Flag = 1'b0;
    case (ALU_FUN)
      //arithmatic requirments
      4'b0000:  begin
                  ALU_OUT_comb = A + B;    // Addition
                  Arith_Flag = 1'b1;
                end
      4'b0001:  begin
                  ALU_OUT_comb = A-B;    //Subtraction
                  Arith_Flag = 1'b1;
                end        
      4'b0010:  begin
                  ALU_OUT_comb = A * B;    // Multiplication
                  Arith_Flag = 1'b1;
                end
      4'b0011:  begin 
                  ALU_OUT_comb = A / B;   // Division
                  Arith_Flag = 1'b1;
                end
      
      //Logic requirements
      4'b0100:  begin
                  ALU_OUT_comb = A & B;        // AND
                  Logic_Flag = 1'b1;
                end
      4'b0101:  begin
                  ALU_OUT_comb = A | B;        // OR
                  Logic_Flag = 1'b1;
                end
      4'b0110:  begin
                  
                  ALU_OUT_comb = ~(A & B);     // NAND
                  Logic_Flag = 1'b1;
                end
      4'b0111:  begin
                  ALU_OUT_comb = ~(A | B);     // NOR
                  Logic_Flag = 1'b1;
                end
      4'b1000:  begin
                  ALU_OUT_comb = A ^ B;       // XOR
                  Logic_Flag = 1'b1;
                end
      4'b1001:  begin                  
                  ALU_OUT_comb = (A ~^ B);    // XNOR
                  Logic_Flag = 1'b1;
                end
                
      //comparison requirements
      4'b1010:  begin                   // equality check
                  CMP_Flag = 1'b1;
                  if (A == B)
                    begin
                      ALU_OUT_comb = 16'd1;
                    end
                  else
                    begin
                      ALU_OUT_comb = 16'd0;
                    end
                end
      
      4'b1011:  begin                   // Greater than check
                  CMP_Flag = 1'b1;
                  if (A > B)
                    begin
                      ALU_OUT_comb = 16'd2;
                    end
                  else
                    begin
                      ALU_OUT_comb = 16'd0;
                    end
                end
      4'b1100:  begin                   // less than check
                  CMP_Flag = 1'b1;
                  if (A < B)
                    begin
                      ALU_OUT_comb = 16'd3;
                    end
                  else
                    begin
                      ALU_OUT_comb = 16'd0;
                    end
                end
      
      //shifting requirements
      4'b1101:  begin
                  ALU_OUT_comb = A >> 1;        // shifting to right
                  Shift_Flag = 1'b1;
                end
      4'b1110:  begin
                  ALU_OUT_comb = A << 1;        // shifting to left
                  Shift_Flag = 1'b1;
                end

      default: ALU_OUT_comb = 16'b0;
    endcase
  end 
  
endmodule