#INCLUDE 'TOTVS.CH'

/*14 – Carregar um array com 12 caracteres gerados
aleatoriamente (randômicos). Serão válidos
apenas caracteres que representem letras
minúsculas (de “a” até “z”). A carga do array
deverá ser feita através de uma função estática
que é chamada automaticamente no programa
principal. Os caracteres NÃO podem se repetir. No
final, exibir o vetor gerado.
Obs: A exibição deverá ser feita função estática.*/

User Function L5E14()

    Local aArray   := {}
    Local cLetras := 0
    Local nIgual   := 0

    While Len(aArray) <= 12
        cLetras := CHR(RANDOMIZE(97, 122))
        nIgual := ASCAN(aArray, cLetras, 1, Len(aArray))
        If nIgual == 0
            AADD(aArray, cLetras)
        Endif
    Enddo

    MostraArray(aArray)
Return 

Static Function MostraArray(aArray)
    Local cResultado := ''
    Local nContador   := 0

    For nContador := 1 to Len(aArray)
        If nContador < 12
            cResultado += cValToChar(aArray[nContador]) + ', '
        Else 
            cResultado += cValToChar(aArray[nContador]) + '.'
        Endif
    Next

    FwAlertSuccess(cResultado, 'Array Aleatorio')

Return
