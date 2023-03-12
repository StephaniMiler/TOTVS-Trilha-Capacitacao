#INCLUDE 'TOTVS.CH'

/*9 – Implemente uma validação na exclusão de
Cadastros de Fornecedores. O sistema deverá
perguntar se o usuário confirma a exclusão do
cadastro, se ele confirmar, o cadastro deverá ser
excluído, caso contrário, deverá permanecer na
tela de exclusão.*/

User Function CUSTOMERVENDOR()

	Local aParam := PARAMIXB
	Local lRet := .T.
	Local oObj := ''
	Local cIdPonto := ''
	Local cIdModel := ''
    Local nOper := 0
    
	If aParam <> NIL
		oObj := aParam[1]
		cIdPonto := aParam[2]
		cIdModel := aParam[3]
        if cIdPonto == 'MODELPOS'
			nOper := oObj:nOperation
			if nOper == 5
				if ExistBlock('VldExcl')
					lRet := ExecBlock('VldExcl',.F.,.F.)
				endif
			endif
		endif
	endif

Return lRet
