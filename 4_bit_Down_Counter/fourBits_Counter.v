module fourBits_Counter
(
	input wire [3:0] IN,
	input wire 		 Latch,
	input wire		 dec,
	input wire 		 clk,
	output reg 	 zero
);

reg [3:0] count_tmp;
reg [3:0] count;

always@(posedge clk)
	begin
	  count <= count_tmp;
	end

always@(*)
	begin
		if(Latch)
			count_tmp=IN;
		else if(dec && !zero)
			count_tmp=count-4'b0001;
		else
			count_tmp=count;
	end
	
always@(*)
	begin
		if(count==4'b0000)
		   zero=1'b1;
		else
		   zero=1'b0;
	end
	
endmodule