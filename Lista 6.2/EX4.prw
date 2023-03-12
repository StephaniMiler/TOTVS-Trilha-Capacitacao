#INCLUDE 'TOTVS.CH'

/*4 – Crie um Ponto de Entrada para que, caso o
cancele a inclusão de um novo Pedido de Venda,
seja apresentada uma mensagem com o seguinte
texto: “Operação cancelada pelo usuário!”*/

User Function MA410VLD()

  Local lRet := .T.                            // Conteudo de retorno
  Local aProd:= {"Produto1",50,"Produto2",40}  // Array contendo produtos e seus respectivos preços

   If(aProd[2]<aProd[4])
      lRet:= .T.
   else
      lRet:= .T.
   EndIf
     
  FwAlertInfo('Operação cancelada pelo usuário!')

  Return(lRet)
