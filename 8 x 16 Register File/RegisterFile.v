module RegisterFile 
#(parameter MEM_DEPTH = 8,					
			MEM_WIDTH = 16,
			ADDR_WIDTH = 3)
(
	input wire [MEM_WIDTH-1:0]  WrData,
	input wire [ADDR_WIDTH-1:0] Address,
	input wire				    WrEn,RdEn,
	input wire 	 			    CLK,RST,
	output reg [MEM_WIDTH-1:0] RdData
);

reg [MEM_WIDTH-1:0] MEM [0:MEM_DEPTH-1];
integer i;

always@(posedge CLK)
	begin
		if (!RST)
			begin
				for (i=0; i < MEM_DEPTH ; i	= i+1)
					begin
						MEM[i]	<='b0;
					end
						RdData 	<='b0;
			end
		else
			begin
				if (WrEn && !RdEn)
					begin
						MEM[Address] <= WrData;
					end
				else if (RdEn && !WrEn)
					begin
						RdData <= MEM[Address];
					end
				
			end
	end
endmodule
