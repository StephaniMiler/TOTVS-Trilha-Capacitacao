#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 16 � Crie uma fun��o que permita ao usu�rio digitar
o seu nome e em seguida mostre-o de tr�s para
frente utilizando apenas letras mai�sculas.
� Exemplo:
o Usu�rio digita o nome �Maria�
o Dever� ser apresentado: �AIRAM�*/

User Function Invertido()

  Local cNome    := ''
  Local nNumero  := 0
  Local cMsg     := ''

  cNome := FwInputBox('Informe o seu nome: ') //Solicita ao usu�rio o seu nome

  For nNumero := Len(cNome) to 1 step -1
    cMsg+=SUBSTR(cNome, nNumero, 1)
  Next

  fwAlertInfo(cMsg, 'Seu Nome de tr�s pra frente �: ')

Return
