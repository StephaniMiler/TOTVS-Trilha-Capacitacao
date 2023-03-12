#INCLUDE 'TOTVS.CH'

/*9 � Implemente uma valida��o na exclus�o de
Cadastros de Fornecedores. O sistema dever�
perguntar se o usu�rio confirma a exclus�o do
cadastro, se ele confirmar, o cadastro dever� ser
exclu�do, caso contr�rio, dever� permanecer na
tela de exclus�o.*/

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
