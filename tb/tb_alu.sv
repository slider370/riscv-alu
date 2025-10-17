module tb_alu;
  logic [31:0] rs1, rs2;
  logic [ 3:0] alu_op;
  logic [31:0] result;
  logic        zero;

  int          tests_passed = 0;
  int          tests_total = 0;

  // Instantiate ALU
  alu dut (
      .rs1(rs1),
      .rs2(rs2),
      .alu_op(alu_op),
      .result(result),
      .zero(zero)
  );

  initial begin
    $display("===========================================");
    $display("Starting RISC-V ALU Simulation");
    $display("===========================================");

    // ADD Test
    tests_total++;
    rs1 = 32'd10;
    rs2 = 32'd5;
    alu_op = 4'b0000;
    #10;
    if (result == 32'd15) tests_passed++;
    $display("ADD Test: rs1=%0d + rs2=%0d = %0d | Expected: 15 | %s", rs1, rs2, result,
             (result == 32'd15) ? "PASS" : "FAIL");

    // SUB Test
    tests_total++;
    rs1 = 32'd10;
    rs2 = 32'd5;
    alu_op = 4'b0001;
    #10;
    if (result == 32'd5) tests_passed++;
    $display("SUB Test: rs1=%0d - rs2=%0d = %0d | Expected: 5  | %s", rs1, rs2, result,
             (result == 32'd5) ? "PASS" : "FAIL");

    // AND Test
    tests_total++;
    rs1 = 32'd10;
    rs2 = 32'd5;
    alu_op = 4'b0010;
    #10;
    if (result == 32'd0) tests_passed++;
    $display("AND Test: rs1=%0d & rs2=%0d = %0d | Expected: 0  | %s", rs1, rs2, result,
             (result == 32'd0) ? "PASS" : "FAIL");

    // OR Test
    tests_total++;
    rs1 = 32'd10;
    rs2 = 32'd5;
    alu_op = 4'b0011;
    #10;
    if (result == 32'd15) tests_passed++;
    $display("OR Test:  rs1=%0d | rs2=%0d = %0d | Expected: 15 | %s", rs1, rs2, result,
             (result == 32'd15) ? "PASS" : "FAIL");

    // XOR Test
    tests_total++;
    rs1 = 32'd10;
    rs2 = 32'd5;
    alu_op = 4'b0100;
    #10;
    if (result == 32'd15) tests_passed++;
    $display("XOR Test: rs1=%0d ^ rs2=%0d = %0d | Expected: 15 | %s", rs1, rs2, result,
             (result == 32'd15) ? "PASS" : "FAIL");

    // SLL Test (Shift Left Logical)
    tests_total++;
    rs1 = 32'd10;
    rs2 = 32'd1;
    alu_op = 4'b0101;
    #10;
    if (result == 32'd20) tests_passed++;
    $display("SLL Test: rs1=%0d << %0d = %0d | Expected: 20 | %s", rs1, rs2, result,
             (result == 32'd20) ? "PASS" : "FAIL");

    // SRL Test (Shift Right Logical)
    tests_total++;
    rs1 = 32'd10;
    rs2 = 32'd1;
    alu_op = 4'b0110;
    #10;
    if (result == 32'd5) tests_passed++;
    $display("SRL Test: rs1=%0d >> %0d = %0d | Expected: 5  | %s", rs1, rs2, result,
             (result == 32'd5) ? "PASS" : "FAIL");

    // SLT Test (Set Less Than) - true case
    tests_total++;
    rs1 = 32'd3;
    rs2 = 32'd5;
    alu_op = 4'b0111;
    #10;
    if (result == 32'd1) tests_passed++;
    $display("SLT Test: rs1=%0d < rs2=%0d = %0d | Expected: 1  | %s", rs1, rs2, result,
             (result == 32'd1) ? "PASS" : "FAIL");

    // SLT Test - false case
    tests_total++;
    rs1 = 32'd5;
    rs2 = 32'd3;
    alu_op = 4'b0111;
    #10;
    if (result == 32'd0) tests_passed++;
    $display("SLT Test: rs1=%0d < rs2=%0d = %0d | Expected: 0  | %s", rs1, rs2, result,
             (result == 32'd0) ? "PASS" : "FAIL");

    // Zero flag test
    tests_total++;
    rs1 = 32'd5;
    rs2 = 32'd5;
    alu_op = 4'b0001;
    #10;
    if (zero == 1'b1) tests_passed++;
    $display("ZERO Test: rs1=%0d - rs2=%0d = %0d, zero=%0b | %s", rs1, rs2, result, zero,
             (zero == 1'b1) ? "PASS" : "FAIL");

    $display("");
    $display("===========================================");
    $display("Fibonacci with multiple adds");
    $display("===========================================");

    // Calculate Fibonacci using only ALU operations
    // F(0)=0, F(1)=1, F(n)=F(n-1)+F(n-2)
    rs1 = 32'd0;
    rs2 = 32'd1;  // Initialize F(0)=0, F(1)=1
    $display("F(0) = %0d", rs1);
    $display("F(1) = %0d", rs2);

    // F(2) = F(1) + F(0)
    alu_op = 4'b0000;
    #10;
    $display("F(2) = %0d", result);

    // F(3) = F(2) + F(1)
    rs1 = rs2;
    rs2 = result;
    #10;
    $display("F(3) = %0d", result);

    // F(4) = F(3) + F(2)
    rs1 = rs2;
    rs2 = result;
    #10;
    $display("F(4) = %0d", result);

    // F(5) = F(4) + F(3)
    rs1 = rs2;
    rs2 = result;
    #10;
    $display("F(5) = %0d", result);

    // F(6) = F(5) + F(4)
    rs1 = rs2;
    rs2 = result;
    #10;
    $display("F(6) = %0d", result);

    // F(7) = F(6) + F(5)
    rs1 = rs2;
    rs2 = result;
    #10;
    $display("F(7) = %0d", result);

    // F(8) = F(7) + F(6)
    rs1 = rs2;
    rs2 = result;
    #10;
    $display("F(8) = %0d", result);

    // F(9) = F(8) + F(7)
    rs1 = rs2;
    rs2 = result;
    #10;
    $display("F(9) = %0d", result);

    // F(10) = F(9) + F(8)
    tests_total++;
    rs1 = rs2;
    rs2 = result;
    #10;
    if (result == 32'd55) tests_passed++;
    $display("F(10) = %0d (Expected: 55) | %s", result, (result == 32'd55) ? "PASS" : "FAIL");

    $display("");
    $display("===========================================");
    $display("BITWISE MASKING TEST");
    $display("===========================================");

    // Demonstrate bit field extraction using ALU operations
    rs1 = 32'h12345678;  // Test pattern
    $display("Original value: 0x%h", rs1);

    // Extract upper 16 bits: shift right 16 bits
    tests_total++;
    rs2 = 32'd16;
    alu_op = 4'b0110;
    #10;  // SRL by 16
    if (result[15:0] == 16'h1234) tests_passed++;
    $display("Upper 16 bits [31:16]: 0x%h | %s", result[15:0],
             (result[15:0] == 16'h1234) ? "PASS" : "FAIL");

    // Extract lower 16 bits: mask with 0xFFFF
    tests_total++;
    rs1 = 32'h12345678;
    rs2 = 32'h0000FFFF;
    alu_op = 4'b0010;
    #10;  // AND with 0xFFFF
    if (result[15:0] == 16'h5678) tests_passed++;
    $display("Lower 16 bits [15:0]: 0x%h | %s", result[15:0],
             (result[15:0] == 16'h5678) ? "PASS" : "FAIL");

    $display("");
    $display("===========================================");
    $display("Tests Passed: %0d/%0d (%.1f%%)", tests_passed, tests_total,
             (tests_passed * 100.0) / tests_total);
    $display("===========================================");
    $finish;
  end
endmodule
