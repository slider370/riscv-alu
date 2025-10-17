# Makefile for RISC-V ALU Project

# Configuration
VERILATOR = verilator
TOP = tb_alu
SV_SRCS = ./src/alu.sv ./tb/tb_alu.sv
CPP_SRCS = ./tb/sim_main.cpp
OBJ_DIR = obj_dir

# Verilator flags
VFLAGS = -Wall --cc --exe --build --timing --top-module $(TOP)

# Default target
.PHONY: all
all: run

# Build the simulation executable
.PHONY: build
build:
	@echo "Building RISC-V ALU simulation..."
	$(VERILATOR) $(VFLAGS) $(SV_SRCS) $(CPP_SRCS)

# Run the simulation
.PHONY: run
run: build
	@echo ""
	@echo "Running simulation..."
	@echo ""
	./$(OBJ_DIR)/V$(TOP)

# Clean build artifacts
.PHONY: clean
clean:
	@echo "Cleaning build artifacts..."
	rm -rf $(OBJ_DIR) *.vcd *.fst

# Help target
.PHONY: help
help:
	@echo "RISC-V ALU Project Makefile"
	@echo ""
	@echo "Targets:"
	@echo "  all     - Build and run simulation (default)"
	@echo "  build   - Compile SystemVerilog with Verilator"
	@echo "  run     - Run the simulation"
	@echo "  clean   - Remove build artifacts"
	@echo "  help    - Show this help message"