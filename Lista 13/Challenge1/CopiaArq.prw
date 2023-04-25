#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function CopiaArq
  Função para copiar arquivos de uma pasta
  @type  Function
  @author Stephani Sara Miler
  @since 25/04/2023
  /*/
User Function CopiaArq()
  Local cPastaOrig := 'C:\TOTVS12\Challenge\' // Pasta Origem
  Local cPastaDest := 'C:\TOTVS12\Protheus\protheus_data\Challenge1\' // Pasta Destino
  // Pegando os arquivos dentro da pasta de origem
  Local aArquivos  := Directory(cPastaOrig + '*.*' /*Caminho + Tipos de Arquivos*/, 'D' /*Atribuos*/,/*Comp*/,/*Case Sensitive*/, 1 /*Ordenao dos arquivos*/)
  Local nI         := 0

  if LEN(aArquivos) > 0
    for nI := 3 to LEN(aArquivos)
      if !CpyT2S(cPastaOrig + aArquivos[nI][1], cPastaDest)      
        MsgStop('Houve um erro ao copiar o arquivo ' + aArquivos[nI][1])
      endif
    next

    FwAlertSuccess('Arquivo(s) copiado(s) com sucesso!', 'Concluído!')
  else
    FwAlertInfo('Apasta não contem nenhum arquivo!', 'Atenção!')
  endif
Return
