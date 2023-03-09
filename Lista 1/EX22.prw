#INCLUDE 'TOTVS.CH'

/* 22 - Ler um valor inteiro (aceitar somente valores
entre 1 e 10) e escrever a tabuada de 1 a 10 do
valor lido. */

User Function Tabuada()

    Local nNumero := 0
    Local nContador := 0
    Local nMultiplica := 0
    Local cImprime := ''

    nNumero := VAL(FwInputBox('Informe um número entre 1 e 10: ')) //solicita ao usuário um número entre 1 e 10

    While nNumero < 1 .or. nNumero > 10 //verifica se o valor é válido
        FwAlertInfo('VALOR INVÁLIDO! Por favor, digite um valor entre 1 e 10.')
        nNumero := VAL(FwInputBox('Informe um número entre 1 e 10: '))
    End

    For nContador := 1 to 10
        nMultiplica := (nContador * nNumero) //calcula a tabuada
        cImprime += (cValToChar(nContador) + ' X ' + cValToChar(nNumero) + ' = ' + cValToChar(nMultiplica) + CRLF)
    Next
    FwAlertInfo(cImprime, 'Tabuada')
    
Return 
