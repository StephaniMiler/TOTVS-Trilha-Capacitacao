#include 'TOTVS.CH'
#include 'REPORT.CH'

/*/{Protheus.doc} User Function TREPORT
    Relatório de Pedidos de Compra usando TReport
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
	Local oReport	:= TReport():New('TReport', 'Relatório de Pedidos de Compra',,{|oReport| Imprime(oReport, cAlias)}, 'Infomações de Pedidos de Compra',.F.,,,, .T., .T.)	
	//? Instanciando a classe de sessão (Ficará dentro da impressão)
	Local oSection1	:= TRSection():New(oReport, "Pedidos de Compra cadastrados",,,.F.,.T.)
    Local oSection2 := TRSection():New(oSection1, "Itens do Pedido de Compra",,,.F.,.T.)		

	//? Criando as células onde ficarão as informações
	TRCell():New(oSection1, 'C7_NUM', 'SC7', 'Nº Pedido', /*Picture*/, 8, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'C7_EMISSAO', 'SC7', 'Data de Emissao', /*Picture*/, 15, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'C7_FORNECE', 'SC7', 'Fornecedor', /*Picture*/, 8, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)	
	TRCell():New(oSection1, 'C7_LOJA', 'SC7', 'Loja', /*Picture*/, 12, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)	
	TRCell():New(oSection1, 'C7_COND', 'SC7', 'Condicao de pagamento', /*Picture*/, 15, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	
    TRCell():New(oSection2, 'C7_PRODUTO', 'SC7', 'Cod. Produto', /*Picture*/, 8, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection2, 'C7_DESCRI', 'SC7', 'Descricao do Produto', /*Picture*/, 15, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection2, 'C7_QUANT', 'SC7', 'Quantidade Vendida', /*Picture*/, 8, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)	
	TRCell():New(oSection2, 'C7_PRECO', 'SC7', 'Valor Unitario', /*Picture*/, 10, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)	
	TRCell():New(oSection2, 'C7_TOTAL', 'SC7', 'Valor Total', /*Picture*/, 15, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)


Return oReport

Static Function Imprime(oReport, cAlias)

	Local oSection1     := oReport:Section(1)
    Local oSection2     := oSection1:Section(1)  
	Local nTotReg		:= 0
	Local cQuery		:= GeraQuery()
	Local cPedAnterior	
	
	DBUseArea(.T., 'TOPCONN', TcGenQry(/*Compat*/, /*Compat*/, cQuery), cAlias, .T., .T.)	

	Count TO nTotReg 

	oReport:SetMeter(nTotReg)
	oReport:SetTitle('Relatório de Pedidos de Compra')  
	(cAlias)->(DBGoTop())

	while !(cAlias)->(EoF())
		If (cAlias)->((C7_NUM)<>cPedAnterior)

			oSection1:Init()
			oReport:StartPage()	
			oSection1:Cell('C7_NUM'):SetValue((cAlias)->C7_NUM)
			oSection1:Cell('C7_EMISSAO'):SetValue((cAlias)->C7_EMISSAO)	
			oSection1:Cell('C7_FORNECE'):SetValue((cAlias)->C7_FORNECE)		
			oSection1:Cell('C7_LOJA'):SetValue((cAlias)->C7_LOJA)	
			oSection1:Cell('C7_COND'):SetValue((cAlias)->C7_COND)

			oSection1:PrintLine()
			oSection1:Finish()
		Endif

		cPedAnterior := ((cAlias)->(C7_NUM))

        oSection2:Init()

		oSection2:Cell('C7_PRODUTO'):SetValue((cAlias)->C7_PRODUTO)
		oSection2:Cell('C7_DESCRI'):SetValue((cAlias)->C7_DESCRI)	
		oSection2:Cell('C7_QUANT'):SetValue((cAlias)->C7_QUANT)		
		oSection2:Cell('C7_PRECO'):SetValue((cAlias)->C7_PRECO)	
		oSection2:Cell('C7_TOTAL'):SetValue((cAlias)->C7_TOTAL)
		
		oSection2:PrintLine()
		oReport:IncMeter()
		(cAlias)->(DBSkip())
	enddo   
	
	(cAlias)->(DBCloseArea())
    oSection2:Finish()	
				
	oReport:EndPage()
Return  

//* Monta a consuta SQL.
Static Function GeraQuery()

	Local cQuery := ''
	cQuery += 'SELECT C7_NUM, C7_EMISSAO, C7_FORNECE, C7_LOJA, C7_COND, C7_PRODUTO, C7_DESCRI, C7_QUANT, C7_PRECO, C7_TOTAL' + CRLF
	cQuery += 'FROM ' + RetSqlName('SC7') + ' SC7' + CRLF
	cQuery += "WHERE D_E_L_E_T_= ' '"

Return cQuery
