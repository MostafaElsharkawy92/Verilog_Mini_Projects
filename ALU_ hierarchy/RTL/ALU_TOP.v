module ALU_TOP
// declaring parameters
#(parameter WIDTH_top = 4)
// declaring input and output ports
(
input wire [WIDTH_top-1: 0] A_top,B_top,
input wire [3:0]        ALU_FUN_top,
input wire              CLK_top,RST_top,

output wire [WIDTH_top-1:0]  Arith_OUT_top, Logic_OUT_top, CMP_OUT_top,SHIFT_OUT_top,
output wire                  Carry_OUT_top,
output wire                  Arith_Flag_top, Logic_Flag_top, CMP_Flag_top,SHIFT_Flag_top
);

//declaring internal signals that connects blocks
wire Arith_Enable_top, Logic_Enable_top, CMP_Enable_top, Shift_Enable_top;

//Decoder_Unit instantiation and wiring
Decoder_Unit U_decoder_unit
(
.ALU_FUN(ALU_FUN_top[3:2]),
.Arith_Enable(Arith_Enable_top),
.Logic_Enable(Logic_Enable_top),
.CMP_Enable(CMP_Enable_top),
.Shift_Enable(Shift_Enable_top)
);

//ARITHMETIC_UNIT instantiation and wiring
ARITHMETIC_UNIT #(.WIDTH(WIDTH_top)) U_arithmatic_unit
(
.A(A_top),
.B(B_top),
.ALU_FUN(ALU_FUN_top[1:0]),
.CLK(CLK_top),
.RST(RST_top),
.Arith_Enable(Arith_Enable_top),
.Arith_OUT(Arith_OUT_top),
.Carry_OUT(Carry_OUT_top),
.Arith_Flag(Arith_Flag_top)
);

//LOGIC_UNIT instantiation and wiring
LOGIC_UNIT #(.WIDTH(WIDTH_top)) U_logic_unit
(
.A(A_top),
.B(B_top),
.ALU_FUN(ALU_FUN_top[1:0]),
.CLK(CLK_top),
.RST(RST_top),
.Logic_Enable(Logic_Enable_top),
.Logic_OUT(Logic_OUT_top),
.Logic_Flag(Logic_Flag_top)
);

//SHIFT_UNIT instantiation and wiring
SHIFT_UNIT #(.WIDTH(WIDTH_top)) U_shift_unit
(
.A(A_top),
.B(B_top),
.ALU_FUN(ALU_FUN_top[1:0]),
.CLK(CLK_top),
.RST(RST_top),
.Shift_Enable(Shift_Enable_top),
.SHIFT_OUT(SHIFT_OUT_top),
.SHIFT_Flag(SHIFT_Flag_top)
);


//CMP_UNIT instantiation and wiring
CMP_UNIT #(.WIDTH(WIDTH_top)) U_cmp_unit
(
.A(A_top),
.B(B_top),
.ALU_FUN(ALU_FUN_top[1:0]),
.CLK(CLK_top),
.RST(RST_top),
.CMP_Enable(CMP_Enable_top),
.CMP_OUT(CMP_OUT_top),
.CMP_Flag(CMP_Flag_top)
);

endmodule