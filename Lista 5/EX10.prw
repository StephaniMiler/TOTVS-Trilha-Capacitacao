#INCLUDE 'TOTVS.CH'

/*10 –Ler dois arrays: A com 10 elementos e B com 15
elementos. Construir um array C, sendo este, a
junção dos outros dois arrays. Desta forma, C
deverá ter a capacidade de armazenar 25
elementos. Apresentar o array C.*/

User Function L5E10()

    Local aA         := {} 
    Local aB         := {} 
    Local aC         := {} 
    Local nContador  := 0
    Local cResultado := ''

    For nContador := 1 to 10
        aAdd(aA,nContador)
    Next

    For nContador := 1 to 15
        aAdd(aB,nContador)
    Next

    For nContador := 1 to 10
        aAdd(aC,aA[nContador])
    Next
    
    For nContador := 1 to 15
        aAdd(aC,aB[nContador])      
    Next
         
    For nContador := 1 to len(aC)
        if nContador < len(aC)
            cResultado += alltrim(Str(aC[nContador])) + ", "
        elseif nContador == 25
            cResultado +=  alltrim(Str(aC[nContador])) + ". "
        endif
    Next

    FwAlertInfo( cResultado, 'Array C' )

Return

