#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 17 � Desenvolva uma fun��o que solicite o nome do
usu�rio e mostre-o na vertical.
Exemplo:
R
O
B
E
R
T
O*/

User Function NomeVertical()
  Local cNome   := ''
  Local nNumero := 0
  Local cMsg    := ''

  cNome := FwInputBox('Informe o seu nome: ') //Solicita ao usu�rio o seu nome
  
  For nNumero := 1 to Len(cNome)
    cMsg+=SUBSTR(cNome, nNumero, 1)+CRLF
  Next
  
  fwAlertInfo(cMsg, "Seu Nome na Vertical!")

Return

