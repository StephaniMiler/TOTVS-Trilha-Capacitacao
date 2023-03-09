#INCLUDE 'TOTVS.CH'

/*6 – Faça um algoritmo para ler um nome de usuário
(user name) e uma senha. Caso correspondam aos
dados armazenados internamente no programa
através do uso de constantes (hard coded), deve
ser apresentada a mensagem “Acesso permitido”.
Caso o usuário/senha não coincidam, exibir a
mensagem “Usuário ou senha inválido”. A
verificação da senha só deverá ocorrer caso o
usuário coincida, porém o usuário não deve saber
especificamente se foi o nome de usuário ou a
senha que não coincidiu. */

#DEFINE cUsuario 'stephani'  //Determina o usuário e senha corretos
#DEFINE Passowrd    'ste123'

User Function Login()

    Local cTitle         := 'Login'
    Local cTexto         := 'Digite o nome de usuário:  '
    Local cTexto2        := 'Digite a senha: '
    Local nOpcao         := 0
    Local cUser          := Space(5)
    Local cPalavraChave  := Space(5)
    Local oDlg           := NIL

    //Solicita ao usuário nome e senha
    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 100, 400 PIXEL
    @ 014, 010 SAY    cTexto   SIZE 90, 12 OF oDlg PIXEL
    @ 034, 010 SAY    cTexto2  SIZE 90, 12 OF oDlg PIXEL
    @ 010, 080 MSGET  cUser    SIZE 55, 11 OF oDlg PIXEL
    @ 030, 080 MSGET  cPalavraChave    SIZE 55, 11 OF oDlg PIXEL PASSWORD
    @ 010, 140 BUTTON 'Ok'       SIZE 55, 11 OF oDlg PIXEL ACTION Login(cUser, cPalavraChave)
    @ 030, 140 BUTTON 'Cancelar'   SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 2, oDlg:End())

    ACTIVATE MSDIALOG oDlg CENTERED

Return


Static Function Login(cUser, cPalavraChave)

    if cUser == cUsuario .and. cPalavraChave == Passowrd //Caso o usuário e senha estejam corretos, mensagem ok!
        FwAlertSuccess('Acesso permitido!')
    else
        FwAlertError('Usuário ou senha inválido!') //Caso contrário, mensagem de erro!
    endif

Return
