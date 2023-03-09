#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 9 � Desenvolva uma rotina em que, com base em um c�digo de produto informado pelo usu�rio, retorne
/todos os pedidos de venda em que esse produto est� sendo usado.
Obs: Os n�meros dos pedidos devem estar separados por v�rgula. */

USER FUNCTION PedidoProduto()

    Local aArea     := GetArea() //armazena a �rea atual em que a fun��o est� sendo executada na vari�vel local aArea
    Local cAlias    := GetNextAlias() // alias para a tabela que ser� consultada
    Local cQuery    := ''
    Local cMsg      := ''
    Local cPedido   := ''
    
    //define o ambiente em que a fun��o ser� executada 
    rpcsetenv("99", "01")

    cPedido := alltrim((FwInputBox("Digite o c�digo do produto desejado: "))) //Solicita ao usu�rio o c�digo do produto

    cQuery := "SELECT SB1.B1_COD, CONCAT(SC6.C6_NUM, ', ') AS NUMPED_CODPROD" + CRLF //realiza a consulta
    cQuery +="FROM " + RetSqlName('SB1') + " SB1"  + CRLF
    cQuery += "INNER JOIN SC6990 AS SC6 ON SC6.C6_PRODUTO = SB1.B1_COD" + CRLF
    cQuery += "WHERE SB1.B1_COD = '" + cPedido + "'" 

    TCQUERY cQuery ALIAS &(cAlias) new 
    &(cAlias)->(dbGoTop())

    if ALLTRIM(&(cAlias)->(NUMPED_CODPROD)) == '' //Se n�o existir pedidos do produto informado
       FwAlertInfo("N�o existem itens com esse c�digo no sistema") 
       RETURN
    ENDIF

    while &(cAlias)->(!EOF())
        cMsg := "O produto " + ALLTRIM( cPedido ) 
        cMsg += " est� nos pedidos de venda " + alltrim((&(cAlias)->(NUMPED_CODPROD)))
        &(cAlias)->(DbSkip())
       
    END

    FwAlertInfo(cMsg, 'Pedidos de venda') //Imprime os pedidos de venda com o produto informado
    &(cAlias)->(DbCloseArea())
    RestArea(aArea)

RETURN
