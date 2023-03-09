#INCLUDE 'TOTVS.CH'

/*12 - Ler um array A com 5 elementos. Construir um
array B com a mesma dimensão, onde cada elemento
do array B deverá ser o valor inverso (sinal
trocado) do elemento correspondente do array A.
Apresentar os elementos do array B.*/

User Function L5E12()

    Local aA         := {} 
    Local aB         := {} 
    Local nContador  := 0
    Local cResultado := ''

    For nContador := 1 to 5
        aAdd(aA,nContador)
    Next

    For nContador := 1 to 5   
        aAdd(aB, aA[nContador] * -1)
    Next
         
    For nContador := 1 to Len(aB)
        if nContador < len(aB)
            cResultado += alltrim(Str(aB[nContador])) + ", "
        elseif nContador == 5
            cResultado +=  alltrim(Str(aB[nContador])) + ". "
        endif
    Next

    FwAlertInfo( cResultado, 'Array B' )

Return
