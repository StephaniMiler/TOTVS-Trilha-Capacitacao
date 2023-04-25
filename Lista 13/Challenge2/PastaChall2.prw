#INCLUDE 'TOTVS.CH'

User Function PastaVendas()
    Local cPath  := 'C:\'
	Local cPasta := 'Vendas Protheus\'
	if !ExistDir(cPath + cPasta)
		if MakeDir(cPath + cPasta) == 0
			if ExistBlock('CopiarArq')
				ExecBlock('CopiarArq', .F., .F., cPath + cPasta)
			endif	
		else
			FwAlertError('Erro ao criar a pasta')
		endif
	else
		if ExistBlock('CopiarArq')
			ExecBlock('CopiarArq', .F., .F., cPath + cPasta)
		endif
	endif
Return 
