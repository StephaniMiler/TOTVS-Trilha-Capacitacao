#INCLUDE 'TOTVS.CH'

/*2 - Ler 10 elementos de um array e apresent�-los
na ordem inversa em que foram lidos e
armazenados.*/


User Function L5E2()

  Local aArray     := {}
  Local cElementos := ''
  Local nContador  := 0

  For nContador := 1 to 10
    cElementos := FwInputBox('Digite o ' + cvaltochar(nContador) + ' � elemento do Array:', cElementos)
    aAdd(aArray, cElementos)
    cElementos := ''
  Next
  
  For nContador := 10 to 1 STEP -1
    FwAlertInfo('O ' + ALLTRIM(STR(nContador)) + '� valor do array �: ' + ALLTRIM(aArray[nContador]))

  Next

Return


