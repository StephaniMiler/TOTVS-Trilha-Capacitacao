#INCLUDE 'TOTVS.CH'

/* 11 - Elaborar um programa que exiba na tela,
automaticamente, 50 valores gerados
aleatoriamente, entre 10 e 99. Fazer 2 versões
desta solução:
o 1a - Utilizando For
o 2a – Utilizando While */

User Function Random()

    Local cValores := '' //Declarando as variáveis
    Local nContador := 0

    cValores := 'Os 50 valores aleatórios utilizando For: ' + CRLF //Apresentando os valores utilizando For
    For nContador := 1 to 50
        cValores += STR(Randomize(10 , 99))
    Next

    cValores += + CRLF + 'Os 50 valores aleatórios utilizando While: ' + CRLF //Apresentando os valores utilizando While
    nContador := 0
    While nContador <= 50
        cValores += STR(Randomize(10 , 99))
        nContador ++
    End  

    FwAlertInfo((cValores) , 'Resultado')

Return
