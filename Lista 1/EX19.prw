#INCLUDE 'TOTVS.CH'

/* 19 - Escreva um algoritmo para imprimir os números
de 1 (inclusive) a 10 (inclusive) em ordem
decrescente. */

User Function Decrescente()
  Local cMsg  := ''
  Local nCont := 0

  for nCont := 1 to 10 //contador do 1 ao 10
      cMsg += cValToChar(11 - nCont) + CRLF //Diminui 1 número
  next

  FwAlertInfo(cMsg, 'Resultado') //Imprime lista
  
Return
