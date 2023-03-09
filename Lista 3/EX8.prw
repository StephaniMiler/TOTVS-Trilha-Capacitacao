#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 8 � Desenvolva um programa que retorne o produto
de maior valor total dos pedidos de venda (SC6).
O c�digo, descri��o, valor unit�rio e valor total
devem ser apresentados. */

User Function MaiorPedido()
    Local aArea   := GetArea() //armazena a �rea atual em que a fun��o est� sendo executada na vari�vel local aArea
    Local cAlias  := GetNextAlias() // alias para a tabela que ser� consultada
    Local cQuery  := ''
    Local cMsg    := ''

    //define o ambiente em que a fun��o ser� executada
    rpcsetenv("99", "01")

    cQuery := "SELECT top 1 MAX(SC6.C6_VALOR) AS VALOR, SB1.B1_COD, SB1.B1_DESC, SC6.C6_PRCVEN"+ CRLF //realiza a consulta do produto com maior valor
    cQuery += "FROM " + RetSqlName('SC6') + " SC6"  + CRLF //seleciona a tabela na qual ser� localizada a informa��o
    cQuery += 'INNER JOIN SB1990 AS SB1 ON SB1.B1_COD = SC6.C6_PRODUTO'+ CRLF
    cQuery += "WHERE SC6.C6_NUM = '000001' AND SC6.D_E_L_E_T_ <> '*' AND SB1.D_E_L_E_T_ <> '*'"+ CRLF
    cQuery += 'GROUP BY SC6.C6_VALOR, SB1.B1_COD, SB1.B1_DESC, SC6.C6_PRCVEN' + CRLF
    cQuery += 'ORDER BY SC6.C6_VALOR DESC'

    TCQUERY cQuery ALIAS &(cAlias) NEW
    &(cAlias)->(DbGoTop())

    while &(cAlias)->(!EOF())
 
        cMsg +='C�digo: ' + &(cAlias)->(B1_COD) + CRLF //imprime o c�digo, produto e valor do pedido mais alto
        cMsg +='Descri��o: ' +  &(cAlias)->(B1_DESC) + CRLF
        cMsg +='Valor Unit�rio: ' + ALLTRIM(STR( &(cAlias)->(C6_PRCVEN))) + CRLF
        cMsg +='Valor Total: ' + alltrim(str((Valor))) + CRLF  
        &(cAlias)->(DbSkip())
    END
        FwAlertInfo(cMsg, 'Dados do Produto')
        &(cAlias)->(DbCloseArea())
        RestArea(aArea)
Return 
