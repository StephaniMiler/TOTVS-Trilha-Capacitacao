#INCLUDE 'TOTVS.CH'

/* 18 - Escreva um algoritmo para imprimir os números
de 1 (inclusive) a 10 (inclusive) em ordem
crescente. */


User Function Numeros()
  Local cMsg  := ''
  Local nCont := 0

  for nCont := 1 to 10 //contador do 1 ao 10
      cMsg += cValToChar(nCont) + CRLF
  next

  FwAlertInfo(cMsg, 'Resultado') //impressão dos valores
  
Return
