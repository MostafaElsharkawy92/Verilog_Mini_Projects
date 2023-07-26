### Overview
<img width="358" alt="2" src="https://github.com/MostafaElsharkawy92/Verilog_Projects/assets/57779031/fcc04041-c6eb-4f10-b69e-2bc3e68450ea">


### Introduction
ALU is the fundamental building block of the processor, which is responsible for carrying out the arithmetic, logic functions,
Shift functions and Comparison functions.

### Specification:
● ALU Operands (A, B)<br/>
● ALU Result (ALU_OUT)<br/>
● ALU operands and output Result are of 16-bit width.<br/>
● ALU Result (ALU_OUT) is registered.<br/>
● The ALU function is carried out according to the value of the ALU_FUN input signal stated in the table in the following page and any other value for ALU_FUN not stated in the table, ALU_OUT must equal to 16’b0<br/>
● Arith_flag is activated "High" only when ALU performs one of the arithmetic operations (Addition, Subtraction, Multiplication, division), otherwise "LOW"<br/>
● Logic_flag is activated "High" only when ALU performs one of the Boolean operations (AND, OR, NAND, NOR, XOR, XNOR), otherwise "LOW"<br/>
● CMP_flag is activated "High" only when ALU performs one of the Comparison operations (Equal, Greater than, less than), otherwise "LOW"<br/>
● Shift_flag is activated "High" only when ALU performs one of the shifting operations (shift right, shift left), otherwise "LOW"<br/>
● clock frequency 100 KHz  
\
<img width="355" alt="1" src="https://github.com/MostafaElsharkawy92/Verilog_Projects/assets/57779031/ec4084bb-d0ea-4e21-8fa7-b822f4fc1507">

<img width="358" alt="2" src="https://github.com/MostafaElsharkawy92/Verilog_Projects/assets/57779031/fcc04041-c6eb-4f10-b69e-2bc3e68450ea">

What I covered:
1. Verilog code that satisfies the requirements. (ALU.v)
2. Testbench that checks all conditions are satisfied and functions works as expected. (ALU_tb.v)
3. Synthesis diagram using draw.io (as follows: 

<img width="590" alt="ALU" src="https://github.com/MostafaElsharkawy92/Verilog_Projects/assets/57779031/de4f12b4-861f-4bf0-a561-4e16b683470c">

<img width="319" alt="Flags" src="https://github.com/MostafaElsharkawy92/Verilog_Projects/assets/57779031/d53baa59-453f-40ad-aa68-e75710fccebc">


