`timescale 1us/1ns 
module ALU_TOP_tb #(parameter WIDTH_top = 4) ();

// Declare testbench signals
reg [WIDTH_top-1: 0]  A_tb, B_tb;
reg [3:0]             ALU_FUN_tb;
reg                   CLK_tb, RST_tb;
wire [WIDTH_top-1: 0] Arith_OUT_tb, Logic_OUT_tb, CMP_OUT_tb, SHIFT_OUT_tb;
wire                  Carry_OUT_tb;
wire                  Arith_Flag_tb, Logic_Flag_tb, CMP_Flag_tb, SHIFT_Flag_tb;

//assign 4 bit array for flags fof simpler code
wire [3:0]			  flags;
assign flags ={Arith_Flag_tb, Logic_Flag_tb, CMP_Flag_tb, SHIFT_Flag_tb};

//clock generation
always
   begin
      CLK_tb = 1'b0;
      #4
      CLK_tb = 1'b1;
      #6;
   end
    
//DUT instantiation
ALU_TOP DUT
(
.A_top  (A_tb),
.B_top  (B_tb),
.ALU_FUN_top  (ALU_FUN_tb),
.CLK_top  (CLK_tb),
.RST_top  (RST_tb),
.Arith_OUT_top  (Arith_OUT_tb),
.Logic_OUT_top  (Logic_OUT_tb),
.CMP_OUT_top    (CMP_OUT_tb),
.SHIFT_OUT_top  (SHIFT_OUT_tb),
.Carry_OUT_top  (Carry_OUT_tb),
.Arith_Flag_top (Arith_Flag_tb),
.Logic_Flag_top (Logic_Flag_tb),
.CMP_Flag_top   (CMP_Flag_tb),
.SHIFT_Flag_top (SHIFT_Flag_tb)
);

//Initial Block
initial
  begin
    $dumpfile("ALU_top.vcd");
    $dumpvars;
    //initial values
    A_tb = 'd6;
    B_tb = 'd2;
    ALU_FUN_tb = 4'b0000;
    CLK_tb = 1'b0;
    RST_tb = 1'b1;
    
    //Arithmatic unit tests
    $display("------------Arithmatic Unit test-----------");
    
    #2                      // Addition without carry
    ALU_FUN_tb = 4'b0000;
    #8
    if (Arith_OUT_tb == 'd8 && Carry_OUT_tb == 1'b0 &&flags ==4'b1000 && DUT.Arith_Enable_top == 1'b1 && RST_tb != 1'b0)
        $display ("Test 1: Addition without carry PASSED");
    else
        $display ("Test 1: Addition without carry FAILED");
    
    #2                    // Addition with carry
    ALU_FUN_tb = 4'b0000;
    A_tb = 'd6;
    B_tb = 'd12;
    #8
    if (Arith_OUT_tb == 4'b0010 && Carry_OUT_tb == 1'b1 && flags ==4'b1000 && DUT.Arith_Enable_top == 1'b1 && RST_tb!=1'b0)
        $display ("Test 2: Addition with carry PASSED");
    else
        $display ("Test 2: Addition with carry FAILED");
    
    #2                    // Subtraction
    ALU_FUN_tb = 4'b0001;
    A_tb = 'd6;
    B_tb = 'd2;
    #8
    if (Arith_OUT_tb == 'd4 && Carry_OUT_tb == 1'b0 && flags ==4'b1000 && DUT.Arith_Enable_top == 1'b1 && RST_tb!=1'b0)
        $display ("Test 3: Subtraction PASSED");
    else
        $display ("Test 3: Subtraction FAILED");    

    #2                    // Multiplication
    ALU_FUN_tb = 4'b0010;
    A_tb = 'd6;
    B_tb = 'd2;
    #8
    if (Arith_OUT_tb == 'd12 && Carry_OUT_tb == 1'b0 && flags ==4'b1000 && DUT.Arith_Enable_top == 1'b1 && RST_tb!=1'b0)
        $display ("Test 4: Multiplication PASSED");
    else
        $display ("Test 4: Multiplication FAILED");
    

    #2                    // Division
    ALU_FUN_tb = 4'b0011;
    A_tb = 'd6;
    B_tb = 'd2;
    #8
    if (Arith_OUT_tb == 'd3 && Carry_OUT_tb == 1'b0 && flags ==4'b1000 && DUT.Arith_Enable_top == 1'b1 && RST_tb!=1'b0)
        $display ("Test 5: Division PASSED");
    else
        $display ("Test 5: Division FAILED"); 

    //Logic unit tests
    $display("-----------Logic Unit Test-------------");
    
    #2                    // And
    ALU_FUN_tb = 4'b0100;
    A_tb = 'd6;
    B_tb = 'd2;
    #8
    if (Logic_OUT_tb == 4'b0010 && flags ==4'b0100 && DUT.Logic_Enable_top == 1'b1 && RST_tb!=1'b0)
        $display ("Test 6: AND PASSED");
    else
        $display ("Test 6: AND FAILED");     
 
    #2                    // OR
    ALU_FUN_tb = 4'b0101;
    A_tb = 'd6;
    B_tb = 'd2;
    #8
    if (Logic_OUT_tb == 4'b0110 && flags ==4'b0100 && DUT.Logic_Enable_top == 1'b1 && RST_tb!=1'b0)
        $display ("Test 7: OR PASSED");
    else
        $display ("Test 7: OR FAILED");
 
    #2                    // NAND
    ALU_FUN_tb = 4'b0110;
    A_tb = 'd6;
    B_tb = 'd2;
    #8                      
    if (Logic_OUT_tb == 4'b1101 && flags ==4'b0100 && DUT.Logic_Enable_top == 1'b1 && RST_tb!=1'b0)
        $display ("Test 8: NAND PASSED");
    else
        $display ("Test 8: NAND FAILED");   
    
    #2                    // NOR
    ALU_FUN_tb = 4'b0111;
    A_tb = 'd6;
    B_tb = 'd2;
    #8                      
    if (Logic_OUT_tb == 4'b1001 && flags ==4'b0100 && DUT.Logic_Enable_top == 1'b1 && RST_tb!=1'b0)
        $display ("Test 9: NOR PASSED");
    else
        $display ("Test 9: NOR FAILED"); 
  
    //Compare unit tests
    $display("-----------Comopare Unit Test-------------");
    
    #2                    // NOP (No Operation)
    ALU_FUN_tb = 4'b1000;
    A_tb = 'd6;
    B_tb = 'd2;
    #8                      
    if (CMP_OUT_tb == 4'b0 && flags ==4'b0010 && DUT.CMP_Enable_top == 1'b1 && RST_tb!=1'b0)
        $display ("Test 10: No Operation PASSED");
    else
        $display ("Test 10: NO Operation FAILED"); 	

    #2                    // Equal (!)
    ALU_FUN_tb = 4'b1001;
    A_tb = 'd6;
    B_tb = 'd2;
    #8                      
    if (CMP_OUT_tb == 4'b0 && flags ==4'b0010 && DUT.CMP_Enable_top == 1'b1 && RST_tb!=1'b0)
        $display ("Test 11: Equal (!) PASSED");
    else
        $display ("Test 11: Equal (!) FAILED"); 	

    #2                    // Equal (=)
    ALU_FUN_tb = 4'b1001;
    A_tb = 'd6;
    B_tb = 'd6;
    #8                      
    if (CMP_OUT_tb == 'd1 && flags ==4'b0010 && DUT.CMP_Enable_top == 1'b1 && RST_tb!=1'b0)
        $display ("Test 12: Equal (=) PASSED");
    else
        $display ("Test 12: Equal (=) FAILED"); 	

    #2                    // Greater than
    ALU_FUN_tb = 4'b1010;
    A_tb = 'd6;
    B_tb = 'd2;
    #8                      
    if (CMP_OUT_tb == 'd2 && flags ==4'b0010 && DUT.CMP_Enable_top == 1'b1 && RST_tb!=1'b0)
        $display ("Test 13: Greater than PASSED");
    else
        $display ("Test 13: Greater than FAILED"); 		

    #2                    // Greater than (!)
    ALU_FUN_tb = 4'b1010;
    A_tb = 'd2;
    B_tb = 'd6;
    #8                      
    if (CMP_OUT_tb == 'd0 && flags ==4'b0010 && DUT.CMP_Enable_top == 1'b1 && RST_tb!=1'b0)
        $display ("Test 14: Greater than (!) PASSED");
    else
        $display ("Test 14: Greater than (!) FAILED"); 		

    #2                    // less than
    ALU_FUN_tb = 4'b1011;
    A_tb = 'd2;
    B_tb = 'd6;
    #8                      
    if (CMP_OUT_tb == 'd3 && flags ==4'b0010 && DUT.CMP_Enable_top == 1'b1 && RST_tb!=1'b0)
        $display ("Test 15: less than PASSED");
    else
        $display ("Test 15: less than FAILED"); 		

    #2                    // less than
    ALU_FUN_tb = 4'b1011;
    A_tb = 'd6;
    B_tb = 'd2;
    #8                      
    if (CMP_OUT_tb == 'd0 && flags ==4'b0010 && DUT.CMP_Enable_top == 1'b1 && RST_tb!=1'b0)
        $display ("Test 16: less than (!) PASSED");
    else
        $display ("Test 16: less than (!) FAILED"); 		

    //Shifting unit tests
    $display("-----------Shifting Unit Test-------------");
	
    #2                    // A >> 1
    ALU_FUN_tb = 4'b1100;
    A_tb = 'd6;
    B_tb = 'd2;
    #8                      
    if (SHIFT_OUT_tb == 4'b0011 && flags ==4'b0001 && DUT.Shift_Enable_top == 1'b1 && RST_tb!=1'b0)
        $display ("Test 17: A >> 1 PASSED");
    else
        $display ("Test 17: A >> 1 FAILED"); 		


    #2                    // A << 1
    ALU_FUN_tb = 4'b1101;
    A_tb = 'd6;
    B_tb = 'd2;
    #8                      
    if (SHIFT_OUT_tb == 4'b1100 && flags ==4'b0001 && DUT.Shift_Enable_top == 1'b1 && RST_tb!=1'b0)
        $display ("Test 18: A << 1 PASSED");
    else
        $display ("Test 18: A << 1 FAILED"); 		


    #2                    // B >> 1
    ALU_FUN_tb = 4'b1110;
    A_tb = 'd6;
    B_tb = 'd2;
    #8                      
    if (SHIFT_OUT_tb == 4'b0001 && flags ==4'b0001 && DUT.Shift_Enable_top == 1'b1 && RST_tb!=1'b0)
        $display ("Test 19: B >> 1 PASSED");
    else
        $display ("Test 19: B >> 1 FAILED"); 	
	
    #2                    // B << 1
    ALU_FUN_tb = 4'b1111;
    A_tb = 'd6;
    B_tb = 'd2;
    #8                      
    if (SHIFT_OUT_tb == 'd4 && flags ==4'b0001 && DUT.Shift_Enable_top == 1'b1 && RST_tb!=1'b0)
        $display ("Test 20: B << 1 PASSED");
    else
        $display ("Test 20: B << 1 FAILED"); 
		
	//Reset test
    $display("-----------Reset test-------------");
	    
	#2                    // Reset test
	RST_tb = 1'b0;	
    #8                      
    if (Arith_OUT_tb == 0 && Logic_OUT_tb == 0 && CMP_OUT_tb == 0 && SHIFT_OUT_tb == 0 && flags ==4'b0000 &&  Carry_OUT_tb == 0)
        $display ("Test 21: Reset test PASSED");
    else
        $display ("Test 21: Reset test FAILED"); 
		
    $finish ;    
  end
endmodule