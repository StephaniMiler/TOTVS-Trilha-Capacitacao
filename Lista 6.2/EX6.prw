#INCLUDE 'TOTVS.CH'

/*6 � No Cadastro de Fornecedores, utilizando um
Ponto de Entrada, ao tentar incluir ou alterar um
cadastro, fa�a as seguintes valida��es:
o Se o campo �Pa�s� estiver em branco n�o
poder� realizar a inclus�o / altera��o.
o Se o pa�s for �Brasil� (105), o campo �CNPJ�
dever� ser preenchido, caso n�o seja, n�o
poder� realizar a inclus�o / altera��o.
o Se o pa�s n�o for �Brasil�, o CNPJ n�o �
obrigat�rio..*/

User Function ValidaCNPJ()

  Local lRet := .T.

  if Empty(M->A2_PAIS) 
    lRet := .F.
    Help(NIL, NIL, 'O campo <b>Pa�s</b> deve ser preenchido.', NIL, 'Pa�s n�o seleciondo', 1, 0, NIL, NIL, NIL, NIL, NIL, {'Selecione o Pa�s'})
  elseif M->A2_PAIS $ '105' .AND. Empty(M->A2_CGC) 
      lRet := .F.
      Help(NIL, NIL, 'O campo <b>CNPJ</b> deve ser preenchido.', NIL, 'Campo CNPJ n�o foi preenchido', 1, 0, NIL, NIL, NIL, NIL, NIL, {'Preencha o CNPJ do cliente.'}) 
  endif

Return lRet
