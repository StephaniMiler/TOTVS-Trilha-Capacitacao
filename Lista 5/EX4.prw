#INCLUDE 'TOTVS.CH'

/*4 – Elaborar um programa que popule um array de
10 posições com valores pares a partir de 2 até o
20. No final, exibir o conteúdo do array.*/

User function L5E4()

    Local aValores   := {} 
    Local nContador  := 0
    Local cResultado := ''

    For nContador := 2 to 20 step 2
        aAdd(aValores, nContador)

    Next

    For nContador := 1 to len(aValores)
        if nContador < len(aValores)
            cResultado += alltrim(Str(aValores[nContador])) + ", "
        elseif nContador < 20
            cResultado +=  alltrim(Str(aValores[nContador])) + ". "
        endif
    Next

    FwAlertInfo( cResultado, 'Numeros pares' )

Return

