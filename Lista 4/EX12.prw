#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'
 
/*
• 12 – Faça um programa em que o usuário possa
digitar um período (data início / data fim) e saber
quais são os pedidos de compra existentes no
período informado.
*/

User Function Periodo()

    Local cTitle := 'BUSCA PRODUTO'
    Local cTexto := 'Digite a data de inicial: '
    Local cTexto2 := 'Digite a data final: '
    Local cDataIni := Space(15)
    Local cDataFim :=  Space(15)
    Local nOpcao := 0
    Local oDlg := NIL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 100, 450 PIXEL
    
    @ 014, 010 SAY    cTexto     SIZE 120, 12 OF oDlg PIXEL
    @ 030, 010 SAY    cTexto2    SIZE 120, 12 OF oDlg PIXEL
    @ 010, 090 MSGET  cDataIni   SIZE 55, 11 OF oDlg PIXEL PICTURE '@R 99/99/9999'
    @ 030, 090 MSGET  cDataFim   SIZE 55, 11 OF oDlg PIXEL PICTURE '@R 99/99/9999'
    @ 010, 160 BUTTON 'Buscar'   SIZE 55, 11 OF oDlg PIXEL ACTION PeriodoPedidoCompra(cDataIni, cDataFim)
    @ 035, 160 BUTTON 'Cancelar' SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 1, oDlg:End())

    ACTIVATE MSDIALOG oDlg CENTERED

Return


Static Function PeriodoPedidoCompra(cDataIni, cDataFim)

	Local aArea  := GetArea()
	Local cAlias := GetNextAlias()
	Local cQuery := ''
    Local cPed   := ''
    Local cData  := '' 
    Local cMsg   := ''
    Local nCont  := 0

  cDataIni := DTOS(CTOD(TRANSFORM(cDataIni,'@R 99/99/9999')))
  cDataFim := DTOS(CTOD(TRANSFORM(cDataFim,'@R 99/99/9999')))

  rpcsetenv("99", "01")

  cQuery := 'SELECT C7_NUM, C7_EMISSAO' + CRLF + "FROM " + RetSqlName('SC7') + " SC7" + CRLF + "WHERE C7_EMISSAO BETWEEN '" + cDataIni + "' AND '" + cDataFim + "' "

  TCQUERY cQuery ALIAS &(cAlias) NEW

  while &(cAlias)->(!EOF())
    cPed  := &(cAlias)->(C7_NUM)
    cData := &(cAlias)->(C7_EMISSAO)

    cMsg += 'Pedido Nº: ' + cPed + CRLF + 'Data de emissão: ' + cData + CRLF + '_______________________' + CRLF + CRLF
    nCont++

    if nCont == 10
      FwAlertInfo(cMsg, 'Pedidos de compra')
      cMsg := ''; nCont := 0
    endif

    &(cAlias)->(DbSkip())
  enddo

	FwAlertInfo(cMsg, 'Pedidos de compra')

	&(cAlias)->(DbCloseArea())
	RestArea(aArea)
Return
