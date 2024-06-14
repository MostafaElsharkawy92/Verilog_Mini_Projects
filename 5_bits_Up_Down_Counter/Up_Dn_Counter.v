module Up_Dn_Counter
(
    input wire [4:0]    IN,
    input wire          Load,Up,Down,
    input wire          CLK,
    output wire         High,Low,
    output reg  [4:0]   Counter
);

reg [4:0] Counter_comb;

always @(posedge CLK)
    begin
        Counter <= Counter_comb;
    end

always@(*)
    begin
        if (Load)
            begin
                Counter_comb = IN;
            end

        else if (Down && !Low)
            begin
                Counter_comb = Counter - 'd1;
            end

        else if (Up && !High && !Down)
            begin
                Counter_comb = Counter + 'd1;
            end

    end

assign High = (Counter == 'd31);
assign Low = (Counter == 'd0);

endmodule