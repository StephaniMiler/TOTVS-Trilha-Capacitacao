#INCLUDE 'TOTVS.CH'

/* 25 - Escreva um algoritmo para ler 10 números e ao
final da leitura escrever a soma total dos 10
números lidos. */

User Function Soma()

    Local nNumero := 0
    Local nContador := 0

    For nContador := 1 to 10
        nNumero += VAL(FwInputBox('Informe um número: '))   //Solicita 10 números ao usuário e soma-os
    Next

    FwAlertInfo(cValToChar(nNumero), 'Soma dos números informados:')
    
Return
