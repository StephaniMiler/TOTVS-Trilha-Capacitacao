#INCLUDE 'TOTVS.CH'

/* 30 - Faça um algoritmo para ler 10 números e
armazenar em um array. Após a leitura total dos 10
números, o algoritmo deve escrever esses 10
números lidos na ordem inversa. */


User Function Inverso() 

  Local aNumeros [10]
  Local nCont := 0
  Local cPrint := ''

  for nCont := 1 to 10
    aNumeros[nCont] := FWInputBox('Insira um número: ') //Solicita os números inseridos no array
  next

  for nCont := 10 to 1 STEP -1
    cPrint += aNumeros[nCont] + CRLF
  next

  MSGINFO(cPrint)

Return
