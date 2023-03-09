#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 9 – Desenvolva uma rotina em que, com base em um código de produto informado pelo usuário, retorne
/todos os pedidos de venda em que esse produto está sendo usado.
Obs: Os números dos pedidos devem estar separados por vírgula. */

USER FUNCTION PedidoProduto()

    Local aArea     := GetArea() //armazena a área atual em que a função está sendo executada na variável local aArea
    Local cAlias    := GetNextAlias() // alias para a tabela que será consultada
    Local cQuery    := ''
    Local cMsg      := ''
    Local cPedido   := ''
    
    //define o ambiente em que a função será executada 
    rpcsetenv("99", "01")

    cPedido := alltrim((FwInputBox("Digite o código do produto desejado: "))) //Solicita ao usuário o código do produto

    cQuery := "SELECT SB1.B1_COD, CONCAT(SC6.C6_NUM, ', ') AS NUMPED_CODPROD" + CRLF //realiza a consulta
    cQuery +="FROM " + RetSqlName('SB1') + " SB1"  + CRLF
    cQuery += "INNER JOIN SC6990 AS SC6 ON SC6.C6_PRODUTO = SB1.B1_COD" + CRLF
    cQuery += "WHERE SB1.B1_COD = '" + cPedido + "'" 

    TCQUERY cQuery ALIAS &(cAlias) new 
    &(cAlias)->(dbGoTop())

    if ALLTRIM(&(cAlias)->(NUMPED_CODPROD)) == '' //Se não existir pedidos do produto informado
       FwAlertInfo("Não existem itens com esse código no sistema") 
       RETURN
    ENDIF

    while &(cAlias)->(!EOF())
        cMsg := "O produto " + ALLTRIM( cPedido ) 
        cMsg += " está nos pedidos de venda " + alltrim((&(cAlias)->(NUMPED_CODPROD)))
        &(cAlias)->(DbSkip())
       
    END

    FwAlertInfo(cMsg, 'Pedidos de venda') //Imprime os pedidos de venda com o produto informado
    &(cAlias)->(DbCloseArea())
    RestArea(aArea)

RETURN
