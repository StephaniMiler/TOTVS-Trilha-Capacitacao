#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 18 � Desenvolva uma fun��o que solicite o nome do
usu�rio e mostre-o na vertical em escada.
Exemplo:
M
MA
MAR
MARI
MARIA*/

User Function Escada()
  Local cNome    := ''
  Local nNumero  := 0
  Local cMsg     := ''

  cNome := FwInputBox('Informe o seu nome: ') //Solicita ao usu�rio o seu nome
  
  For nNumero := 1 to Len(cNome)
    cMsg+=SUBSTR(cNome, 1, nNumero)+CRLF
  Next
  
  fwAlertInfo(cMsg, 'o Seu nome em escada!')

Return
