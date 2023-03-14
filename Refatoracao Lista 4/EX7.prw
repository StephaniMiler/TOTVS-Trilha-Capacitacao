/*7 � Fazer um programa que simule um cadastro de
usu�rio e senha para um sistema qualquer.
O usu�rio informar� um �username� e uma senha
que dever� ser digitada duas vezes (confirma��o
de senha).
Realizar as seguintes consist�ncias:
- O �username� deve possuir mais do que 5
caracteres.
- A senha e a confirma��o da senha devem ser
id�nticas.
- A senha deve possuir ao menos 6 caracteres
e deve conter obrigatoriamente:
? Ao menos uma letra mai�scula, um d�gito
num�rico e um s�mbolo. */

#INCLUDE 'PROTHEUS.CH'
#DEFINE TITULO_TELA 'Login'
#DEFINE TEXTO_1 'Digite um nome de usu�rio com pelo menos de 5 caracteres:  '
#DEFINE TEXTO_2 'Crie uma senha com pelo menos 6 caracteres: '
#DEFINE TEXTO_3 'Digite a senha novamente: '

/*/{Protheus.doc} User Function CadastroUser
    Cadastra usu�rio e senha de acordo com os padroes pr� estabelecidos
    @type  Function
    @author Stephani Miler
    @since 13/03/2023
/*/

User Function CadastroUser()

    Local nOpcao    := 0
    Local cUser     := Space(10) 
    Local cSenh     := Space(10) 
    Local cSenha2   := Space(10)
    Local oDlg      := NIL

    //Solicita ao usu�rio um nome e uma senha
    DEFINE MSDIALOG oDlg TITLE TITULO_TELA FROM 000,000 TO 200, 550 PIXEL
    @ 014, 010 SAY    TEXTO_1 SIZE 120, 12 OF oDlg PIXEL
    @ 034, 010 SAY    TEXTO_2 SIZE 120, 12 OF oDlg PIXEL
    @ 054, 010 SAY    TEXTO_3 SIZE 120, 12 OF oDlg PIXEL
    @ 010, 130 MSGET  cUser   SIZE 55, 11 OF oDlg PIXEL
    @ 030, 130 MSGET  cSenh   SIZE 55, 11 OF oDlg PIXEL PASSWORD
    @ 050, 130 MSGET  cSenha2 SIZE 55, 11 OF oDlg PIXEL PASSWORD
    @ 010, 200 BUTTON 'OK'       SIZE 55, 11 OF oDlg PIXEL ACTION ValidaSenha(cUser, cSenh, cSenha2)
    @ 030, 200 BUTTON 'Cancelar' SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 2, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return

Static Function ValidaSenha(cUser, cSenh, cSenha2)

    Local cArmazena :=''
    Local lValido   := .F.
    Local nCont     := 0 
    Local nSoma     := 0
    Local nUser     := 0

    //Verifica se todos os requisitos est�o sendo cumpridos
    cUser := RTRIM(cUser); cSenh := RTRIM(cSenh); cSenha2 := RTRIM(cSenha2)

    if cUser == ''
        FwAlertInfo('Campo do usu�rio est� em branco, por favor, o preencha! ') 
    elseif LEN(cUser) <= 5  //* Solicita o username t� OK
        FwAlertInfo('Username deve ter mais de 5 caracteres.')
    else
        FwAlertInfo('O Username '+cUser+' � aceito!')
        nUser++
    endif

    if cSenha2 == '' .or. cSenh == ''
        FwAlertInfo('Campo da senha em branco, por favor, o preencha! ') 
    elseif len(cSenh) < 6 
        FwAlertInfo('Senha inv�lida! A senha deve ter pelo menos 6 caracteres.')
    elseif cSenha2 != cSenh
        FwAlertInfo('Por favor, digite senhas iguais! ') 
    else
        for nCont:= 1 to len(cSenh)
            if (asc(SubStr(cSenh, nCont)) >= 65 .and. asc(SubStr(cSenh, nCont)) <= 90) .and. lValido == .F.
                cArmazena += 'Cont�m letra mai�scula! ' + CRLF
                nSoma++
                lValido := .T.
            endif
        next

        lValido := .F.
        for nCont:= 1 to len(cSenh)
            if lValido  == .F. .and. (asc(SubStr(cSenh, nCont)) >= 33 .and. asc(SubStr(cSenh, nCont)) <= 47) .or.(asc(SubStr(cSenh, nCont)) >=58 .and. asc(SubStr(cSenh, nCont)) <=64) .or. (asc(SubStr(cSenh, nCont)) >= 91 .and. asc(SubStr(cSenh, nCont)) <= 96) .or. (asc(SubStr(cSenh, nCont)) >= 123 .and. asc(SubStr(cSenh, nCont)) <= 126)
                cArmazena += 'Cont�m s�mbolo!'+ CRLF
                nSoma++
                lValido := .T.
            endif
        next

        lValido := .F.
        for nCont:= 1 to len(cSenh)
            if lValido == .F. .and. (asc(SubStr(cSenh, nCont)) >= 48 .and. asc(SubStr(cSenh, nCont)) <= 57)
                cArmazena += 'Cont�m valor num�rico!'+ CRLF
                nSoma++
                lValido := .T.
            endif
        next

        if nSoma == 3
            FwAlertInfo(cArmazena+ CRLF+ CRLF+ 'A SENHA � V�LIDA!')
        else
            FwAlertInfo('Senha inv�lida!' +CRLF+CRLF+ 'A senha deve conter ao menos uma letra mai�scula, um d�gito num�rico e um s�mbolo.' )
        endif
    endif

    if cSenha2 == cSenh .AND. nSoma == 3 .AND. nUser == 1
        FwAlertSuccess('Usu�rio cadastrado com sucesso! '+ CRLF+ CRLF+'Username: '+ cUser) 
    endif

Return
