#INCLUDE 'TOTVS.CH'

//1 - Escreva um algoritmo para ler um valor e escrever o seu antecessor.

USER Function Antecessor()

    Local nValor := 0
    Local nAntecessor := 0

    nValor := FwInputBox('Digite um valor: ') //*Pede para o usuário inserir um valor

    nAntecessor := VAL(nValor) - 1 //*Calcula o antecessor do número digitado

    FwAlertInfo('O antecessor de ' + cValToChar( nValor ) + ' é ' + cValToChar( nAntecessor ) )


RETURN

