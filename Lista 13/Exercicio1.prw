#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function CriaPasta
  Fun��o para a cria��o de pastas.
  @type  Function
  @author Stephani Sara Miler
  @since 24/04/2023
  /*/
User Function CriaPasta()
  Local cCaminho   := 'C:\Windows\Temp\' // Endere�o onde a pasta ser� criada
  Local cNomePasta := 'Lista 13 � Ex1\' // Nome da pasta

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
