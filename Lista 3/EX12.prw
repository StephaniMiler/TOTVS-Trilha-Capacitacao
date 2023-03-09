#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 12 � Fa�a uma rotina que apresenta, dentre todos
os produtos cadastrados, qual o produto com o
maior pre�o de venda e o produto com o menor
pre�o de venda, ou seja, o produto mais caro e o
mais barato. */

User Function Ex12()

    Local aArea      := GetArea() // �rea atual da tabela
    Local cAlias     := GetNextAlias() // alias para a tabela que ser� consultada
    Local cQuery     := ''
    Local cMsg       := ''

    //definir o ambiente de execu��o da consulta
    rpcsetenv("99", "01")

    //Realiza a consulta na tabela SC6
    cQuery := "SELECT TOP 1 MAX(C6_PRCVEN) AS MAIOR_VALOR, MAX(C6_DESCRI) AS MAIOR_DESC, MIN(C6_PRCVEN) AS MENOR_VALOR, MIN(C6_DESCRI) AS MENOR_DESC " +CRLF
    cQuery += "FROM " + RetSqlName('SC6') + " SC6" 

    TCQUERY cQuery ALIAS &(cAlias) NEW
    &(cAlias)->(DbGoTop())

    //o loop while � usado para percorrer os resultados da consulta at� o final da tabela
    while &(cAlias)->(!EOF())
        cMsg := "O produto mais caro �: "  + alltrim(&(cAlias)->(MAIOR_DESC)) + "  - Valor: R$" + alltrim(str(&(cAlias)->(MAIOR_VALOR))) + CRLF + CRLF
        //imprime o produto mais caro
        cMsg += "O produto mais barato �: " + alltrim(&(cAlias)->(MENOR_DESC)) + "  - Valor: R$" + alltrim(str(&(cAlias)->(MENOR_VALOR)))  
        //imprime o produto mais barato
 
        &(cAlias)->(DbSkip())
    end

    FwAlertInfo(cMsg, 'Produto mais caro e produto mais barato')
        &(cAlias)->(DbCloseArea()) // o alias � fechado e a �rea atual � restaurada antes que a fun��o retorne
        RestArea(aArea)
Return 
