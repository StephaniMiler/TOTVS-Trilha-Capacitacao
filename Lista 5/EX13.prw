#INCLUDE 'TOTVS.CH'

/*13 – Carregar um Array com 50 caracteres gerados
aleatoriamente (randômicos). Serão válidos
apenas caracteres que representem letras
maiúsculas (de “A” até “Z”). A carga do array
deverá ser feita através de uma função estática
que é chamada automaticamente no programa
principal. Obs: Os caracteres podem se repetir.*/


User Function L5E13()

    Local aA         := {} 
    Local nContador  := 0

    GeraLetras(aA,nContador)

    FwAlertInfo( ArrToKStr(aA, ' | '), 'Array aleatório' )

Return

Static Function GeraLetras(aA,nContador)

    For nContador := 1 to 50
        aAdd(aA,CHR(RANDOMIZE(65,90)))
    Next

Return aA

