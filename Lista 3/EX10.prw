#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 10 � Desenvolva uma fun��o que receber� um
c�digo de produto. Caso esse produto exista,
calcule a m�dia de quantidade desse item em
pedidos de venda. */

USER FUNCTION QuantidadeProduto()

    Local aArea   := GetArea() //armazena a �rea atual em que a fun��o est� sendo executada na vari�vel local aArea
    Local cAlias  := GetNextAlias() // alias para a tabela que ser� consultada
    Local cQuery  := ''
    Local cMsg    := ''
    Local cPedido := ''

    //define o ambiente em que a fun��o ser� executada 
    rpcsetenv('99', '01')

    cPedido := alltrim((FwInputBox("Digite o c�digo do produto para consultar a sua quantidade vendida: "))) //Solicita ao usu�rio o c�digo do produto

    cQuery := "SELECT SB1.B1_COD, CONCAT(SC6.C6_NUM, ', ') AS NUMPED, AVG(SC6.C6_QTDVEN) AS MEDIA_QUANT" + CRLF //Realiza a consulta na tabela SB1
    cQuery += "FROM " + RetSqlName('SB1') + " AS SB1" + CRLF
    cQuery += "INNER JOIN SC6990 AS SC6 ON SB1.B1_COD = SC6.C6_PRODUTO" + CRLF
    cQuery += "WHERE SC6.C6_PRODUTO = '" + alltrim (cPedido) + "'" + CRLF
    cQuery += "GROUP BY SB1.B1_COD, SC6.C6_QTDVEN, SC6.C6_NUM "+ CRLF

    TCQUERY cQuery ALIAS &(cAlias) NEW
    &(cAlias)->(DbGoTop())

    if ALLTRIM(&(cAlias)->(NUMPED)) == ''
       FwAlertInfo("N�o existem itens vendidos com esse c�digo no sistema") //Caso o c�digo digitado n�o apare�a em nenhum pedido
       RETURN
    ENDIF

    while &(cAlias)->(!EOF())

        cMsg := "O produto: " + alltrim(&(cAlias)->(B1_COD))
        cMsg += " foi utilizado no (s) pedido (s): " + alltrim(&(cAlias)->(NUMPED))
        cMsg += " em uma m�dia de " + alltrim(str(&(cAlias)->(MEDIA_QUANT))) + " itens solicitados em pedidos de venda"

        &(cAlias)->(DbSkip())
    END
        FwAlertInfo(cMsg, 'M�dia de produtos vendidos')
        &(cAlias)->(DbCloseArea())
        RestArea(aArea)
Return
