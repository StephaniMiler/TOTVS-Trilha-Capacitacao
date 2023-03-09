#INCLUDE 'TOTVS.CH'

/*3 – Elaborar um programa que popule um array de
30 posições com valores de 1 até 30. No final,
exibir o conteúdo do array.*/


User Function L5E3()

  Local aValores  := {} 
  Local nContador := 0
  Local cConteudo := ''

  For nContador := 1 to 30
    aAdd(aValores , nContador)
  Next

  For nContador := 1 to len(aValores)
    If nContador < len(aValores)
            cConteudo += alltrim(Str(aValores[nContador])) + ", "
    Elseif  nContador = 30
            cConteudo +=  alltrim(Str(aValores[nContador])) + ". "
    Endif


  NEXT

  FwAlertInfo( cConteudo, 'Valores do Array' )

Return
