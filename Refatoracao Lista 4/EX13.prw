/*13 – Desenvolva uma rotina em que, com base em um
código de produto informado pelo usuário, retorne
todos os pedidos de venda em que esse produto
está sendo usado.*/

#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'
#DEFINE TITULO_TELA 'Pesquisa produto'
#DEFINE TEXTO 'Digite o código do produto'

/*/{Protheus.doc} User Function VendProf
    Consulta todos os pedidos de venda que contenha um determinado produto
    @type  Function
    @author Stephani Miler
    @since 13/03/2023
/*/
User Function VendProd()

    Local cCodigo := Space(15)
    Local nOpcao  := 0
    Local oDlg    := NIL

    DEFINE MSDIALOG oDlg TITLE TITULO_TELA FROM 000,000 TO 100, 450 PIXEL  
    @ 014, 010 SAY   TEXTO   SIZE 120, 12 OF oDlg PIXEL
    @ 010, 090 MSGET cCodigo SIZE 55, 11 OF oDlg PIXEL
    @ 010, 160 BUTTON 'Buscar'   SIZE 55, 11 OF oDlg PIXEL ACTION PedidosVenda(cCodigo)
    @ 035, 160 BUTTON 'Cancelar' SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 1, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return

Static Function PedidosVenda(cCodigo)

	Local aArea := GetArea()
	Local cAlias := GetNextAlias()
	Local cPed := ''
    Local cMsg := 'Pedidos de venda para o produto ' + ALLTRIM(cCodigo) +  ' são: ¦ '

    rpcsetenv("99", "01")

    cQuery := 'SELECT C6_PRODUTO, C6_NUM' + CRLF + "FROM " + RetSqlName('SC6') + " SC6" + CRLF + "WHERE C6_PRODUTO = '" + cCodigo + "' "

	TCQUERY cQuery ALIAS &(cAlias) NEW

	while &(cAlias)->(!EOF())
		cPed := &(cAlias)->(C6_NUM)
		cMsg += cPed + " ¦ "
		&(cAlias)->(DbSkip())
	enddo

	FwAlertInfo(cMsg, 'Pedidos de venda')
	&(cAlias)->(DbCloseArea())
	RestArea(aArea)

Return

