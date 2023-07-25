`timescale 1us/1ns
module ALU_tb ();
//declare testbench signals
reg [15:0] A_tb;
reg [15:0] B_tb;
reg [3:0]  ALU_FUN_tb;
reg CLK_tb, RST_tb;

wire [15:0] ALU_OUT_tb;
wire Arith_Flag_tb, Logic_Flag_tb, CMP_Flag_tb, Shift_Flag_tb;

//DUT instantiation
ALU DUT
(.A (A_tb),
 .B (B_tb),
 .ALU_FUN (ALU_FUN_tb),
 .CLK (CLK_tb),
 .RST (RST_tb),
 .ALU_OUT (ALU_OUT_tb),
 .Arith_Flag (Arith_Flag_tb),
 .Logic_Flag (Logic_Flag_tb),
 .CMP_Flag (CMP_Flag_tb),
 .Shift_Flag (Shift_Flag_tb) );

//clock generation
always #5 CLK_tb = ~CLK_tb;

//initial block
initial
  begin
  $dumpfile("ALU.vcd") ;
  $dumpvars ;
  //initial values
  A_tb = 16'd6;
  B_tb = 16'd2;
  ALU_FUN_tb = 4'b0000;
  CLK_tb = 1'b0;
  RST_tb = 1'b0;

  // arithmatic operations check
  
  $display ("TEST CASE 1, ADDITION") ;  // addition Function
    #3
    ALU_FUN_tb = 4'b0000;
    #7
    if(ALU_OUT_tb == 16'd8 && Arith_Flag_tb == 1'b1)
      $display ("TEST CASE 1 IS PASSED") ;
    else
      $display ("TEST CASE 1 IS FAILED") ;
  $display ("TEST CASE 2, SUBTRACTION") ;  // subtraction Function
    #3
    ALU_FUN_tb = 4'b0001;
    #7
    if(ALU_OUT_tb == 16'd4 && Arith_Flag_tb == 1'b1)
      $display ("TEST CASE 2 IS PASSED") ;
    else
      $display ("TEST CASE 2 IS FAILED") ;
      
    $display ("TEST CASE 3, MULTIPLICATION") ;  // Multiplication Function
    #3
    ALU_FUN_tb = 4'b0010;
    #7
    if(ALU_OUT_tb == 16'd12 && Arith_Flag_tb == 1'b1)
      $display ("TEST CASE 3 IS PASSED") ;
    else
      $display ("TEST CASE 3 IS FAILED") ;
  
    $display ("TEST CASE 4, DIVISION") ;  // division Function
    #3
    ALU_FUN_tb = 4'b0011;
    #7
    if(ALU_OUT_tb == 16'd3 && Arith_Flag_tb == 1'b1)
      $display ("TEST CASE 4 IS PASSED") ;
    else
      $display ("TEST CASE 4 IS FAILED") ;

    // logical operations check
    
    $display ("TEST CASE 5, AND") ;  // AND Operation
    #3
    ALU_FUN_tb = 4'b0100;
    #7
    if(ALU_OUT_tb == 16'b10 && Logic_Flag_tb == 1'b1)
      $display ("TEST CASE 5 IS PASSED") ;
    else
      $display ("TEST CASE 5 IS FAILED") ;

    $display ("TEST CASE 6, OR") ;  // OR Operation
    #3
    ALU_FUN_tb = 4'b0101;
    #7
    if(ALU_OUT_tb == 16'b110 && Logic_Flag_tb == 1'b1)
      $display ("TEST CASE 6 IS PASSED") ;
    else
      $display ("TEST CASE 6 IS FAILED") ;    
    
    $display ("TEST CASE 7, NAND") ;  // NAND Operation
    #3
    ALU_FUN_tb = 4'b0110;
    #7
    if(ALU_OUT_tb == 16'b1111111111111101 && Logic_Flag_tb == 1'b1)
      $display ("TEST CASE 7 IS PASSED") ;
    else
      $display ("TEST CASE 7 IS FAILED") ;

    $display ("TEST CASE 8, NOR") ;  // NOR Operation
    #3
    ALU_FUN_tb = 4'b0111;
    #7
    if(ALU_OUT_tb == 16'b1111111111111001 && Logic_Flag_tb == 1'b1)
      $display ("TEST CASE 8 IS PASSED") ;
    else
      $display ("TEST CASE 8 IS FAILED") ;
  
    $display ("TEST CASE 9, XOR") ;  // XOR Operation
    #3
    ALU_FUN_tb = 4'b1000;
    #7
    if(ALU_OUT_tb == 16'b100 && Logic_Flag_tb == 1'b1)
      $display ("TEST CASE 9 IS PASSED") ;
    else
      $display ("TEST CASE 9 IS FAILED") ;

    $display ("TEST CASE 10, XNOR") ;  // XNOR Operation
    #3
    ALU_FUN_tb = 4'b1001;
    #7
    if(ALU_OUT_tb == 16'b1111111111111011 && Logic_Flag_tb == 1'b1)
      $display ("TEST CASE 10 IS PASSED") ;
    else
      $display ("TEST CASE 10 IS FAILED") ;

  // Comparison operations check
    $display ("TEST CASE 11, equal") ;  // equal Operation
    #3
    ALU_FUN_tb = 4'b1010;
    #7
    if(ALU_OUT_tb == 16'b0 && CMP_Flag_tb == 1'b1)
      $display ("TEST CASE 11 IS PASSED") ;
    else
      $display ("TEST CASE 11 IS FAILED") ;
  
    $display ("TEST CASE 12, Greater than") ;  // Greater than Operation
    #3
    ALU_FUN_tb = 4'b1011;
    #7
    if(ALU_OUT_tb == 16'd2 && CMP_Flag_tb == 1'b1)
      $display ("TEST CASE 12 IS PASSED") ;
    else
      $display ("TEST CASE 12 IS FAILED") ;


    $display ("TEST CASE 13, less than") ;  // less than Operation
    #3
    ALU_FUN_tb = 4'b1100;
    #7
    if(ALU_OUT_tb == 16'b0 && CMP_Flag_tb == 1'b1)
      $display ("TEST CASE 13 IS PASSED") ;
    else
      $display ("TEST CASE 13 IS FAILED") ;

    //Shifting operations
    
    $display ("TEST CASE 14, >>1") ;  // shifting to right 1 bit
    #3
    ALU_FUN_tb = 4'b1101;
    #7
    if(ALU_OUT_tb == 16'd3 && Shift_Flag_tb == 1'b1)
      $display ("TEST CASE 14 IS PASSED") ;
    else
      $display ("TEST CASE 14 IS FAILED") ; 
  
    $display ("TEST CASE 15, <<1") ;  // shifting to left 1 bit
    #3
    ALU_FUN_tb = 4'b1110;
    #7
    if(ALU_OUT_tb == 16'd12 && Shift_Flag_tb == 1'b1)
      $display ("TEST CASE 15 IS PASSED") ;
    else
      $display ("TEST CASE 15 IS FAILED") ; 
      
    // RESET Case
 
    $display ("TEST CASE 16, RST") ;  // RST
    #3
    RST_tb= 1'b1;
    #7   
    if(ALU_OUT_tb == 16'b0 && RST_tb == 1'b1)
      $display ("TEST CASE 16 IS PASSED") ;
    else
      $display ("TEST CASE 16 IS FAILED") ;      

    // Different ALU FUN Code
 
    $display ("TEST CASE 17, Different ALU_FUN code") ;  // RST
    #3
    ALU_FUN_tb = 4'b1111;
    #7
    if(ALU_OUT_tb == 16'b0 && Arith_Flag_tb == 1'b0 && Logic_Flag_tb== 1'b0 && CMP_Flag_tb== 1'b0 && Shift_Flag_tb == 1'b0)
      $display ("TEST CASE 17 IS PASSED") ;
    else
      $display ("TEST CASE 17 IS FAILED") ;  

    #30
    $finish ;
  
  end
  
endmodule