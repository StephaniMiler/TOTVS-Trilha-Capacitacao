#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function CriaNvPasta
  Fun��o para criar pasta e copiar arquivo de uma pasta para outra.
  @type  Function
  @author Stephani Miler
  @since 25/04/2023
  /*/
User Function CriaNvPasta()
  Local cCaminho   := 'C:\TOTVS\Protheus\protheus_data'
  Local cNomePasta := '\Lista 13\'
  Local cPastaOrig := GetTempPath()+'Lista 13 � Ex1\'
  Local cPastaDest := cCaminho+cNomePasta
  Local aArquivos  := Directory(cPastaOrig + '*.*' /*Caminho + Tipos de Arquivos*/, 'D' /*Atribuos*/,/*Comp*/,/*Case Sensitive*/, 1 /*Ordena��o dos arquivos*/)
  Local nI         := 0

  // Cria a pasta
  if !ExistDir(cPastaDest)
    MakeDir(cPastaDest)
    FwAlertSuccess('Pasta criada com sucesso!', 'Conclu�do!')
  else
    FwAlertInfo('J� existe uma pasta com o mesmo nome!', 'Aten��o!')
  endif
  // C�pia dos arquivos
  if LEN(aArquivos) > 0
      for nI := 3 to LEN(aArquivos)
        if !CpyT2S(cPastaOrig + aArquivos[nI][1], cNomePasta)      
          MsgStop('N�o foi poss�vel copiar o arquivo ' + aArquivos[nI][1])
        endif
      next
      FwAlertSuccess('Arquivo(s) copiado(s) com sucesso!', 'Conclu�do!')
  else
    FwAlertInfo('N�o h� nenhum arquivo na pasta!', 'Aten��o!')
  endif
Return

