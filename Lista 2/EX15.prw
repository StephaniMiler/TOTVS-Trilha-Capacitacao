#INCLUDE 'TOTVS.CH'

/* 15 - Fazer um programa para calcular e exibir os
"n" primeiros números da série de Fibonacci.
O usuário informará o valor de n. */

/*A sequência de Fibonacci é uma série de números em que cada número é a soma dos dois 
números anteriores. A sequência começa com 0 e 1, e os próximos números são a soma dos
dois números anteriores (0+1 = 1, 1+1 = 2, 1+2 = 3, 2+3 = 5, 3+5 = 8, e assim por diante). */

User function Fibonacci()

    Local nNumero    := 0 //Declarando as variáveis
    Local cAnterior1 := ''
    Local nFibonacci := 0
    Local nContador  := 0


    nNumero := VAL(FwInputBox('Digite um número: '))
  
    For cAnterior to 0
        nFibonacci += nContador
    Next

    FwAlertInfo('A série de Fibonacci de ' + cValToChar(nNumero) + ' é ' + cValToChar(nFibonacci))

Return
