#INCLUDE 'TOTVS.CH'

/* 4 – Ler dois inteiros (A e B) e imprimir o resultado
do quadrado da diferença do primeiro valor pelo
segundo. */

User Function Lista2_4()

    Local nValorA    := 0 //Declaração das variáveis
    Local nValorB    := 0
    Local nDiferenca := 0
    Local nQuadrado  := 0

    nValorA := VAL(FWInputBox('Informe um número: ')) //Recebendo os valores
    nValorB := VAL(FWInputBox('Informe mais um número: '))

    nDiferenca := nValorA - nValorB
    nQuadrado  := nDiferenca ^ 2

    //Imprime os resultados solicitados
    FwAlertInfo('O quadrado da diferença do primeiro valor pelo segundo valor é: ' + cValToChar(nQuadrado), 'Resultado:')

Return
