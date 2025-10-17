#include "Vtb_alu.h"
#include "verilated.h"

vluint64_t main_time = 0;

double sc_time_stamp() {
    return main_time;
}

int main(int argc, char **argv) {
    // Initialize Verilator
    VerilatedContext* contextp = new VerilatedContext;
    contextp->commandArgs(argc, argv);
    
    // Create instance of testbench
    Vtb_alu* tb = new Vtb_alu{contextp};
    
    // Run simulation - for timing mode, just eval until done
    while (!contextp->gotFinish()) {
        // Evaluate model
        tb->eval();
        
        // Advance time
        main_time++;
        contextp->timeInc(1);
    }
    
    // Final model cleanup
    tb->final();
    
    // Destroy model and context
    delete tb;
    delete contextp;
    
    return 0;
}