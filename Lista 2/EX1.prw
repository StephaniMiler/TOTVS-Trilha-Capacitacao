#INCLUDE 'TOTVS.CH'

/* 1- Ler dois números positivos e apresentar a
soma, diferença, produto e quociente entre eles.*/

USER Function Lista2_1()

    Local nNumero1   := 0 //Declaração das variáveis
    Local nNumero2   := 0
    Local nSoma      := 0
    Local nDiferenca := 0
    Local nProduto   := 0
    Local nQuociente := 0

    nNumero1 := VAL(FWInputBox('Informe um número maior que 0: ')) //Recebendo os valores
    nNumero2 := VAL(FWInputBox('Informe mais número maior que 0: '))

    nSoma      := nNumero1 + nNumero2 //Executando as operações
    nDiferenca := nNumero1 - nNumero2
    nProduto   := nNumero1 * nNumero2
    nQuociente := nNumero1 / nNumero2

    //Imprime os resultados solicitados
    FwAlertInfo('A soma dos valores é: ' + cValToChar(nSoma) + CRLF + 'A diferença dos valores é: ' + cValToChar(nDiferenca);
    + CRLF + 'O produto dos valores é: ' + cValToChar(nProduto) + CRLF + 'O quociente dos valores é: ' + cValToChar(nQuociente) , 'Resultados:')
    
Return
