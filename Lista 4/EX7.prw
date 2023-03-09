#INCLUDE 'PROTHEUS.CH'

/*7 – Fazer um programa que simule um cadastro de
usuário e senha para um sistema qualquer.
O usuário informará um “username” e uma senha
que deverá ser digitada duas vezes (confirmação
de senha).
Realizar as seguintes consistências:
- O “username” deve possuir mais do que 5
caracteres.
- A senha e a confirmação da senha devem ser
idênticas.
- A senha deve possuir ao menos 6 caracteres
e deve conter obrigatoriamente:
? Ao menos uma letra maiúscula, um dígito
numérico e um símbolo. */

User Function Lista4_7()

    Local cTitle    := 'Login'
    Local cTexto    := 'Digite um nome de usuário com pelo menos de 5 caracteres:  '
    Local cTexto2   := 'Crie uma senha com pelo menos 6 caracteres: '
    Local cTexto3   := 'Digite a senha novamente: '
    Local nOpcao    := 0
    Local cUser     := Space(10) 
    Local cSenh     := Space(10) 
    Local cSenha2   := Space(10)
    Local oDlg      := NIL

    //Solicita ao usuário um nome e uma senha
    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 200, 550 PIXEL
    @ 014, 010 SAY    cTexto       SIZE 120, 12 OF oDlg PIXEL
    @ 034, 010 SAY    cTexto2      SIZE 120, 12 OF oDlg PIXEL
    @ 054, 010 SAY    cTexto3      SIZE 120, 12 OF oDlg PIXEL
    @ 010, 130 MSGET  cUser    SIZE 55, 11 OF oDlg PIXEL
    @ 030, 130 MSGET  cSenh    SIZE 55, 11 OF oDlg PIXEL PASSWORD
    @ 050, 130 MSGET  cSenha2 SIZE 55, 11 OF oDlg PIXEL PASSWORD
    @ 010, 200 BUTTON 'OK'  SIZE 55, 11 OF oDlg PIXEL ACTION ValidaSenha(cUser, cSenh, cSenha2)
    @ 030, 200 BUTTON 'Cancelar'   SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 2, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return

Static Function ValidaSenha(cUser, cSenh, cSenha2)

    Local cArmazena :=''
    local lValido := .F.
    local nCont := 0, nSoma := 0, nUser:=0

    //Verifica se todos os requisitos estão sendo cumpridos
    cUser := RTRIM(cUser); cSenh := RTRIM(cSenh); cSenha2 := RTRIM(cSenha2)

    if cUser == ''
        FwAlertInfo('Campo do usuário está em branco, por favor, o preencha! ') 
    elseif LEN(cUser) <= 5  //* Solicita o username tá OK
        FwAlertInfo('Username deve ter mais de 5 caracteres.')
    else
        FwAlertInfo('O Username '+cUser+' é aceito!')
        nUser++
    endif


    if cSenha2 == '' .or. cSenh == ''
        FwAlertInfo('Campo da senha em branco, por favor, o preencha! ') 
    elseif len(cSenh) < 6 
        FwAlertInfo('Senha inválida! A senha deve ter pelo menos 6 caracteres.')
    elseif cSenha2 != cSenh
        FwAlertInfo('Por favor, digite senhas iguais! ') 
    else
        for nCont:= 1 to len(cSenh)
            if (asc(SubStr(cSenh, nCont)) >= 65 .and. asc(SubStr(cSenh, nCont)) <= 90) .and. lValido == .F.
                cArmazena += 'Contém letra maiúscula! ' + CRLF
                nSoma++
                lValido := .T.
            end if
        NEXT

        lValido := .F.
        for nCont:= 1 to len(cSenh)
            if lValido  == .F. .and. (asc(SubStr(cSenh, nCont)) >= 33 .and. asc(SubStr(cSenh, nCont)) <= 47) .or.(asc(SubStr(cSenh, nCont)) >=58 .and. asc(SubStr(cSenh, nCont)) <=64) .or. (asc(SubStr(cSenh, nCont)) >= 91 .and. asc(SubStr(cSenh, nCont)) <= 96) .or. (asc(SubStr(cSenh, nCont)) >= 123 .and. asc(SubStr(cSenh, nCont)) <= 126)
                cArmazena += 'Contém símbolo!'+ CRLF
                nSoma++
                lValido := .T.
            end if
        NEXT

        lValido := .F.
        for nCont:= 1 to len(cSenh)
            if lValido == .F. .and. (asc(SubStr(cSenh, nCont)) >= 48 .and. asc(SubStr(cSenh, nCont)) <= 57)
                cArmazena += 'Contém valor numérico!'+ CRLF
                nSoma++
                lValido := .T.
            end if
        NEXT

        if nSoma == 3
            FwAlertInfo(cArmazena+ CRLF+ CRLF+ 'A SENHA É VÁLIDA!')
        else
            FwAlertInfo('Senha inválida!' +CRLF+CRLF+ 'A senha deve conter ao menos uma letra maiúscula, um dígito numérico e um símbolo.' )
        endif
    endif

    if cSenha2 == cSenh .AND. nSoma == 3 .AND. nUser == 1
        FwAlertSuccess('Usuário cadastrado com sucesso! '+ CRLF+ CRLF+'Username: '+ cUser) 
    endif

Return
