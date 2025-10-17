# RISC-V ALU Project

## Overview
This project implements a **minimal RISC-V Arithmetic Logic Unit (ALU)** in **SystemVerilog**, along with a **fully automated testbench**. The goal is to demonstrate a working combinational ALU capable of executing core RISC-V arithmetic and logic instructions.

The project is entirely **simulated in software** using **Verilator**, meaning no hardware or FPGA is required.

---

## Project Goals

1. **Implement a RISC-V ALU**
   - Support instructions: `ADD`, `SUB`, `AND`, `OR`, `XOR`, `SLL`, `SRL`, `SLT`
   - Provide outputs for `result` and `zero` flag

2. **Design a robust testbench**
   - Validate all supported instructions
   - Compare outputs against expected results
   - Provide readable console output for pass/fail

3. **Simulate the ALU using Verilator**
   - Compile SystemVerilog into a C++ executable
   - Run automated tests without external hardware

---

## Prerequisites

- **OS**: Linux / WSL / macOS
- **Tools**:
  - [Verilator](https://www.veripool.org/verilator/) (v5+)
  - C++ compiler (g++ / clang++)
  - Make utility

- **Knowledge Required**:
  - Basic SystemVerilog syntax and modules
  - Combinational logic
  - Basic C++ (for Verilator simulation)

### Installing Verilator

**Ubuntu/Debian:**
```bash
sudo apt-get install verilator
```

**macOS (Homebrew):**
```bash
brew install verilator
```

**From source:**
```bash
git clone https://github.com/verilator/verilator
cd verilator
autoconf
./configure
make
sudo make install
```

---

## Project Structure

```
riscv_alu/
├── src/
│   └── alu.sv          # ALU module implementing RISC-V operations
├── tb/
│   ├── tb_alu.sv       # SystemVerilog testbench
│   └── sim_main.cpp    # C++ driver for Verilator simulation
├── Makefile            # Build automation
└── README.md           # This file
```

---

## Quick Start

1. **Create the project structure:**
   ```bash
   mkdir -p riscv_alu/{src,tb}
   cd riscv_alu
   ```

2. **Copy the files into their respective directories**

3. **Build and run:**
   ```bash
   make
   ```

That's it! The simulation will automatically build and run all tests.

---

## Usage

### Build Only
```bash
make build
```

### Run Simulation
```bash
make run
```

### Clean Build Artifacts
```bash
make clean
```

### Show Help
```bash
make help
```

---

## ALU Operations

| Operation | Opcode | Description |
|-----------|--------|-------------|
| ADD | `4'b0000` | Addition: `result = rs1 + rs2` |
| SUB | `4'b0001` | Subtraction: `result = rs1 - rs2` |
| AND | `4'b0010` | Bitwise AND: `result = rs1 & rs2` |
| OR | `4'b0011` | Bitwise OR: `result = rs1 \| rs2` |
| XOR | `4'b0100` | Bitwise XOR: `result = rs1 ^ rs2` |
| SLL | `4'b0101` | Shift Left Logical: `result = rs1 << rs2[4:0]` |
| SRL | `4'b0110` | Shift Right Logical: `result = rs1 >> rs2[4:0]` |
| SLT | `4'b0111` | Set Less Than: `result = (rs1 < rs2) ? 1 : 0` |

### Additional Output
- **zero**: Flag that indicates if `result == 0`

---

## Expected Output

When you run `make`, you should see output similar to:

```
===========================================
Starting RISC-V ALU Simulation
===========================================
ADD Test: rs1=10 + rs2=5 = 15 | Expected: 15 | PASS
SUB Test: rs1=10 - rs2=5 = 5  | Expected: 5  | PASS
AND Test: rs1=10 & rs2=5 = 0  | Expected: 0  | PASS
OR Test:  rs1=10 | rs2=5 = 15 | Expected: 15 | PASS
XOR Test: rs1=10 ^ rs2=5 = 15 | Expected: 15 | PASS
SLL Test: rs1=10 << 1 = 20    | Expected: 20 | PASS
SRL Test: rs1=10 >> 1 = 5     | Expected: 5  | PASS
SLT Test: rs1=3 < rs2=5 = 1   | Expected: 1  | PASS
SLT Test: rs1=5 < rs2=3 = 0   | Expected: 0  | PASS
ZERO Test: rs1=5 - rs2=5 = 0, zero=1 | PASS
===========================================
ALU Simulation Complete
===========================================
```

---

## Roadmap & Next Steps

### Phase 1: Basic ALU Simulation ✓
- Validate ADD, SUB, AND, OR, XOR, SLL, SRL, SLT
- Implement zero flag

### Phase 2: Extended Features
- Add `SLTU` (Set Less Than Unsigned)
- Add `SRA` (Shift Right Arithmetic)
- Add additional RISC-V instructions

### Phase 3: Pipelined ALU
- Introduce 2-stage pipeline
- Explore hazards and stalls
- Add pipeline registers

### Phase 4: Memory Integration
- Connect ALU to instruction memory
- Connect ALU to data memory
- Execute multiple instructions in sequence

### Phase 5: Verification Enhancements
- Add SystemVerilog assertions (SVA)
- Coverage analysis using Verilator
- Randomized testing
- Waveform generation (VCD/FST)

---

## Troubleshooting

### Verilator not found
Make sure Verilator is installed and in your PATH:
```bash
verilator --version
```

### Compilation errors
Ensure all files are in the correct directories as shown in the project structure.

### Simulation doesn't run
Check that the executable has been created:
```bash
ls -la obj_dir/Vtb_alu
```

---

## Learning Outcomes

By completing this project, you will understand:
- SystemVerilog module design and instantiation
- Combinational logic implementation
- Using Verilator for cycle-accurate simulation
- Writing automated testbenches
- Debugging logic in simulation
- RISC-V instruction set architecture basics

---

## References

- [RISC-V ISA Manual](https://riscv.org/technical/specifications/)
- [Verilator User Guide](https://verilator.org/guide/latest/)
- [SystemVerilog IEEE 1800 Standard](https://ieeexplore.ieee.org/document/8299595)
- [RISC-V Green Card](https://inst.eecs.berkeley.edu/~cs61c/fa17/img/riscvcard.pdf)

---

## License

This project is provided for educational purposes.

---

## Contributing

Feel free to extend this project by:
- Adding more ALU operations
- Implementing additional RISC-V instructions
- Creating more comprehensive test cases
- Adding waveform visualization

---

**Happy Learning! 🚀**