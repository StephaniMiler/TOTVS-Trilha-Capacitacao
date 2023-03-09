#INCLUDE 'TOTVS.CH'

/* 29 - Ler um vetor aArray1 de 10 números. Após, ler
mais um número e guardar em uma variável nNum.
Armazenar em um array aArray2 o resultado de
cada elemento de aArray1 multiplicado pelo valor
nNum. Logo após, imprimir o vetor aArray2. */

User Function Multiplica() 

  Local aNumeros  := {5,10,15,20,25,30,35,40,45,50}
  Local aArmazena := {}
  Local nNum      := 0
  Local nCont     := 0
  Local nMulti    :=0
  Local cPrint    := ''

  nNum := VAL(FWInputBox('Insira um número: ')) //Solicita ao usuário um número

  for nCont := 1 to Len(aNumeros)    // O contador funciona até a quantidade de números no array
    nMulti := nNum*(aNumeros[nCont]) // Realiza a multiplicação do número inserido pelo número no array
    AADD(aArmazena, nMulti)          
    cPrint += ALLTRIM(STR(aNumeros[nCont])) + '*' + ALLTRIM(STR(nNum)) + ' = ' + ALLTRIM(STR(aArmazena[nCont])) + CRLF //Armazena os valores na variável cPrint
  next

  MSGINFO(cPrint)

Return



