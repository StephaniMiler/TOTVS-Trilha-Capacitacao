#INCLUDE 'TOTVS.CH'

/* 10 - Efetuar a leitura de 5 valores inteiros e exibir
na tela o menor e o maior deles. */

User Function MenorMaior()

    Local aNumeros  := {} //Declarando as variáveis
    Local nContador := 0

    For nContador := 1 to 5
        Aadd(aNumeros, Val(FwInputBox('Digite o ' + cValToChar(nContador) + '° número: '))) //Coletando os 5 números
    Next

    ASort(aNumeros)

    //Exibindo o maior e menor número
    FwAlertInfo('Menor número: ' + cValToChar(aNumeros[1]) + CRLF + 'Maior número: ' + cValToChar(ATail(aNumeros)) , 'Menor / Maior')
Return
