#INCLUDE 'TOTVS.CH'

/*10 � Acrescente um bot�o � rotina de Cadastros de
Fornecedores, para que seja poss�vel acessar os
Cadastros de Produtos.*/

User Function CarregCad()

  Local aBotao := {}

  Aadd(aBotao, {'Cad. Produtos', '', {||AxCadastro('SB1', 'Cadastro de Produtos')}, 'Cad. Produto'})
  
Return aBotao
