#INCLUDE 'TOTVS.CH'

/*8 – Fazer um programa que carregue um array de 8
elementos e que inverta a ordem do seu conteúdo.
Apresente no final o array invertido.
Obs: Usar apenas um array.*/

User Function L5E8()

    Local aA         := {} 
    Local nContador  := 0
    Local nNumeros   := 0

    For nContador := 8 to 1 step -1
        aAdd(aA,nContador)
    Next
    
    For nContador := 1 to LEN(aA)
        nNumeros := aA[nContador]
        aA[nContador] := aA[Len(aA) - nContador + 1]
        aA[Len(aA) - nContador + 1] := nNumeros
    Next

    FwAlertInfo( ArrToKStr(aA), 'Array Invertido' )

Return
