# PCID - Etapas

## RemoteController (PRONTO)
* Módulo Remote Controller pronto, testbench e testes efetuados
* Conexão com pinos físicos do FPGA efetuada
* Timing Analyzer ajustado

## Somador (ALTERAR)
* Módulo Acumulador pronto, testbench e testes efetuados
* Módulo FSM pronto, testbench e testes efetuados
* Módulo TOP pronto, testbench e testes efetuados
* Conexão com pinos físicos do FPGA efetuada
* Criado arquivo `.mif` de dados para a memória RAM e arquivo `data.txt` correspondente para testbench
* Timing Analyzer ajustado

## MPEG (ALTERAR)
* Módulo FSM_Control pronto, testbench e testes efetuados
* Conexão com pinos físicos do FPGA efetuada
* Timing Analyzer ajustado

## Semaforo (PRONTO)
* Módulo Semaforo pronto, testbench e testes efetuados
* Conexão com pinos físicos do FPGA efetuada
* Timing Analyzer não necessário, já que o circuito é assíncrono

## Alterações a fazer
* Conferir lista de sensibilidade das FSM's
* Refazer testbench do TOP e instanciar memória
* Reestruturar comparações do RemoteController
* Automatização de diagnóstico das FSM's
