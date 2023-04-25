#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function CriaNvPasta
  Função para criar pasta e copiar arquivo de uma pasta para outra.
  @type  Function
  @author Stephani Miler
  @since 25/04/2023
  /*/

User Function CriaNvPasta()

  Local cPath  := 'C:\TOTVS12\Protheus\protheus_data\'
	Local cPasta := 'lista13\'

	if !ExistDir(cPath + cPasta)
		if MakeDir(cPath + cPasta) == 0
			if ExistBlock('Copia')
				ExecBlock('Copia', .F., .F., cPath + cPasta)
			endif
		else
			FwAlertError('Erro ao criar a pasta')
		endif
	else
		if ExistBlock('Copia')
			ExecBlock('Copia', .F., .F., cPath + cPasta)
		endif
	endif

Return

