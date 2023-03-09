#INCLUDE 'TOTVS.CH'

/*15 – Ler 12 elementos de um array e colocá-los em
ordem crescente.
Obs: NÃO é permitido o uso da função ASORT().*/

User Function L5E15()

    Local aArray     := {12, 11, 10, 9, 8, 7, 6, 5, 14, 3, 2, 1}
    Local nContador  := 0
    Local nContador2 := 0
    Local nAux       := 0

   //Usa um loop "for" para percorrer a matriz "aArray" desde o primeiro elemento até o último
   For nContador := 1 to len(aArray)
        //Dentro desse segundo loop "for", verifica se o valor do elemento na posição "nContador2" é maior do que o 
        //valor do elemento na posição "nContador" da matriz "aArray"
        For nContador2 := 1 to len(aArray)  
            If aArray[nContador2] > aArray[nContador]
                nAux := aArray[nContador]
                aArray[nContador] := aArray[nContador2]
                aArray[nContador2] := nAux
            Endif
        Next
    Next

    //Depois de ordenar a matriz em ordem crescente, chama a função "FwAlertInfo"
    FwAlertInfo(ArrToKStr(aArray, ', ') , 'Array em ordem crescente')

Return
