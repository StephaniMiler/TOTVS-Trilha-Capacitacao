#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function PSAY_B1
	Relat�rio de produtos
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

	// Monta a interface padrão com o usuario
	cNomRel := SetPrint(cAlias, cNomeProg, '', @cTitulo, '', '', '', .F.,, .T., cTamanho,, .F.)

	// Se pressionar "ESC" encerra o programa
	if nLastKey == 27
		FwAlertError('Opera��o cancelada pelo usu�rio!', 'CANCELADO!')
		Return
	endif

	// Prepara o ambiente para impressão
	SetDefault(aReturn, cAlias,, .T., 1)

	// Processamento. RPTSTATUS monta janela com a regua de processamento.
	RptStatus({|| Imprime(cTitulo)}, cTitulo)
Return

Static Function Imprime(cTitulo)
    Local cTraco		 := '----------------------------------------'
	Local nLinha 		 := 2 // Linha em que a impress�o iniciar�
	Local nCont			 := 0

	DbSelectArea('SB1')
	SB1->(DbSetOrder(1))

	// Impressão dos dados de cada registro
	while !Eof() 
		@ nLinha, 00 PSAY PADR('C�digo: ', 10) + Alltrim(SB1->B1_COD)
		nLinha++

		@ nLinha, 00 PSAY PADR('Descri��o do Produto: ', 10) + Alltrim(SB1->B1_DESC)
		nLinha++

		@ nLinha, 00 PSAY PADR('Unidade de medida: ', 10) + Alltrim(SB1->B1_UM)
		nLinha++
		
		@ nLinha, 00 PSAY PADR('Pre�o: R$ ', 10) +Alltrim(STR(SB1->B1_PRV1,,2))
		nLinha++
		
		@ nLinha, 00 PSAY PADR('Armaz�m: ', 10) + Alltrim(SB1->B1_LOCPAD)
		nLinha++
				
		@ nLinha,00 PSAY cTraco
		nLinha++
		
		nCont++
		If nCont == 10
			nLinha := 0
		Endif

		SB1->(dbSkip())
    enddo

	// Finaliza a execu��o do relat�rio
	SET DEVICE TO SCREEN

	//Se impressao em disco, chama o gerenciador de impress�o
	if aReturn[5] == 1
		SET PRINTER TO dbCommitAll()
		OurSpool(cNomRel) // Gerenciador de impress�o do Protheus
	endif

	// Descarrega o spool de impress�o
	MS_FLUSH()
Return
