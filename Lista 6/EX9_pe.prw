#INCLUDE 'TOTVS.CH'

/*9 � Implementar a mesma rotina do Exerc�cio 1 utilizando MVC*/

/*1 � Crie um ponto de entrada que seja executado
na inclus�o/altera��o de produtos. O objetivo
desse PE � acrescentar o texto �Cad. Manual - �
antes da descri��o do produto.
o Ex: �Cad. Manual � Fone de Ouvido�.*/

User Function Item()

  Local aParam   := PARAMIXB
  Local lRet     := .T.
  Local oObj     := Nil
  Local cIdPonto := ''
  Local cIdModel := ''

  if aParam <> NIL
    oObj     := aParam[1]
    cIdPonto := aParam[2]
    cIdModel := aParam[3]
      
    if cIdPonto == 'MODELCOMMITTTS'
      SB1->B1_DESC := ALLTRIM('Cad. Manual - ' + M->B1_DESC)
    endif
  endif
  
Return lRet
