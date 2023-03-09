#INCLUDE 'TOTVS.CH'

/* 26 - Faça um algoritmo que calcule e escreva a
média aritmética dos números inteiros entre 15
(inclusive) e 100 (inclusive). */

User Function MediaA()

    Local nNumero := 0
    Local nMedia := 0
    Local nContador := 0
    Local nCont := 0

    
    For nContador := 15 to 100 //contador
        nCont++
        nNumero+= nContador
    Next

    nMedia := nNumero/nCont //calcula a média

    FwAlertInfo(cValToChar(nMedia), 'Media aritmetica dos numeros:')


Return 
