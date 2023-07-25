module DigCt
(IN1,IN2,IN3,IN4,IN5,CLK,OUT1,OUT2,OUT3);

input IN1,IN2,IN3,IN4,IN5;
input CLK;
output OUT1,OUT2,OUT3;
reg D11,D12,D2,D31,D32,OUT1,OUT2,OUT3;

always@(IN1,IN2)
	begin
		D11=~(IN1|IN2);
	end
always@(D11,IN3)
	begin
		D12=~(D11&IN3);
	end

always@(IN2,IN3)
	begin
		D2=~(IN2&IN3);
	end

always@(IN3,IN4)
	begin
		D31 = IN3|(~IN4);
	end
always@(D31,IN5)
	begin
		D32 = D31|IN5;
	end

//Sequential 

always@(posedge CLK)
	begin
		OUT1 <= D12;
	end
always@(posedge CLK)
	begin
		OUT2 <= D2;
	end
always@(posedge CLK)
	begin
		OUT3 <= D32;
	end
endmodule
