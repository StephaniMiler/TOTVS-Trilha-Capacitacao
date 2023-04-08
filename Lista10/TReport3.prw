#include 'TOTVS.CH'
#include 'REPORT.CH'

/*/{Protheus.doc} User Function TREPORT
    Relat�rio de Produtos usando TReport
    @type  Function
    @author Stephani Miler
    @since 05/04/2023 
    /*/

User Function TReport()
	Local oReport := GeraReport() 
	
	// Exibindo a tela de configura��o para a impress�o do relat�rio
 	oReport:PrintDialog()
Return

Static Function GeraReport()
	Local cAlias	:= GetNextAlias()
	
	//? Instanciando a classe de impress�o.
	Local oReport	:= TReport():New('TReport', 'Relat�rio de Produtos',,{|oReport| Imprime(oReport, cAlias)}, 'Infoma��es de Produtos',.F.,,,, .T., .T.)	
	//? Instanciando a classe de sess�o (Ficar� dentro da impress�o)
	Local oSection1	:= TRSection():New(oReport, "Produtos cadastrados",,,.F.,.T.)		
	
	//? Criando as c�lulas onde ficar�o as informa��es
	TRCell():New(oSection1, 'B1_COD', 'SB1', 'Codigo', /*Picture*/, 8, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'B1_DESC', 'SB1', 'Descri��o', /*Picture*/, 30, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'B1_UM', 'SB1', 'Un. de Medida', /*Picture*/, 8, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)	
	TRCell():New(oSection1, 'B1_PRV1', 'SB1', 'Pre�o', /*Picture*/, 12, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)	
	TRCell():New(oSection1, 'B1_LOCPAD', 'SB1', 'Armaz�m', /*Picture*/, 8, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	
Return oReport
