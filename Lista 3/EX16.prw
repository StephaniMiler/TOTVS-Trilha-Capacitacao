#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 16 – Crie uma função que permita ao usuário digitar
o seu nome e em seguida mostre-o de trás para
frente utilizando apenas letras maiúsculas.
• Exemplo:
o Usuário digita o nome “Maria”
o Deverá ser apresentado: “AIRAM”*/

User Function Invertido()

  Local cNome    := ''
  Local nNumero  := 0
  Local cMsg     := ''

  cNome := FwInputBox('Informe o seu nome: ') //Solicita ao usuário o seu nome

  For nNumero := Len(cNome) to 1 step -1
    cMsg+=SUBSTR(cNome, nNumero, 1)
  Next

  fwAlertInfo(cMsg, 'Seu Nome de trás pra frente é: ')

Return
