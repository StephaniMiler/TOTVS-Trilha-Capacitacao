#INCLUDE 'TOTVS.CH'

/*4 � Crie um Ponto de Entrada para que, caso o
cancele a inclus�o de um novo Pedido de Venda,
seja apresentada uma mensagem com o seguinte
texto: �Opera��o cancelada pelo usu�rio!�*/

User Function MA410VLD()

  Local lRet := .T.                            // Conteudo de retorno
  Local aProd:= {"Produto1",50,"Produto2",40}  // Array contendo produtos e seus respectivos pre�os

   If(aProd[2]<aProd[4])
      lRet:= .T.
   else
      lRet:= .T.
   EndIf
     
  FwAlertInfo('Opera��o cancelada pelo usu�rio!')

  Return(lRet)
