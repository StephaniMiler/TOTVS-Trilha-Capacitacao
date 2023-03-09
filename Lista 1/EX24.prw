#INCLUDE 'TOTVS.CH'

/* 24 - Ler 10 valores e escrever quantos desses
valores lidos estão no intervalo [10, 20] (inlcuindo
os valores 10 e 20 no intervalo) e quantos deles
estão fora deste intervalo. */

User Function Intervalo()

    Local nNumero := 0
    Local nIntervalo1 := 0
    Local nOutro := 0
    Local nContador := 0

    For nContador := 1 to 3
        nNumero := VAL(FwInputBox('Informe um número: ')) //solicita números ao usuário
        If nNumero >= 10 .And. nNumero <= 20
         nIntervalo1++ //soma números que estão dentro do intervalo 
        else
         nOutro++ // soma números que estão fora do intervalo
        Endif
    Next

    FwAlertInfo('Quantidade de números entre 10 e 20: ' + cValToChar(nIntervalo1) + CRLF + 'Quantidade de números que não estão entre 10 e 20: ' + cValToChar(nOutro) , 'Resultado')
    

Return
