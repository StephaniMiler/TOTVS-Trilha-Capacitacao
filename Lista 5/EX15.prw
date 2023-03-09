#INCLUDE 'TOTVS.CH'

/*15 � Ler 12 elementos de um array e coloc�-los em
ordem crescente.
Obs: N�O � permitido o uso da fun��o ASORT().*/

User Function L5E15()

    Local aArray     := {12, 11, 10, 9, 8, 7, 6, 5, 14, 3, 2, 1}
    Local nContador  := 0
    Local nContador2 := 0
    Local nAux       := 0

   //Usa um loop "for" para percorrer a matriz "aArray" desde o primeiro elemento at� o �ltimo
   For nContador := 1 to len(aArray)
        //Dentro desse segundo loop "for", verifica se o valor do elemento na posi��o "nContador2" � maior do que o 
        //valor do elemento na posi��o "nContador" da matriz "aArray"
        For nContador2 := 1 to len(aArray)  
            If aArray[nContador2] > aArray[nContador]
                nAux := aArray[nContador]
                aArray[nContador] := aArray[nContador2]
                aArray[nContador2] := nAux
            Endif
        Next
    Next

    //Depois de ordenar a matriz em ordem crescente, chama a fun��o "FwAlertInfo"
    FwAlertInfo(ArrToKStr(aArray, ', ') , 'Array em ordem crescente')

Return
