#INCLUDE 'TOTVS.CH'

/* 36 - Faça um programa para calcular n! (Fatorial
de n), sendo que o valor inteiro de n é fornecido
pelo usuário. Sabe-se que: 4! = 4 * 3 * 2 * 1 */

User function FatorialDeN()

    Local nNumero   := 0
    Local nFatorial := 1
    Local nContador := 0

    nNumero := VAL(FwInputBox('Digite um número inteiro: ')) //Solicita um número

    For nContador := 1 to nNumero
        nFatorial *= nContador //calcula o fatorial
    Next

    FwAlertInfo('O fatorial de ' + cValToChar(nNumero) + ' é ' + cValToChar(nFatorial))
    
Return
