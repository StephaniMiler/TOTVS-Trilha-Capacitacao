#include 'TOTVS.CH'
#include 'REPORT.CH'

/*/{Protheus.doc} User Function TREPORT
    Relatório de Pedidos de Venda usando TReport
    @type  Function
    @author Stephani Miler
    @since 11/04/2023 
    /*/

User Function TReport()
	Local oReport := GeraReport() 
	
	// Exibindo a tela de configuração para a impressão do relatório
 	oReport:PrintDialog()
Return

Static Function GeraReport()

	Local cAlias	:= GetNextAlias()
    Local oBreak 
	
	//? Instanciando a classe de impressão.
	Local oReport	:= TReport():New('TReport', 'Relatório de Pedidos de Venda',,{|oReport| Imprime(oReport, cAlias)}, 'Infomações de Pedidos de Venda',.F.,,,, .T., .T.)	
	//? Instanciando a classe de sessão (Ficará dentro da impressão)
	Local oSection1	:= TRSection():New(oReport, "Pedidos de Venda cadastrados",,,.F.,.T.)
    Local oSection2 := TRSection():New(oSection1, "Itens do Pedido de Venda",,,.F.,.T.)		

	//? Criando as células onde ficarão as informações
	TRCell():New(oSection1, 'C5_NUM', 'SC5', 'Nº Pedido', /*Picture*/, 8, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
    TRCell():New(oSection1, 'A1_NOME', 'SA1', 'Nome do Cliente', /*Picture*/, 15, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'C5_EMISSAO', 'SC5', 'Data de Emissao', /*Picture*/, 15, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'E4_DESCRI', 'SE4', 'Condicao de Pagamento', /*Picture*/, 8, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)	
	
    TRCell():New(oSection2, 'C6_ITEM', 'SC6', 'Nº Item', /*Picture*/, 8, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection2, 'C6_PRODUTO', 'SC6', 'Código do Produto', /*Picture*/, 15, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
    TRCell():New(oSection2, 'C6_DESCRI', 'SC6', 'Descriçao do Produto', /*Picture*/, 15, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection2, 'C6_QTDVEN', 'SC6', 'Quantidade Vendida', /*Picture*/, 8, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)	
	TRCell():New(oSection2, 'C6_PRCVEN', 'SC6', 'Valor Unitario', /*Picture*/, 10, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)	
	TRCell():New(oSection2, 'C6_VALOR', 'SC6', 'Valor Total', /*Picture*/, 15, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)

    oBreak := TRBreak():New(oSection2, oSection1:Cell('C5_NUM'), '', .T.)

    //? Faz a soma de todos os valores da coluna 'TOTAL'
	TRFunction():New(oSection2:Cell('C6_VALOR'), 'VALTOT', 'SUM', oBreak, 'VALOR TOTAL',,, .F., .F., .F.) 

Return oReport

Static Function imprime(oReport,cAlias)
    Local oSection1 := oReport:Section(1)
	Local oSection2 := oSection1:Section(1)
	Local nTotReg   := 0
	Local cQuery    := GeraQuery()

    DbUseArea(.T., 'TOPCONN', TcGenQry(/*Compat*/,/*Compat*/, cQuery), cAlias, .T., .T.)
	Count TO nTotReg

    
	//configurando a regua
	oReport:SetMeter(nTotReg)
	oReport:SetTitle('Relatório de Pedido de Venda')
	oReport:StartPage()

    
    oSection1:ForceLineStyle()
    oReport:PageTotalInLine(.F.)

    //Iniciando as sessões
	oSection1:Init()
	oSection2:Init()

	(cAlias)->(DbGoTop())

    //sessão 1
	oSection1:Cell('C5_NUM'):SetValue((cAlias)->C5_NUM)
    oSection1:Cell('A1_NOME'):SetValue((cAlias)->A1_NOME)
	oSection1:Cell('C5_EMISSAO'):SetValue(Dtoc(Stod((cAlias)->C5_EMISSAO)))
	oSection1:Cell('E4_DESCRI'):SetValue((cAlias)->E4_DESCRI)

    oSection1:PrintLine()

    (cAlias)->(DbGoTop())

    While (cAlias)->(!EOF())
		if oReport:Cancel()
			Exit
		endif

		//sessão 2
		oSection2:Cell('C6_ITEM'):SetValue((cAlias)->C6_ITEM)
		oSection2:Cell('C6_PRODUTO'):SetValue((cAlias)->C6_PRODUTO)
		oSection2:Cell('C6_DESCRI'):SetValue((cAlias)->C6_DESCRI)
		oSection2:Cell('C6_QTDVEN'):SetValue((cAlias)->C6_QTDVEN)
		oSection2:Cell('C6_PRCVEN'):SetValue((cAlias)->C6_PRCVEN)
		oSection2:Cell('C6_VALOR'):SetValue((cAlias)->C6_VALOR)

		oSection2:PrintLine()

		oReport:IncMeter()
		(cAlias)->(DbSkip())
	enddo

    (cAlias)->(DbCloseArea())
    
    //finaliza as sessões 
    oSection1:Finish()
	oSection2:Finish()

    oReport:EndPage()

return

//* Monta a consuta SQL.
Static Function GeraQuery()

	Local cQuery := '' +;
	"SELECT PED.C5_NUM, PED.C5_EMISSAO, IT.C6_ITEM, IT.C6_PRODUTO, IT.C6_QTDVEN, IT.C6_PRCVEN, IT.C6_VALOR, IT.C6_DESCRI, CL.A1_NOME, PG.E4_DESCRI"+ CRLF +;
    "FROM " + RetSqlName('SC5') + " As PED" + CRLF +;
    "JOIN " + RetSqlName('SC6') + " As IT ON IT.C6_NUM = PED.C5_NUM AND IT.D_E_L_E_T_ = ' '" + CRLF +;
    "JOIN " + RetSqlName('SA1') + " As CL ON CL.A1_COD = PED.C5_CLIENTE AND CL.D_E_L_E_T_ = ' '" + CRLF +;
    "JOIN " + RetSqlName('SE4') + " As PG ON PG.E4_CODIGO = PED.C5_CONDPAG AND PG.D_E_L_E_T_ = ' '" + CRLF +;
    "WHERE PED.D_E_L_E_T_ = ' ' AND PED.C5_NUM = '" + SC5->C5_NUM + "'"

Return cQuery


