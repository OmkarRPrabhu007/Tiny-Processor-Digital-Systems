# Tiny Processor Design and FPGA Implementation

## Overview

This repository contains the Verilog codes, testbenches, block diagrams, and simulation results for the "Tiny" Processor Design project, along with additional tasks involving FSM detection, register file extensions, and multipliers. The final FPGA implementation and demonstrations are also included.

## Contents

1. **Final Demo: Tiny Processor Design**
    - **Verilog Codes**: Implementation of the Tiny Processor with 16 8-bit registers.
    - **Testbench**: Testbench for verifying the processor design.
    - **XDC Files**: Constraints files for FPGA implementation.
    - **Block Diagram**: Shows the interaction between all Verilog modules.
    - **Simulation Results**: Outputs from the simulation.
    - **FPGA Implementation Video**: Demonstrates the processor running a program with at least 4 instructions.
    - **Processor Details**: Executes instructions using register file and accumulator, includes extended register for multiplication/division, and carry/borrow register for addition/subtraction.

2. **FSM Detection (Moore and Mealy Machine)**
    - **Verilog Codes**: Implementation of Moore and Mealy machines to detect the sequence 10010.
    - **Testbench**: Verification of FSM designs.
    - **Simulation Results**: Outputs from the simulation.
    - **FPGA Implementation**: Demonstration of the FSM on FPGA, using switches for input and LEDs for output.

3. **Dual-Port Register File with ALU Integration**
    - **Verilog Codes**: Extension of 8-register file to 16 registers with dual-port read capability.
    - **Testbench**: Verification of the dual-port register file and ALU operations.
    - **Simulation Results**: Outputs from the simulation.
    - **FPGA Implementation**: Demonstration of the design on FPGA.

4. **8-bit Multipliers**
    - **Verilog Codes**: Implementation of 8-bit x 8-bit array multiplier and binary multiplier.
    - **Testbench**: Verification of both multipliers.
    - **Simulation Results**: Comparison of array and binary multipliers.
    - **FPGA Implementation**: Demonstration of 4-bit designs on FPGA.

## Course 
This project was completed as part of the Digital Systems course at the Indian Institute of Technology Gandhinagar (IIT Gandhinagar) under the guidance of [Prof. Joycee Mekie](https://joycee.people.iitgn.ac.in/).
