#INCLUDE 'TOTVS.CH'

/*5 – Ler dois arrays (A e B), de 20 elementos cada e
calcular um terceiro (C), onde cada elemento será
A soma dos correspondentes em A e B. Apresentar
o array resultante.*/


User function SomaArray()
    Local aA         := {2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40}
    Local aB         := {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20}
    Local aC         := {}
    Local nContador  := 0
    local cResultado := ''


    For nContador := 1 to 20 

        aAdd(aC,(aA[nContador]) + (aB[nContador]))

    Next

    For nContador := 1 to len(aC)
        if nContador < len(aC)
            cResultado += alltrim(Str(aC[nContador])) + ", "
        elseif nContador < 21
            cResultado +=  alltrim(Str(aC[nContador])) + ". "
        endif
    Next
   
    // apresenta o array resultante C
    FwAlertInfo('O array resultante é ' + cResultado , 'Resultado')
    
Return


