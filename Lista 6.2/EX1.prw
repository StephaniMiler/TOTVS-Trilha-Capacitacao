#INCLUDE 'TOTVS.CH'

/*1 – Utilizando Ponto de Entrada, faça uma validação
na inclusão / alteração dos Pedidos de Compra,
onde não será possível adicionar um novo item
(nova linha no grid) caso o campo “Tipo de
Entrada” não esteja preenchido. A cada tentativa
de adicionar um novo item, se o Tipo de Entrada
não estiver preenchido, uma mensagem de erro
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
