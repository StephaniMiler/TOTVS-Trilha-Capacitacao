#INCLUDE 'TOTVS.CH'

/* 32 - Faça um algoritmo para ler dois arrays
aArray1 e aArray2 de 15 números cada. Calcular e
escrever a quantidade de vezes que aArray1 e
aArray2 possuem os mesmos números e nas mesmas
posições. */

User Function Iguais() 

  Local aArray1 [15]
  Local aArray2 [15]
  Local nCont  := 0
  Local nSoma  := 0
  Local cPrint := ''

  cPrint := 'Primeiro Array' + CRLF
  for nCont := 1 to 15
    aArray1[nCont] := FWInputBox('Insira um número para o primeiro array: ') //Solicita número ao usuário
    cPrint += STR(nCont) +'º = ' + aArray1[nCont] + CRLF  // Os números inseridos são salvos na variável de impressão
  next

  cPrint += CRLF +'Segundo Array' + CRLF
  for nCont := 1 to 15
    aArray2[nCont] := FWInputBox('Insira um número para o segundo array: ')
    cPrint += STR(nCont) +'º = ' + aArray2[nCont] + CRLF  
  next

  for nCont := 1 to 15
    if aArray1[nCont] == aArray2[nCont] 
      nSoma += 1
    endif
  next

  MSGINFO(cPrint + CRLF + 'Os arrays possuem ' + ALLTRIM(STR(nSoma)) + ' números iguais nas mesmas posições.')

Return 
