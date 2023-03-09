#INCLUDE 'TOTVS.CH'

/*11 - Ler um array A com 10 elementos. Construir um
array B com a mesma dimensão, sendo que cada
elemento de B seja o somatório do primeiro até o
elemento correspondente de A. Apresentar os
elementos do array B.*/

User Function L5E11()

    Local aA         := {} 
    Local aB         := {} 
    Local nContador  := 0
    Local cResultado := ''

    For nContador := 1 to 10
        aAdd(aA,nContador)
    Next

    For nContador := 1 to 10   
        aAdd(aB,aA[1] + aA[nContador])
    Next
         
    For nContador := 1 to LEN(aB)
        if nContador < len(aB)
            cResultado += alltrim(Str(aB[nContador])) + ", "
        elseif nContador == 10
            cResultado +=  alltrim(Str(aB[nContador])) + ". "
        endif
    Next

    FwAlertInfo( cResultado, 'Array B' )

Return
