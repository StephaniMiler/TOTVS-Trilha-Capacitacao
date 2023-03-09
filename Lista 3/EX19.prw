#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 19 - Solicite ao usuário que escreva uma frase,
após isso conte:
o Quantos espaços em branco existem na frase
o Quantas vezes cada vogal aparece na frase
? Ex: A: 5, E: 2, I: 2, O: 1, U: 0*/

User Function Contagem()

  //Declarando as variáveis
  Local cFrase := ''
  Local nEspaço:= 0
  Local nA := 0, nE := 0, nI := 0, nO := 0, nU := 0
  Local nCel := 0

  cFrase := Upper(FwInputBox("Escreva uma frase")) //Solicita ao usuário uma frase

  For nCel := 1 to Len(cFrase)
    If ASC(Substr(cFrase, ncel, 1)) == 32
      nEspaço++
    EndIf 
    If Substr(cFrase, nCel, 1) == "A"
      nA++
    EndIf
    IF Substr(cFrase, nCel, 1) == "E"
      nE++
    EndIf
    IF Substr(cFrase, nCel, 1) == "I"
      nI++
    EndIf
    IF Substr(cFrase, nCel, 1) == "O"
      nO++
    EndIf
    IF Substr(cFrase, nCel, 1) == "U"
      nU++
    ENDIF
NEXT

  FwAlertInfo(Str(nEspaço) + " espaços, "+CRLF+Str(nA) + " vogais A; "+CRLF+Str(nE) + " vogais E; "+CRLF+Str(nI) + " vogais I; "+CRLF+Str(nO) + " vogais O; "+CRLF+Str(nU) + " vogais U; "+CRLF,"A frase digitada possui: ")

Return
