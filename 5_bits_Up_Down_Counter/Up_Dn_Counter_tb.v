`timescale 1us/1ns
module Up_Dn_Counter_tb ();

//declare testbench signals 
reg [4:0]   In_tb;
reg         Load_tb,Up_tb,Down_tb;
reg         CLK_tb;
wire        High_tb,Low_tb;
wire [4:0]  Counter_tb;

//Instantiate module    
Up_Dn_Counter DUT(
.IN(In_tb),
.Load(Load_tb),
.Up(Up_tb),
.Down(Down_tb),
.CLK(CLK_tb),
.High(High_tb),
.Low(Low_tb),
.Counter(Counter_tb));

//Clock generation
always #5 CLK_tb = ~CLK_tb;

//Initial block

initial
begin
    $dumpfile("Counter.vcd");
    $dumpvars;
    //set initial values
    CLK_tb=0;
    In_tb= 5'd13;
    Load_tb = 1'b1;
    Up_tb =1'b0;
    Down_tb =1'b0;
    
    // test cases
    
    // test case 1 --> Load  
    #10

    if (Counter_tb == 5'd13 &&  High_tb == 1'b0 && Low_tb == 1'b0)
        begin
            $display("Test case 1 succedded");
        end
    else
        begin
            $display("Test case 1 failed !!!");
        end
    
    //test case 2 --> down
    #3
    Load_tb = 1'b0;
    Up_tb =1'b0;
    Down_tb =1'b1;
    #7
    if (Counter_tb == 5'd12 &&  High_tb == 1'b0 && Low_tb == 1'b0)
        begin
            $display("Test case 2 succedded");
        end
    else
        begin
            $display("Test case 2 failed !!!");
        end
    //test case 3
    #3
    Load_tb= 1'b0;
    Up_tb=1'b1;
    #7
    if (Counter_tb == 5'd11 && High_tb == 1'b0 && Low_tb == 1'b0)
        begin
            $display("Test case 3 succedded");
        end
    else
        begin
            $display("Test case 3 failed !!!");
        end
    
    #3
    Up_tb = 1'b1;
    Down_tb = 1'b0;
    #7
        if (Counter_tb =='d12 && High_tb == 'd0 && Low_tb == 'd0)
        begin
            $display("Test case 4 succedded");
        end
    else
        begin
            $display("Test case 4 failed !!!");
        end
    
    #3
    Up_tb=1'b1;
    Down_tb = 1'b0;
    #187
    if (Counter_tb =='d31 && High_tb == 'd1 && Low_tb == 'd0)
        begin
            $display("Test case 5 succedded");
        end
    else
        begin
            $display("Test case 5 failed !!!");
        end
    
    #3
    Load_tb =1'b1;
    In_tb = 5'd3;
    #7
    if (Counter_tb =='d3 && High_tb == 'd0 && Low_tb == 'd0)
        begin
            $display("Test case 6 succedded");
        end
    else
        begin
            $display("Test case 6 failed !!!");
        end
    
    #3
    Load_tb =1'b0;
    Up_tb=1'b0;
    Down_tb = 1'b1;
    #27
    if (Counter_tb == 5'd0 && High_tb == 1'b0 && Low_tb == 1'b1)
        begin
            $display("Test case 7 succedded");
        end
    else
        begin
            $display("Test case 7 failed !!!");
        end
        
$finish;
end

endmodule 