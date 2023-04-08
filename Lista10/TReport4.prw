#include 'TOTVS.CH'
#include 'REPORT.CH'

/*/{Protheus.doc} User Function TREPORT
    Relatório de Fornecedores usando TReport
    @type  Function
    @author Stephani Miler
    @since 06/04/2023 
    /*/

User Function TReport()
	Local oReport := GeraReport() 
	
	// Exibindo a tela de configuração para a impressão do relatório
 	oReport:PrintDialog()
Return

Static Function GeraReport()
	Local cAlias	:= GetNextAlias()
	
	//? Instanciando a classe de impressão.
	Local oReport	:= TReport():New('TReport', 'Relatorio de Fornecedores',,{|oReport| Imprime(oReport, cAlias)}, 'Infomações de Fornecedores',.F.,,,, .T., .T.)	
	//? Instanciando a classe de sessão (Ficará dentro da impressão)
	Local oSection1	:= TRSection():New(oReport, "Fornecedores cadastrados",,,.F.,.T.)		

	//? Criando as células onde ficarão as informações
	TRCell():New(oSection1, 'A2_COD', 'SA2', 'Codigo', /*Picture*/, 8, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'A2_NREDUZ', 'SA2', 'Nome Fantasia', /*Picture*/, 30, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'A2_LOJA', 'SA2', 'Loja', /*Picture*/, 8, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)	
	TRCell():New(oSection1, 'A2_MUN', 'SA2', 'Municipio', /*Picture*/, 12, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)	
	TRCell():New(oSection1, 'A2_EST', 'SA2', 'Estado', /*Picture*/, 8, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	
Return oReport

Static Function Imprime(oReport, cAlias)
	Local oSection1 := oReport:Section(1)
	Local nTotReg		:= 0
	Local cQuery		:= GeraQuery()	
	
	DBUseArea(.T., 'TOPCONN', TcGenQry(/*Compat*/, /*Compat*/, cQuery), cAlias, .T., .T.)	

	Count TO nTotReg 
	oReport:SetMeter(nTotReg)
	oReport:SetTitle('Relatório de Fornecedores')
	oReport:StartPage()
	oSection1:Init()  
	(cAlias)->(DBGoTop())
	
	//? Percorre todos os registros
	while !(cAlias)->(EoF())
		//? Se cancelar a operação
		if oReport:Cancel() // Cancela o loop, ou seja, o processo.
			Exit
		endif
	
		oSection1:Cell('Codigo'):SetValue((cAlias)->A2_COD)
		oSection1:Cell('Nome fantasia'):SetValue((cAlias)->A2_NREDUZ)	
		oSection1:Cell('Loja'):SetValue((cAlias)->A2_LOJA)		
		oSection1:Cell('Municipio'):SetValue((cAlias)->A2_MUN)	
		oSection1:Cell('Estado'):SetValue((cAlias)->A2_EST)
		
	
		oSection1:PrintLine()
		oReport:ThinLine()
		oReport:IncMeter()
		(cAlias)->(DBSkip())
	enddo   
	
	(cAlias)->(DBCloseArea())
	oSection1:Finish()			
	oReport:EndPage()
Return  

// Monta a consuta SQL.
Static Function GeraQuery()

	Local cQuery := ''
	cQuery += 'SELECT A2_COD, A2_NREDUZ, A2_LOJA, A2_MUN, A2_EST' + CRLF
	cQuery += 'FROM ' + RetSqlName('SA2') + ' SA2' + CRLF
	cQuery += "WHERE D_E_L_E_T_= ' '" + CRLF
	cQuery += " AND A2_COD = '" + SA2->A2_COD + " '"
Return cQuery
