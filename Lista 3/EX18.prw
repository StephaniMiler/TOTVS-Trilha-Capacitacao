#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 18 – Desenvolva uma função que solicite o nome do
usuário e mostre-o na vertical em escada.
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

  cNome := FwInputBox('Informe o seu nome: ') //Solicita ao usuário o seu nome
  
  For nNumero := 1 to Len(cNome)
    cMsg+=SUBSTR(cNome, 1, nNumero)+CRLF
  Next
  
  fwAlertInfo(cMsg, 'o Seu nome em escada!')

Return
