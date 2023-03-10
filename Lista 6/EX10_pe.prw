#INCLUDE 'TOTVS.CH'

/*10 � Desenvolva um PE na rotina FISA010 (Cadastro
de Munic�pios � M�dulo 09). Esse PE deve ser
utilizado para que, quando o usu�rio confirmar a
inclus�o de um novo munic�pio seja verificado se o
nome j� existe para a UF selecionada.
Se j� existir, exibir uma mensagem e impedir que o
processo continue. Caso contr�rio, deixar o
programa prosseguir normalmente.*/

User Function FISA010()

	Local aParam   := PARAMIXB
	Local lRet     := .T.
	Local oObj     := Nil
	Local cIdPonto := ''
	Local cIdModel := ''

	if aParam <> NIL
		oObj     := aParam[1]
		cIdPonto := aParam[2]
		cIdModel := aParam[3]

		if cIdPonto == 'MODELPOS'
			if ExistBlock('ValidaMuni')
				lRet := ExecBlock('ValidaMuni',.F.,.F.)
			endif
		endif
	endif

Return lRet
