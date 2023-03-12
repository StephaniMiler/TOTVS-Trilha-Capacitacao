#INCLUDE 'TOTVS.CH'

/*1 � Utilizando Ponto de Entrada, fa�a uma valida��o
na inclus�o / altera��o dos Pedidos de Compra,
onde n�o ser� poss�vel adicionar um novo item
(nova linha no grid) caso o campo �Tipo de
Entrada� n�o esteja preenchido. A cada tentativa
de adicionar um novo item, se o Tipo de Entrada
n�o estiver preenchido, uma mensagem de erro
deve ser apresentada.*/

User Function MT120PCOL()
     
    Local lRet := .T.
    Local nOper := PARAMIXB[1]
    Local nContador := 0
     
    If nOper == 1 
      for nContador := 1 to len(aCols)
			if empty(aCols[nI][33])
                FwAlertError("Preencha o campo 'Tipo de entrada'")
				lRet := .F.
			endif
		next
	endif
 
Return lRet
