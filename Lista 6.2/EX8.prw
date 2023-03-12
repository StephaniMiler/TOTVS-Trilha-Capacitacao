#INCLUDE 'TOTVS.CH'

/*8 – Crie uma rotina que apresentará mensagens
diferentes em cada uma das seguintes situações
dos Cadastros de Fornecedores:
o Inclusão:
? Mensagem: Seja Bem vindo(a) ao Cadastro de
Fornecedores!

o Alteração:
? Mensagem: Você está prestes a alterar o
cadastro do fornecedor NomeFornecedor!

o Exclusão:
? Mensagem: Cuidado, você está prestes a
excluir o fornecedor NomeFornecedor!
Obs: Essas mensagens deverão aparecer antes do
carregamento da tela referente a opção desejada*/

User Function BoasVindas()

  Local nOp   := PARAMIXB 
  Local cForn := SA2->A2_NOME 

  if INCLUI
    FwAlertSuccess('Seja bem vindo(a) ao cadastro de Fornecedores!', 'Cadastro de Fornecedores')
  elseif ALTERA 
    FwAlertInfo('Você está prestes a alterar o cadastro do fornecedor <b>' + cForn + '</b>!', 'Alteração de Cadastro')
  elseif nOp == 5
    FwAlertError('Você está prestes a Excluir o cadastro do fornecedor <b>' + cForn + '</b>!', 'Exclusão de Cadastro')
  endif

Return
