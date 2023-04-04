#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function PSAYB1C
	Relat�rio de produtos com cabe�alho
	@type  Function
	@author Stephani Miler
	@since 03/04/2023
	/*/
User Function PSAYB1C()        
	Local cTitulo       := 'Cadastros de Produtos'
	Private cTamanho    := 'M'
	Private cNomeProg   := 'PSAYB1C' // Nome do programa para impressao no cabecalho
	Private aReturn     := {'Zebrado', 1, 'Produtos', 1, 2, '', '', 1}
	Private nLastKey    := 0
	Private cNomRel     := 'PSAYB1C' // Nome do arquivo usado para impressao em disco
	Private cAlias 	    := 'SB1'
	Private m_pag	    := 1

	// Monta a interface padrao com o usuario
	cNomRel := SetPrint(cAlias, cNomeProg, '', @cTitulo, '', '', '', .F.,, .T., cTamanho,, .F.)

	// Se pressionar "ESC" encerra o programa
	if nLastKey == 27
		FwAlertError('Opera��o cancelada pelo usu�rio!', 'CANCELADO!')
		Return
	endif

	// Prepara o ambiente para impress�o
	SetDefault(aReturn, cAlias,, .T., 1)

	// Processamento. RPTSTATUS monta janela com a regua de processamento.
	RptStatus({|| Imprime(cTitulo)}, cTitulo)
Return

Static Function Imprime(cTitulo)
	Local cCabec		 := ' C�DIGO              DESCRI��O                        UN MEDIDA                  PRE�O              ARMAZ�M                       '
    Local cTraco		 := '---------------------------------------------------------------------------------------------------------------------------------'
	Local nLinha 		 := 8 // Linha em que a impress�o iniciar�
	Local aColunas	     := {}

	// Colunas para impress�o
	Aadd(aColunas, 001)
	Aadd(aColunas, 012)
	Aadd(aColunas, 043)
	Aadd(aColunas, 074)
	Aadd(aColunas, 093.5)

	DbSelectArea('SB1')
	SB1->(DbSetOrder(1))

	// Cabe�alho do Relat�rio
	Cabec(cTitulo, cCabec, '',, cTamanho)

	// Impress�o dos dados de cada registro em linha
	while !Eof() 
		@ nLinha, aColunas[1] PSAY PADR(Alltrim(SB1->B1_COD), 10)
		@ nLinha, aColunas[2] PSAY PADR(Alltrim(SB1->B1_DESC), 30)
		@ nLinha, aColunas[3] PSAY PADR(Alltrim(SB1->B1_UM), 30)
		@ nLinha, aColunas[4] PSAY 'R$'+Alltrim(STR(SB1->B1_PRV1,,2))
		@ nLinha, aColunas[5] PSAY PADR(Alltrim(SB1->B1_LOCPAD), 20)
		nLinha++
		@ nLinha,00 PSAY cTraco
		nLinha++
		
		SB1->(dbSkip())
  enddo

	// Finaliza a execucao do relatorio...
	SET DEVICE TO SCREEN

	// Se impressao em disco, chama o gerenciador de impress�o
	if aReturn[5] == 1
		SET PRINTER TO dbCommitAll()
		OurSpool(cNomRel) //? Gerenciador de impress�o do Protheus
	endif

	// Descarrega o spool de impress�o
	MS_FLUSH()
Return
