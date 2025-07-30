# Programa de teste para o Grupo 07 (lb, addi, and, srl, sw, beq)

addi x1, x0, 5       # x1 = 5
addi x2, x0, 3       # x2 = 3
and x3, x1, x2       # x3 = x1 AND x2 = 5 AND 3 = 1
srl x4, x1, x2       # x4 = x1 >> x2 = 5 >> 3 = 0
sw x3, 0(x0)         # Mem[0] = x3 = 1
lb x5, 0(x0)         # x5 = Mem[0] (load byte)
beq x5, x3, FIM      # se x5 == x3, pula para FIM
addi x6, x0, 99      # se falhar, x6 = 99 (erro visível)
FIM:
addi x6, x0, 7       # x6 = 7 (código de sucesso)
