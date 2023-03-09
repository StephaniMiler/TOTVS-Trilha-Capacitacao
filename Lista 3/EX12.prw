#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 12 – Faça uma rotina que apresenta, dentre todos
os produtos cadastrados, qual o produto com o
maior preço de venda e o produto com o menor
preço de venda, ou seja, o produto mais caro e o
mais barato. */

User Function Ex12()

    Local aArea      := GetArea() // área atual da tabela
    Local cAlias     := GetNextAlias() // alias para a tabela que será consultada
    Local cQuery     := ''
    Local cMsg       := ''

    //definir o ambiente de execução da consulta
    rpcsetenv("99", "01")

    //Realiza a consulta na tabela SC6
    cQuery := "SELECT TOP 1 MAX(C6_PRCVEN) AS MAIOR_VALOR, MAX(C6_DESCRI) AS MAIOR_DESC, MIN(C6_PRCVEN) AS MENOR_VALOR, MIN(C6_DESCRI) AS MENOR_DESC " +CRLF
    cQuery += "FROM " + RetSqlName('SC6') + " SC6" 

    TCQUERY cQuery ALIAS &(cAlias) NEW
    &(cAlias)->(DbGoTop())

    //o loop while é usado para percorrer os resultados da consulta até o final da tabela
    while &(cAlias)->(!EOF())
        cMsg := "O produto mais caro é: "  + alltrim(&(cAlias)->(MAIOR_DESC)) + "  - Valor: R$" + alltrim(str(&(cAlias)->(MAIOR_VALOR))) + CRLF + CRLF
        //imprime o produto mais caro
        cMsg += "O produto mais barato é: " + alltrim(&(cAlias)->(MENOR_DESC)) + "  - Valor: R$" + alltrim(str(&(cAlias)->(MENOR_VALOR)))  
        //imprime o produto mais barato
 
        &(cAlias)->(DbSkip())
    end

    FwAlertInfo(cMsg, 'Produto mais caro e produto mais barato')
        &(cAlias)->(DbCloseArea()) // o alias é fechado e a área atual é restaurada antes que a função retorne
        RestArea(aArea)
Return 
