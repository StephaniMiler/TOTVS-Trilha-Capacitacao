#INCLUDE 'TOTVS.CH'

/*6 – Ler dois arrays, A e B de 10 elementos cada e
calcular um array C onde seu primeiro elemento é o
primeiro elemento de A, seu segundo elemento é o
primeiro de B, seu terceiro elemento é o segundo
de A, e assim sucessivamente. Note que o array C
deverá ter 20 elementos. Exibir o conteúdo do
array C.*/

user function CalculaC()

    Local aA         := {1, 2, 3, 4, 5, 6, 7, 8, 9, 10} 
    Local aB         := {11, 12, 13, 14, 15, 16, 17, 18, 19, 20} 
    Local aC         := {} 
    Local nContador  := 0
    Local cResultado := ''


    For nContador := 1 to 10
        aAdd(aC, aA[nContador])
        aAdd(aC, aB[nContador])
    Next

    For nContador := 1 to len(aC)
        if nContador < len(aC)
            cResultado += alltrim(Str(aC[nContador])) + ", "
        elseif nContador == 20
            cResultado +=  alltrim(Str(aC[nContador])) + ". "
        endif
    Next

    FwAlertInfo( cResultado, 'Array C' )

Return
