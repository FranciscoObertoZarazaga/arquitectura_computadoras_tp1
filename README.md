# ALU Implementation in FPGA

## Description
This project implements an Arithmetic Logic Unit (ALU) in FPGA using VHDL/Verilog. The ALU performs basic arithmetic and logical operations (ADD, SUB, AND, OR, XOR, SRA, SRL, and NOR) on 4-bit signed inputs. It is designed to be parametrizable and is integrated into a top-level module that interfaces with switches and buttons for input control.

## Features
- Parametrizable ALU for 4-bit data.
- Supports 8 operations: ADD, SUB, AND, OR, XOR, SRA, SRL, NOR.
- Top module to handle inputs through switches and buttons.
- Clock Wizard for generating 100 MHz clock.

## Modules
### ALU
- Performs the arithmetic and logical operations.
- Input: 4-bit signed data and 6-bit operation code.
- Output: 4-bit signed result.

### Top Module
- Manages input/output and connects the ALU with external hardware (buttons and switches).
- Uses a Clock Wizard for synchronization.

## Test Benches
- **Testbench for ALU**: Tests ALU with random input data and validates results for all supported operations.
- **Testbench for Top Module**: Simulates interaction with switches and buttons, ensuring proper data load and operation execution.

## How to Run
1. Clone the repository.
2. Open the project in your preferred FPGA development tool (e.g., Vivado).
3. Synthesize and simulate using the provided test benches.
4. Deploy the design on an FPGA board.

## Dependencies
- Vivado or similar FPGA design tools.
- Basic understanding of FPGA development and VHDL/Verilog.
