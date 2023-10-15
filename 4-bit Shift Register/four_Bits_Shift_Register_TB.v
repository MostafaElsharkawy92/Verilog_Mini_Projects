`timescale 1us/1ns
module four_Bits_Shift_Register_TB ();

//Declare testbench signals
reg shift_in_tb;
reg CLK_tb;
wire shift_out_tb;

//Clock generation
always#5 CLK_tb=~CLK_tb;

//DUT instantiation
four_Bits_Shift_Register DUT(
.shift_in(shift_in_tb),
.CLK(CLK_tb),
.shift_out(shift_out_tb)
);

//initial block
initial
	begin
		$dumpfile("tb_records_file.vcd");
		$dumpvars;
		CLK_tb='b0;
		shift_in_tb=1'b0;
		
		repeat (4)@(posedge CLK_tb);
		#3
		
		if (DUT.bits[3:0] == 4'b0000)
		  begin
		    $display ("Test Case 1 Succeeded");
		  end
		else
		  begin
			  $display ("Test Case 1 failed");
		  end
		shift_in_tb=1'b1;
		
		repeat (2)@(posedge CLK_tb);
		#3
		if (DUT.bits[3:0] == 4'b0011)
			   $display ("Test Case 2 Succeeded");
		else
			   $display ("Test Case 2 failed");		
				
		repeat(2)@(posedge CLK_tb);
		#3
		if (DUT.bits[3:0]==4'b1111)
		  begin
			   $display ("Test Case 3 Succeeded");
		  end
		else
		  begin
		     $display ("Test Case 3 failed");
		  end		
		
		shift_in_tb=1'b0;
		repeat(4)@(posedge CLK_tb);
		#3
		if (DUT.bits[3:0]==4'b0000)
		  begin
			   $display ("Test Case 4 Succeeded");
		  end
		else
		  begin
		     $display ("Test Case 4 failed");
		  end	
		#200
		$finish;
	end
endmodule