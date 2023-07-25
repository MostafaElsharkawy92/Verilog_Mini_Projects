#Introduction
ALU is the fundamental building block of the processor, which is responsible for carrying out the arithmetic, logic functions,
Shift functions and Comparison functions.
#
Specification:
### ● ALU Operands (A, B)
### ● ALU Result (ALU_OUT)
### ● ALU operands and output Result are of 16-bit width.
### ● ALU Result (ALU_OUT) is registered.
### ● The ALU function is carried out according to the value of the ALU_FUN input signal stated in the table in the following page and any other value for ALU_FUN not stated in the table, ALU_OUT must equal to 16’b0
### ● Arith_flag is activated "High" only when ALU performs one of the arithmetic operations (Addition, Subtraction, Multiplication, division), otherwise "LOW"
### ● Logic_flag is activated "High" only when ALU performs one of the Boolean operations (AND, OR, NAND, NOR, XOR, XNOR), otherwise "LOW"
### ● CMP_flag is activated "High" only when ALU performs one of the Comparison operations (Equal, Greater than, less than), otherwise "LOW"
### ● Shift_flag is activated "High" only when ALU performs one of the shifting operations (shift right, shift left),otherwise "LOW"
