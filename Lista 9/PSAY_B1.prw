#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function PSAY_B1
	Relatório de produtos
	@type  Function
	@author Stephani Miler
	@since 03/04/2023
	/*/
User Function PSAY_B1()        
	Local cTitulo       := 'Cadastros de Produtos'
	Private cTamanho    := 'M'
	Private cNomeProg   := 'PSAY_B1' // Nome do programa para impressao no cabecalho
	Private aReturn     := {'Zebrado', 1, 'Produtos', 1, 2, '', '', 1}
	Private nLastKey    := 0
	Private cNomRel     := 'PSAY_B1' // Nome do arquivo usado para impressao em disco
	Private cAlias 	    := 'SB1'

	// Monta a interface padrÃ£o com o usuario
	cNomRel := SetPrint(cAlias, cNomeProg, '', @cTitulo, '', '', '', .F.,, .T., cTamanho,, .F.)

	// Se pressionar "ESC" encerra o programa
	if nLastKey == 27
		FwAlertError('Operação cancelada pelo usuário!', 'CANCELADO!')
		Return
	endif

	// Prepara o ambiente para impressÃ£o
	SetDefault(aReturn, cAlias,, .T., 1)

	// Processamento. RPTSTATUS monta janela com a regua de processamento.
	RptStatus({|| Imprime(cTitulo)}, cTitulo)
Return

Static Function Imprime(cTitulo)
    Local cTraco		 := '----------------------------------------'
	Local nLinha 		 := 2 // Linha em que a impressão iniciará
	Local nCont			 := 0

	DbSelectArea('SB1')
	SB1->(DbSetOrder(1))

	// ImpressÃ£o dos dados de cada registro
	while !Eof() 
		@ nLinha, 00 PSAY PADR('Código: ', 10) + Alltrim(SB1->B1_COD)
		nLinha++

		@ nLinha, 00 PSAY PADR('Descrição do Produto: ', 10) + Alltrim(SB1->B1_DESC)
		nLinha++

		@ nLinha, 00 PSAY PADR('Unidade de medida: ', 10) + Alltrim(SB1->B1_UM)
		nLinha++
		
		@ nLinha, 00 PSAY PADR('Preço: R$ ', 10) +Alltrim(STR(SB1->B1_PRV1,,2))
		nLinha++
		
		@ nLinha, 00 PSAY PADR('Armazém: ', 10) + Alltrim(SB1->B1_LOCPAD)
		nLinha++
				
		@ nLinha,00 PSAY cTraco
		nLinha++
		
		nCont++
		If nCont == 10
			nLinha := 0
		Endif

		SB1->(dbSkip())
    enddo

	// Finaliza a execução do relatório
	SET DEVICE TO SCREEN

	//Se impressao em disco, chama o gerenciador de impressão
	if aReturn[5] == 1
		SET PRINTER TO dbCommitAll()
		OurSpool(cNomRel) // Gerenciador de impressão do Protheus
	endif

	// Descarrega o spool de impressão
	MS_FLUSH()
Return
