#INCLUDE 'TOTVS.CH'

User Function CopiarArq()
	Local cPastaOrig := '\Pedidos de Venda\'
    Local cPastaDest := 'C:\Vendas Protheus\'
    Local aArquivos  := Directory(cPastaOrig + '*.pdf', 'D', , , 1)
    Local nI         := 0 

    if Len(aArquivos) > 0 
        for nI := 1 to len(aArquivos)
            __CopyFile(cPastaOrig + aArquivos[nI][1], cPastaDest + aArquivos[nI][1])
        next 

        FwAlertSuccess('Arquivo(s) copiado(s) para a pasta de destino', 'Concluído!')
    else 
        FwAlertInfo('A pasta não contem nenhum arquivo', 'Erro!')
    endif 
Return
