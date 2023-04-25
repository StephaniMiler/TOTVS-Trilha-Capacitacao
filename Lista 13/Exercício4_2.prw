#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function Copia
    Copiar um arquivo de uma pasta para outra
    @type  Function
    @author Stephani Miler
    @since 24/04/2023
/*/
User Function Copia()
	Local cPastaOrigem  := 'C:\Windows\Temp\lista 13 � ex1'
    Local cPastaDestino := 'C:\TOTVS12\Protheus\protheus_data\lista13\'
    Local aArquivos  := Directory(cPastaOrig + '*.*' /*Caminho + Tipos de Arquivos*/, 'D' /*Atribuos*/,/*Comp*/,/*Case Sensitive*/, 1 /*Ordena��o dos arquivos*/)
    Local nI            := 0 

    //Copiando os arquivos da pasta de origem para a pasta de destino
    if Len(aArquivos) > 0 
        for nI := 3 to len(aArquivos)
            if !CpyT2S(cPastaOrigem + aArquivos[nI][1], cPastaDestino)
                MsgStop('N�o foi poss�vel copiar o arquivo ' + aArquivos[nI][1])
            endif 
        next 

        FwAlertSuccess('Arquivo(s) copiado(s) para a pasta', 'Conclu�do!')
    else 
        FwAlertInfo('A pasta n�o possui nenhum arquivo', 'Aten��o!')
    endif 
Return
