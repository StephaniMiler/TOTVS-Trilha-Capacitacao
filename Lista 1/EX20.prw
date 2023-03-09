#INCLUDE 'TOTVS.CH'

/* 20 - Escreva um algoritmo para imprimir os 10
primeiros números inteiros maiores que 100. */

User Function Maiores()
  Local cMsg  := ''
  Local nCont := 0

  for nCont := 1 to 10 //contador do 1 ao 10
      cMsg += cValToChar(100 + nCont) + CRLF
  next

  FwAlertInfo(cMsg, 'Resultado')
  
Return
