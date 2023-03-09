#INCLUDE 'TOTVS.CH'

/* 9 - Dado um número de 1 até 12, apresentar o
número de dias do mês correspondente. Se o
número escolhido for 2 (fevereiro), considere 28
dias. Dica: O uso de Array pode simplificar as
coisas, mas não é obrigatório. 😉 */

User Function Lista2_9()

    Local nMes := 0 // Declaração de variáveis
    Local cMesExtenso := ''

    nMes := Val(FWInputBox('Digite um número de 1 a 12 para o mês desejado: ')) // Recebe o valor desejado
    cMesExtenso := MesExtenso(nMes) // Obtém o nome do mês por extenso

    If nMes == 2
        FwAlertInfo('O mês de ' + cMesExtenso + ' tem 28 ou 29 dias, dependendo do ano.')
    Elseif nMes == 4 .Or. nMes == 6 .Or. nMes == 9 .Or. nMes == 11
        FwAlertInfo('O mês de ' + cMesExtenso + ' tem 30 dias.')
    Else
        FwAlertInfo('O mês de ' + cMesExtenso + ' tem 31 dias.')
    EndIf

Return


