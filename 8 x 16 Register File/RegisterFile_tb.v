`timescale 1us/1ns
module RegisterFile_tb 
#(parameter MEM_DEPTH_tb  = 8,
			MEM_WIDTH_tb  = 16,
			ADDR_WIDTH_tb = 3)
();

//declare testbench signals
reg [MEM_WIDTH_tb-1:0] 	WrData_tb;
reg [ADDR_WIDTH_tb-1:0] Address_tb;
reg				    	WrEn_tb,RdEn_tb;
reg 	 			    CLK_tb,RST_tb;
wire [MEM_WIDTH_tb-1:0] RdData_tb;

//Clock generation
always #5 CLK_tb = ~CLK_tb;

//module instantiation
RegisterFile #(.MEM_DEPTH(MEM_DEPTH_tb),.MEM_WIDTH(MEM_WIDTH_tb),.ADDR_WIDTH(ADDR_WIDTH_tb)) DUT
(
.WrData(WrData_tb),
.Address(Address_tb),
.WrEn(WrEn_tb),
.RdEn(RdEn_tb),
.CLK(CLK_tb),
.RST(RST_tb),
.RdData(RdData_tb)
);

//declaring integers will be used later in tb
integer k;
integer sum = 0;

//initial block
initial
	begin
		$dumpfile("RegisterFile.vcd");
		$dumpvars;
		//initial values
		CLK_tb ='b0;
		RST_tb ='b1;
		WrEn_tb='b0;
		RdEn_tb='b0;
		WrData_tb = 'b0;
		Address_tb='d0;
		
		$display ("------Test case 1-------"); // Writing and check
		#2
		WrData_tb='d240;
		Address_tb='d3;
		WrEn_tb=1'b1;
		RdEn_tb=1'b0;
		#8
		if(DUT.MEM[Address_tb]==WrData_tb)
			$display("Test case 1:Writing PASSED");
		else
			$display("Test case 1:Writing FAILED");

		$display ("------Test case 2-------"); // Writing and check
		#2
		WrData_tb='d100;
		Address_tb='d5;
		WrEn_tb=1'b1;
		RdEn_tb=1'b0;
		#8
		if(DUT.MEM[Address_tb]==WrData_tb)
			$display("Test case 2:Writing PASSED");
		else
			$display("Test case 2:Writing FAILED");
		
		$display ("------Test case 3-------"); // ovrewriting and check
		#2
		WrData_tb='d150;
		Address_tb='d5;
		WrEn_tb=1'b1;
		RdEn_tb=1'b0;
		#8
		if(DUT.MEM[Address_tb]==WrData_tb)
			$display("Test case 3:Overwriting PASSED");
		else
			$display("Test case 3:Overwriting FAILED");


		$display ("------Test case 4-------"); // Reading and check
		#2
		Address_tb='d5;
		RdEn_tb=1'b1;
		WrEn_tb=1'b0;
		#8
		if(RdData_tb==DUT.MEM[Address_tb])
			$display("Test case 4:Reading PASSED");
		else
			$display("Test case 4:Reading FAILED");	
			

		$display ("------Test case 5-------"); // Reading again and check
		#2
		Address_tb='d3;
		RdEn_tb=1'b1;
		WrEn_tb=1'b0;
		#8
		if(RdData_tb==DUT.MEM[Address_tb])
			$display("Test case 5:Reading PASSED");
		else
			$display("Test case 5:Reading FAILED");	

	
		$display ("------Test case 6-------"); // Reset
		#2
		RST_tb=1'b0;
		#8
		for (k=0 ; k<MEM_DEPTH_tb; k=k+1)
			begin
				sum = sum + DUT.MEM[k];
			end
		if(sum=='b0 && RdData_tb=='b0)
			$display("Test case 6:Reset PASSED");
		else
			$display("Test case 6:Reset FAILED");	

		$finish;
	end

endmodule