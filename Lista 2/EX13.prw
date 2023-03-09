#INCLUDE 'TOTVS.CH'

/* 13 - Elaborar um programa que exiba na tela
automaticamente todos os múltiplos de um
determinado número informado pelo usuário,
existentes entre 1 e um limite, que também deverá
ser informado pelo usuário. Faça com apenas uma
estrutura de repetição (For / While), antes de
desenvolver, analise qual será a melhor opção. */

User Function TodosMultiplos()

    //Declarando as variáveis
    Local nNumero := nContador := 0
    Local nMultiplos := nLimite := 0
    Local cMult := ''

    nMultiplos := Val(FWInputBox('Digite o número para receber os seus múltiplos? ')) //Solicita ao usuário o número
    nLimite := Val(FWInputBox('Digite o limite para os múltiplos do número escolhido? ')) //Solicita ao usuário o limite


    For nContador := 1 to nLimite  //Exibe os múltiplos do número escolhido até o limite determinado
        If nContador % nMultiplos = 0
            nNumero := nContador
            cMult += CValToChar(nNumero) + ' '
        Endif
    Next

    FwAlertInfo('Os múltiplos de são : ' + CRLF + cMult , 'Resultado') //Imprime resultado

    
Return
