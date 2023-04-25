#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function ExclPasta
  Fun��o para excluir pasta.
  @type  Function
  @author Stephani Miler
  @since 24/04/2023
  /*/
User Function ExclPasta()
  Local cPasta    := 'C:\Windows\Temp\lista 13 � ex1\' // Caminho da pasta
  // Pegando todos os arquivos existentes dentro da pasta
  Local aArquivos := Directory(cPasta + '*.*' /*Caminho + Tipos de Arquivos*/, 'D' /*Atribuos*/,/*Comp*/,/*Case Sensitive*/, 1 /*Ordena��o dos arquivos*/)
  Local nI        := 0

  // Verificando se a pasta existe
  if ExistDir(cPasta)
    if MsgYesNo('Confirma a exclus�o da pasta?', 'Aten��o!')
      // Se a pasta tiver algum arquivo
      if LEN(aArquivos) > 0
        for nI := 3 to LEN(aArquivos)
          if FErase(cPasta + aArquivos[nI][1]) == -1 
            MsgStop('Houve um erro ao excluir o arquivo ' + aArquivos[nI][1])
          endif
        next
      endif

      // Apagando a pasta
      if DirRemove(cPasta)
        FwAlertSuccess('Pasta removida com sucesso!', 'Conclu�do!')
      else
        FwAlertError('Houve um erro ao remover a pasta!', 'Aten��o!')
      endif
    endif
  endif
Return
