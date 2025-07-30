// tb_cpu.v - Testbench para CPU

`timescale 1ns / 1ps

module tb_cpu;

    reg clk = 0;
    reg reset = 1;
    cpu uut (.clk(clk), .reset(reset));

    always #5 clk = ~clk;

    initial begin
        $dumpfile("cpu.vcd");
        $dumpvars(0, tb_cpu);

        #10 reset = 0;

        #500;
        $display("=== REGISTRADORES ===");
        for (int i = 0; i < 32; i = i + 1)
            $display("x%0d = %0d", i, uut.regs[i]);

        $finish;
    end

endmodule
