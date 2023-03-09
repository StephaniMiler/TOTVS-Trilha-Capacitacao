#INCLUDE 'TOTVS.CH'

/* 23 - Ler 10 valores e escrever quantos desses
valores lidos são NEGATIVOS. */

User Function ValoresNegativos()

    Local nNumero := 0
    Local nNegativos := 0
    Local nContador := 0

    For nContador := 1 to 10
        nNumero := VAL(FwInputBox('Informe um número: ')) //solicita ao usuário 10 valores
        If nNumero < 0
            nNegativos ++ //conta a quantidade de números negativos
        Endif
    Next

    FwAlertInfo(cValToChar(nNegativos), 'Quantidade de números negativos')

Return 
