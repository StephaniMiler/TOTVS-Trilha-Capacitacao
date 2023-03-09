#INCLUDE 'TOTVS.CH'

/* 27 - Escreva um algoritmo que imprima as seguintes
sequências de números:
o (1, 1 2 3 4 5 6 7 8 9 10)
o (2, 1 2 3 4 5 6 7 8 9 10)
o (3, 1 2 3 4 5 6 7 8 9 10)
o (4, 1 2 3 4 5 6 7 8 9 10)
e assim sucessivamente, até que o primeiro número
(antes da vírgula), também chegue a 10.
Obs: Utilize laço de repetição para o
preenchimento dos números antes e depois da
vírgula. */

User Function Imprima()

    Local cImprimir := ''
    Local nContador := 0

    For nContador := 1 to 10 //contador
        cImprimir += cValToChar(nContador) + ', 1 2 3 4 5 6 7 8 9 10' + CRLF //imprime os valores
    Next

    FwAlertInfo(cValToChar(cImprimir), 'Sequencia de numeros: ')
    
Return 
