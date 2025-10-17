module alu (
    input  logic [31:0] rs1,
    input  logic [31:0] rs2,
    input  logic [3:0]  alu_op,
    output logic [31:0] result,
    output logic        zero
);

    always_comb begin
        case (alu_op)
            4'b0000: result = rs1 + rs2;           // ADD
            4'b0001: result = rs1 - rs2;           // SUB
            4'b0010: result = rs1 & rs2;           // AND
            4'b0011: result = rs1 | rs2;           // OR
            4'b0100: result = rs1 ^ rs2;           // XOR
            4'b0101: result = rs1 << rs2[4:0];     // SLL (Shift Left Logical)
            4'b0110: result = rs1 >> rs2[4:0];     // SRL (Shift Right Logical)
            4'b0111: result = ($signed(rs1) < $signed(rs2)) ? 32'b1 : 32'b0; // SLT (Set Less Than)
            default: result = 32'b0;
        endcase
    end

    assign zero = (result == 32'b0);

endmodule

