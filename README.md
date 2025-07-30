# Projeto - Processador RISC-V (Grupo 07)

Este repositório contém a implementação de um processador RISC-V desenvolvido como parte do trabalho da disciplina. A seguir estão os arquivos incluídos e suas descrições.

## Integrantes do Grupo
- Grupo 07

## Arquivos Incluídos

### 1. Código ASM utilizado para o teste do trabalho
- `programa.asm`: Código em Assembly RISC-V utilizado para testar o processador.

### 2. Código ASM traduzido em binário (hexadecimal)
- `programa.hex`: Representação hexadecimal do código Assembly, carregado na memória de instruções do processador.

### 3. Estado inicial dos registradores do RISC-V
- `registradores.hex`: Arquivo com os valores iniciais dos registradores.

### 4. Estado inicial da memória de dados
- `memoria_dados.hex`: Arquivo com os dados iniciais da memória de dados.

### 5. Código do processador RISC-V
- `cpu.v`: Arquivo em Verilog contendo a implementação do processador.

### 6. Testbench para simulação
- `tb_cpu.v`: Testbench para verificar o funcionamento do processador com o programa carregado.

## Simulação
Você pode compilar e simular este projeto utilizando ferramentas como `iverilog` e `vvp`. Exemplo de comandos:

```bash
iverilog -o sim.out tb_cpu.v cpu.v
vvp sim.out
