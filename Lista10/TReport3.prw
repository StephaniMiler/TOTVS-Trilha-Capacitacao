#include 'TOTVS.CH'
#include 'REPORT.CH'

/*/{Protheus.doc} User Function TREPORT
    Relatório de Produtos usando TReport
    @type  Function
    @author Stephani Miler
    @since 05/04/2023 
    /*/

User Function TReport()
	Local oReport := GeraReport() 
	
	// Exibindo a tela de configuração para a impressão do relatório
 	oReport:PrintDialog()
Return

Static Function GeraReport()
	Local cAlias	:= GetNextAlias()
	
	//? Instanciando a classe de impressão.
	Local oReport	:= TReport():New('TReport', 'Relatório de Produtos',,{|oReport| Imprime(oReport, cAlias)}, 'Infomações de Produtos',.F.,,,, .T., .T.)	
	//? Instanciando a classe de sessão (Ficará dentro da impressão)
	Local oSection1	:= TRSection():New(oReport, "Produtos cadastrados",,,.F.,.T.)		
	
	//? Criando as células onde ficarão as informações
	TRCell():New(oSection1, 'B1_COD', 'SB1', 'Codigo', /*Picture*/, 8, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'B1_DESC', 'SB1', 'Descrição', /*Picture*/, 30, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'B1_UM', 'SB1', 'Un. de Medida', /*Picture*/, 8, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)	
	TRCell():New(oSection1, 'B1_PRV1', 'SB1', 'Preço', /*Picture*/, 12, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)	
	TRCell():New(oSection1, 'B1_LOCPAD', 'SB1', 'Armazém', /*Picture*/, 8, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	
Return oReport
