#INCLUDE 'TOTVS.CH'

/* 12 - Elaborar um programa que exiba na tela
automaticamente todos os múltiplos de 3
existentes entre 1 e 100. */

User Function Multiplos3()

    Local cMultiplos := '' //Declarando as variáveis
    Local nContador  := 0

    For nContador := 1 to 100  //Solicitando os múltiplos de 3 entre 0 e 100
        If nContador % 3 == 0
           cMultiplos += STR(nContador)
        Endif
    Next

    FwAlertInfo('Os múltiplos de 3 entre 1 e 100 são : ' + CRLF + (cMultiplos) , 'Resultado') //Imprime resultado

Return
