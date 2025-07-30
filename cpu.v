// cpu.v - Processador simplificado RISC-V (Grupo 07)

module cpu(
    input clk,
    input reset
);

    reg [31:0] pc;
    reg [31:0] regs[0:31];
    reg [7:0]  data_mem[0:31];
    reg [31:0] instr_mem[0:31];

    wire [31:0] instr;
    assign instr = instr_mem[pc[6:2]];

    wire [6:0] opcode = instr[6:0];
    wire [4:0] rd     = instr[11:7];
    wire [2:0] funct3 = instr[14:12];
    wire [4:0] rs1    = instr[19:15];
    wire [4:0] rs2    = instr[24:20];
    wire [6:0] funct7 = instr[31:25];

    wire [31:0] imm_i = {{20{instr[31]}}, instr[31:20]};
    wire [31:0] imm_s = {{20{instr[31]}}, instr[31:25], instr[11:7]};
    wire [31:0] imm_b = {{19{instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pc <= 0;
        end else begin
            case (opcode)
                7'b0010011: begin
                    if (funct3 == 3'b000)
                        regs[rd] <= regs[rs1] + imm_i;
                    pc <= pc + 4;
                end
                7'b0110011: begin
                    case ({funct7, funct3})
                        {7'b0000000, 3'b111}: regs[rd] <= regs[rs1] & regs[rs2];
                        {7'b0000000, 3'b101}: regs[rd] <= regs[rs1] >> regs[rs2];
                    endcase
                    pc <= pc + 4;
                end
                7'b0000011: begin
                    if (funct3 == 3'b000)
                        regs[rd] <= {{24{data_mem[regs[rs1] + imm_i][7]}}, data_mem[regs[rs1] + imm_i]};
                    pc <= pc + 4;
                end
                7'b0100011: begin
                    if (funct3 == 3'b010)
                        {data_mem[regs[rs1] + imm_s], data_mem[regs[rs1] + imm_s + 1],
                         data_mem[regs[rs1] + imm_s + 2], data_mem[regs[rs1] + imm_s + 3]} <= regs[rs2];
                    pc <= pc + 4;
                end
                7'b1100011: begin
                    if (funct3 == 3'b000)
                        if (regs[rs1] == regs[rs2])
                            pc <= pc + imm_b;
                        else
                            pc <= pc + 4;
                end
                default: pc <= pc + 4;
            endcase
        end
    end

endmodule
