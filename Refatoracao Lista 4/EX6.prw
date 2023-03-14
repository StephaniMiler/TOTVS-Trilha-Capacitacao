/*6 � Fa�a um algoritmo para ler um nome de usu�rio
(user name) e uma senha. Caso correspondam aos
dados armazenados internamente no programa
atrav�s do uso de constantes (hard coded), deve
ser apresentada a mensagem �Acesso permitido�.
Caso o usu�rio/senha n�o coincidam, exibir a
mensagem �Usu�rio ou senha inv�lido�. A
verifica��o da senha s� dever� ocorrer caso o
usu�rio coincida, por�m o usu�rio n�o deve saber
especificamente se foi o nome de usu�rio ou a
senha que n�o coincidiu. */

#INCLUDE 'TOTVS.CH'
#DEFINE USUARIO_CORRETO 'stephani'
#DEFINE SENHA_CORRETA 'ste123'
#DEFINE TITULO_TELA 'Login'
/*/{Protheus.doc} User Function TelaLogin
    Solicita usu�rio e senha e verifica se est�o corretos
    @type  Function
    @author Stephani Miler
    @since 13/03/2023
/*/
User Function TelaLogin()

    Local cTexto         := 'Digite o nome de usu�rio:  '
    Local cTexto2        := 'Digite a senha: '
    Local nOpcao         := 0
    Local cUser          := Space(10)
    Local cPalavraChave  := Space(10)
    Local oDlg           := NIL

    //Solicita ao usu�rio nome e senha
    DEFINE MSDIALOG oDlg TITLE TITULO_TELA FROM 000,000 TO 100, 400 PIXEL
    @ 014, 010 SAY    cTexto   SIZE 90, 12 OF oDlg PIXEL
    @ 034, 010 SAY    cTexto2  SIZE 90, 12 OF oDlg PIXEL
    @ 010, 080 MSGET  cUser    SIZE 55, 11 OF oDlg PIXEL
    @ 030, 080 MSGET  cPalavraChave    SIZE 55, 11 OF oDlg PIXEL PASSWORD
    @ 010, 140 BUTTON 'Ok'       SIZE 55, 11 OF oDlg PIXEL ACTION Login(cUser, cPalavraChave)
    @ 030, 140 BUTTON 'Cancelar' SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 2, oDlg:End())

    ACTIVATE MSDIALOG oDlg CENTERED

Return

Static Function Login(cUser, cPalavraChave)

    if cUser = USUARIO_CORRETO .AND. cPalavraChave = SENHA_CORRETA //Caso o usu�rio e senha estejam corretos, mensagem ok!
        FwAlertSuccess('Acesso permitido!')
    else
        FwAlertError('Usu�rio ou senha inv�lido!') //Caso contr�rio, mensagem de erro!
    endif

Return
