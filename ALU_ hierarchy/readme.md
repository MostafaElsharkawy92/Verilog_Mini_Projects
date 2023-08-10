# 16-bit ALU
### Introduction:-<br>
ALU_TOP is the fundamental building block of the processor,
which is responsible for carrying out different functions: -
- Arithmetic functions through ARITHMETIC_UNIT block.
- Logic functions through LOGIC_UNIT block.
- Shift functions through SHIFT _UNIT block.
- Comparison functions through CMP_UNIT block.
<br>- And Decoder Unit responsibles for enable which Function to operate
according to the highest Most significant 2-bit of the ALU_FUNC control
bus ALU_FUNC [3:2].

<img width="800" alt="image" src="https://github.com/MostafaElsharkawy92/Verilog_Projects/assets/57779031/afe51a74-a034-4ae1-a428-2a53a50416d0">
<br><br>
**TOP Module (ALU_TOP) Port Description:**<br> <br>
<img width="550" alt="image" src="https://github.com/MostafaElsharkawy92/Verilog_Projects/assets/57779031/ade3a9f7-f025-4dbf-9ca2-1d11e5e90acd">

## Specifications: -
● All Outputs are registered.<br>
● All registers are cleared using Asynchronous active low reset<br>
● Arith_flag is activated "High" only when ALU performs one of
the arithmetic operations (Addition, Subtraction, Multiplication,
division), otherwise "LOW"<br>
● Logic_flag is activated "High" only when ALU performs one of
the Boolean operations (AND, OR, NAND, NOR), otherwise
"LOW"<br>
● CMP_flag is activated "High" only when ALU performs one of
the Comparison operations (Equal, Greater than, less than) or
NOP, otherwise "LOW"<br>
● Shift_flag is activated "High" only when ALU performs one of
the shifting operations (shift right, shift left), otherwise "LOW"<br>
● The ALU function is carried out according to the value of the
ALU_FUN input signal stated in the following table<br>

## ALU_FUN Table
<img width="318" alt="image" src="https://github.com/MostafaElsharkawy92/Verilog_Projects/assets/57779031/c831eebd-f3fa-410a-b0d4-18378b51a69e">
