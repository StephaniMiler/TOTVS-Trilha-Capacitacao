#INCLUDE 'TOTVS.CH'

/*7 – Ler um array A de 15 elementos e a partir dele
construir um array B de mesmo tamanho, sendo o
inverso de A, ou seja, o primeiro elemento de B
deverá receber o último de A o segundo de B
deverá receber o penúltimo de A e assim por
diante.*/

User Function L5E7()

    Local aA         := {} 
    Local aB         := {} 
    Local nContador  := 0
    Local cResultado := ''

    For nContador := 1 to 15
        aAdd(aA,nContador)
    Next

    For nContador := 15 to 1 step - 1
        aAdd(aB,nContador)
    Next

    For nContador := 1 to len(aB)
        if nContador < len(aB)
            cResultado += alltrim(Str(aB[nContador])) + ", "
        elseif nContador == 15
            cResultado +=  alltrim(Str(aB[nContador])) + ". "
        endif
    Next

    FwAlertInfo( cResultado, 'Array B' )

Return
