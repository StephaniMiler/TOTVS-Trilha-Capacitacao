#INCLUDE 'TOTVS.CH'

/*6 – No Cadastro de Fornecedores, utilizando um
Ponto de Entrada, ao tentar incluir ou alterar um
cadastro, faça as seguintes validações:
o Se o campo “País” estiver em branco não
poderá realizar a inclusão / alteração.
o Se o país for “Brasil” (105), o campo “CNPJ”
deverá ser preenchido, caso não seja, não
poderá realizar a inclusão / alteração.
o Se o país não for “Brasil”, o CNPJ não é
obrigatório..*/

User Function ValidaCNPJ()

  Local lRet := .T.

  if Empty(M->A2_PAIS) 
    lRet := .F.
    Help(NIL, NIL, 'O campo <b>País</b> deve ser preenchido.', NIL, 'País não seleciondo', 1, 0, NIL, NIL, NIL, NIL, NIL, {'Selecione o País'})
  elseif M->A2_PAIS $ '105' .AND. Empty(M->A2_CGC) 
      lRet := .F.
      Help(NIL, NIL, 'O campo <b>CNPJ</b> deve ser preenchido.', NIL, 'Campo CNPJ não foi preenchido', 1, 0, NIL, NIL, NIL, NIL, NIL, {'Preencha o CNPJ do cliente.'}) 
  endif

Return lRet
