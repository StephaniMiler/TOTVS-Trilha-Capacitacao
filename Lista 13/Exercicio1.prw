#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function CriaPasta
  Fun��o para a cria��o de pastas.
  @type  Function
  @author Stephani Sara Miler
  @since 24/04/2023
  /*/
User Function CriaPasta()

  Local cCaminho   := GetTempPath()
  Local cNomePasta := 'Lista 13 � Ex1\'
  if !ExistDir(cCaminho + cNomePasta)
    if MakeDir(cCaminho + cNomePasta) == 0 
      if ExistBlock('EscreveTxt')             
        ExecBlock('EscreveTxt', .F., .F., cCaminho + cNomePasta)
      endif
    else
      FwAlertError('N�o foi poss�vel criar a pasta ' + cNomePasta, 'Aten��o!')
    endif
  else
    if ExistBlock('EscreveTxt')
      ExecBlock('EscreveTxt', .F., .F., cCaminho + cNomePasta)
    endif
  endif
Return
