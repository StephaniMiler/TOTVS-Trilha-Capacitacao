#INCLUDE 'TOTVS.CH'

/*13 � Carregar um Array com 50 caracteres gerados
aleatoriamente (rand�micos). Ser�o v�lidos
apenas caracteres que representem letras
mai�sculas (de �A� at� �Z�). A carga do array
dever� ser feita atrav�s de uma fun��o est�tica
que � chamada automaticamente no programa
principal. Obs: Os caracteres podem se repetir.*/


User Function L5E13()

    Local aA         := {} 
    Local nContador  := 0

    GeraLetras(aA,nContador)

    FwAlertInfo( ArrToKStr(aA, ' | '), 'Array aleat�rio' )

Return

Static Function GeraLetras(aA,nContador)

    For nContador := 1 to 50
        aAdd(aA,CHR(RANDOMIZE(65,90)))
    Next

Return aA

