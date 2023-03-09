#INCLUDE 'TOTVS.CH'

/*9 – Ler 8 elementos em um array A tipo vetor.
Construir um array B de mesma dimensão onde cada
elemento é o triplo do elemento correspondente
do array A.*/

User Function L5E9()

    Local aA         := {} 
    Local aB         := {} 
    Local nContador  := 0
    local cResultado := ''

    For nContador := 1 to 8 
        aAdd(aA,nContador)
    Next

    For nContador := 1 to 8 
        aAdd(aB,aA[nContador] * 3)
    Next

    For nContador := 1 to len(aB)
        if nContador < len(aB)
            cResultado += alltrim(Str(aB[nContador])) + ", "
        elseif nContador == 8
            cResultado +=  alltrim(Str(aB[nContador])) + ". "
        endif
    Next

    FwAlertInfo( cResultado, 'Array B' )

Return
