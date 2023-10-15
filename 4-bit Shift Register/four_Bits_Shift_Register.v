module four_Bits_Shift_Register

//ports declarations
(
	input 	 shift_in,
	input 	 CLK,
	output	 shift_out	
);

reg [3:0] bits;
assign shift_out = bits[3];

always@(posedge CLK)
	begin
		bits[0] <= shift_in;
		bits[1] <= bits[0];
		bits[2] <= bits[1];
		bits[3] <= bits[2];
	end
	
endmodule
