#INCLUDE 'TOTVS.CH'

/* 8 - Faça um algoritmo para ler um nome de usuário
(user name) e uma senha. Caso correspondam aos
dados armazenados internamente no programa
através do uso de constantes (“chumbado” / hard
coded), deve ser apresentada a mensagem
“Acesso permitido”. Caso o usuário/senha não
coincidam, exibir a mensagem “Usuário ou senha
inválido”. A verificação da senha só deverá
ocorrer caso o usuário coincida, porém o usuário
não deve saber especificamente se foi o nome de
usuário ou a senha que não coincidiu. */

User Function Lista2_8()

  Local cUsuarioCorreto := 'stephani'  //Definindo as constantes com o nome de usuário e senha permitidos
  Local cSenhaCorreta   := 'stephanimiler'
  Local nUsuario        := 0
  Local nSenha          := 0
 

  nUsuario := FWInputBox('Insira o nome de usuário: ') //Recebendo os valores
  nSenha   := FWInputBox('Insira a senha: ')

    If nUsuario == cUsuarioCorreto .And. nSenha == cSenhaCorreta
        FwAlertSuccess('Login realizado com sucesso!')
    Else
        FwAlertError('Usuário ou senha inválido!')
    Endif
    
Return

