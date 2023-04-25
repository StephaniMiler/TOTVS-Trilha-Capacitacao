#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function CriaPasta
  Fun��o para criar uma pasta
  @type  Function
  @author Stephani Sara Miler
  @since 25/04/2023
  /*/
User Function CriaPasta()
  Local cCaminho   := 'C:\TOTVS12\Protheus\protheus_data\' // Endere�o da pasta
  Local cNomePasta := 'Challenge1\' // Nome da pasta

  // Verificando se a pasta j� existe
  if !ExistDir(cCaminho + cNomePasta)
    if MakeDir(cCaminho + cNomePasta) == 0
      if ExistBlock('Escreve')
        ExecBlock('Escreve', .F., .F., cCaminho + cNomePasta)
      endif

      if ExistBlock('EscrCSV')
        ExecBlock('EscrCSV', .F., .F., cCaminho + cNomePasta)
      endif
    else
      FwAlertError('Houve um erro ao criar a pasta ' + cNomePasta, 'Aten��o')
    endif
  else
    if ExistBlock('Escreve')
      ExecBlock('Escreve', .F., .F., cCaminho + cNomePasta)
    endif

    if ExistBlock('EscrCSV')
      ExecBlock('EscrCSV', .F., .F., cCaminho + cNomePasta)
    endif
  endif
Return
