#INCLUDE 'TOTVS.CH'

/*8 � Crie uma rotina que apresentar� mensagens
diferentes em cada uma das seguintes situa��es
dos Cadastros de Fornecedores:
o Inclus�o:
? Mensagem: Seja Bem vindo(a) ao Cadastro de
Fornecedores!

o Altera��o:
? Mensagem: Voc� est� prestes a alterar o
cadastro do fornecedor NomeFornecedor!

o Exclus�o:
? Mensagem: Cuidado, voc� est� prestes a
excluir o fornecedor NomeFornecedor!
Obs: Essas mensagens dever�o aparecer antes do
carregamento da tela referente a op��o desejada*/

User Function BoasVindas()

  Local nOp   := PARAMIXB 
  Local cForn := SA2->A2_NOME 

  if INCLUI
    FwAlertSuccess('Seja bem vindo(a) ao cadastro de Fornecedores!', 'Cadastro de Fornecedores')
  elseif ALTERA 
    FwAlertInfo('Voc� est� prestes a alterar o cadastro do fornecedor <b>' + cForn + '</b>!', 'Altera��o de Cadastro')
  elseif nOp == 5
    FwAlertError('Voc� est� prestes a Excluir o cadastro do fornecedor <b>' + cForn + '</b>!', 'Exclus�o de Cadastro')
  endif

Return
