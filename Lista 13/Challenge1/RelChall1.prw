#INCLUDE 'TOTVS.CH'
#INCLUDE 'REPORT.CH'

/*/{Protheus.doc} User Function TREPORT
    Relatório de Pedidos de Venda usando TReport
    @type  Function
    @author Stephani Miler
    @since 25/04/2023 
    /*/

User Function TReport()
	Local oReport := GeraReport() 
	
	// Exibindo a tela de configuração para a impressão do relatório
 	oReport:PrintDialog()
Return

Static Function GeraReport()
	Local cAlias	:= GetNextAlias()
	Local oBreak 
	
	// Instanciando a classe de impressão.
	Local oReport	:= TReport():New('TReport', 'Pedidos de Venda',,{|oReport| Imprime(oReport, cAlias)}, 'Infomações do Pedido',.F.,,,, .T., .T.)	
	// Instanciando a classe de sessão (Ficará dentro da impressão)
	Local oSection1	:= TRSection():New(oReport, "Pedidos de Venda",,,.F.,.T.)
    Local oSection2 := TRSection():New(oSection1, "Itens do Pedido",,,.F.,.T.)		

	TRCell():New(oSection1, 'C5_NUM'    , 'SC5', 'Nº Pedido'            , /*Picture*/, 8 , /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER' , /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'C5_EMISSAO', 'SC5', 'Data de Emissao'      , /*Picture*/, 15, /*Pixel*/, /*Code-Block*/, 'LEFT'  , .T.,  'LEFT'  , /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'C5_CLIENTE', 'SC5', 'Cliente'              , /*Picture*/, 8 , /*Pixel*/, /*Code-Block*/, 'LEFT'  , .T.,  'LEFT'  , /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)	
	TRCell():New(oSection1, 'C5_LOJACLI', 'SC5', 'Loja do Cliente'      , /*Picture*/, 12, /*Pixel*/, /*Code-Block*/, 'LEFT'  , .T.,  'LEFT'  , /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)	
	TRCell():New(oSection1, 'C5_CONDPAG', 'SC5', 'Condicao de pagamento', /*Picture*/, 15, /*Pixel*/, /*Code-Block*/, 'LEFT'  , .T.,  'LEFT'  , /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	
    TRCell():New(oSection2, 'C6_PRODUTO', 'SC6', 'Cod. Produto'    , /*Picture*/, 8 , /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection2, 'C6_DESCRI' , 'SC6', 'Desc. do Produto', /*Picture*/, 15, /*Pixel*/, /*Code-Block*/, 'LEFT'  , .T., 'LEFT'  , /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection2, 'C6_QTDVEN' , 'SC6', 'Qtde. Vendida'   , /*Picture*/, 8 , /*Pixel*/, /*Code-Block*/, 'LEFT'  , .T., 'LEFT'  , /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)	
	TRCell():New(oSection2, 'C6_PRCVEN' , 'SC6', 'Valor Unitario'  , /*Picture*/, 10, /*Pixel*/, /*Code-Block*/, 'LEFT'  , .T., 'LEFT'  , /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)	
	TRCell():New(oSection2, 'C6_VALOR'  , 'SC6', 'Valor Total'     , /*Picture*/, 15, /*Pixel*/, /*Code-Block*/, 'LEFT'  , .T., 'LEFT'  , /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)

    //? Faz a soma de todos os valores da coluna 'TOTAL'
	TRFunction():New(oSection2:Cell('C6_VALOR'), 'VALTOT', 'SUM', oBreak, 'VALOR TOTAL',,, .F., .F., .F.)

Return oReport

Static Function Imprime(oReport, cAlias)

	Local oSection1 := oReport:Section(1)
    Local oSection2 := oSection1:Section(1)  
	Local nTotReg		:= 0
	Local cQuery		:= GeraQuery()	
	
	DBUseArea(.T., 'TOPCONN', TcGenQry(/*Compat*/, /*Compat*/, cQuery), cAlias, .T., .T.)	

	Count TO nTotReg 

	oReport:SetMeter(nTotReg)
	oReport:SetTitle('Relatório de Pedidos de Venda')
	oReport:StartPage()
	oSection1:Init()  
	(cAlias)->(DBGoTop())
	
    oSection1:Cell('C5_NUM'):SetValue((cAlias)->C5_NUM)
	oSection1:Cell('C5_EMISSAO'):SetValue((cAlias)->C5_EMISSAO)	
	oSection1:Cell('C5_CLIENTE'):SetValue((cAlias)->C5_CLIENTE)		
	oSection1:Cell('C5_LOJACLI'):SetValue((cAlias)->C5_LOJACLI)	
	oSection1:Cell('C5_CONDPAG'):SetValue((cAlias)->C5_CONDPAG)

    oSection1:PrintLine()

	while !(cAlias)->(EoF())
		//if oReport:Cancel() // Cancela o loop, ou seja, o processo.
			//Exit
		//endif
        oSection2:Init()
        
		oSection2:Cell('C6_PRODUTO'):SetValue((cAlias)->C6_PRODUTO)
		oSection2:Cell('C6_DESCRI'):SetValue((cAlias)->C6_DESCRI)	
		oSection2:Cell('C6_QTDVEN'):SetValue((cAlias)->C6_QTDVEN)		
		oSection2:Cell('C6_PRCVEN'):SetValue((cAlias)->C6_PRCVEN)	
		oSection2:Cell('C6_VALOR'):SetValue((cAlias)->C6_VALOR)
		
		oSection2:PrintLine()
		//oReport:ThinLine()
		oReport:IncMeter()
		(cAlias)->(DBSkip())
	enddo   
	
	(cAlias)->(DBCloseArea())
    oSection2:Finish()	
	oSection1:Finish()			
	oReport:EndPage()
Return  

// Monta a consuta SQL.
Static Function GeraQuery()

	Local cQuery := '' +;
	"SELECT PED.C5_NUM, PED.C5_EMISSAO, PED.C5_CLIENTE, PED.C5_LOJACLI, PED.C5_CONDPAG, IT.C6_PRODUTO, IT.C6_QTDVEN, IT.C6_PRCVEN, IT.C6_VALOR, IT.C6_DESCRI"+ CRLF +;
    "FROM " + RetSqlName('SC5') + " As PED" + CRLF +;
    "JOIN " + RetSqlName('SC6') + " As IT ON IT.C6_NUM = PED.C5_NUM AND IT.D_E_L_E_T_ = ' '" + CRLF +;
    "WHERE PED.D_E_L_E_T_ = ' ' AND PED.C5_NUM = '" + SC5->C5_NUM + "'"

Return cQuery
