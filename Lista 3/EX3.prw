#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 3 - Faça uma consulta na tabela SC5 que retorne todos os produtos do pedido “PV0008” e
apresente os seguintes campos em uma mensagem: Código – Descrição – Qtd – Vl. Unit – Vl Total */


User Function PV0008()
    Local aArea  := GetArea()  //armazena o local da área de trabalho atual em uma variável chamada aArea
    Local cAlias := GetNextAlias() //armazena o próximo alias disponível na área de trabalho atual em uma variável local chamada cAlias
    Local cMsg   := '' 
    Local cQuery := ''

    //define o ambiente em que a função será executada 
    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC5' MODULO 'FAT'

    //constrói uma consulta SQL que retorna informações sobre os produtos do pedido "PV0008"
    cQuery := "SELECT C5.C5_NUM, C6.C6_PRODUTO, C6.C6_DESCRI, C6.C6_QTDVEN, C6.C6_PRCVEN, C6.C6_VALOR FROM " + RetSqlName('SC5') + " C5  INNER JOIN " + RetSqlName('SC6') +  " C6 ON	C5.C5_NUM = C6.C6_NUM WHERE C5_NUM = 'PV0008'"

    //a consulta SQL é definida na variável cQuery usando o alias temporário armazenado em cAlias
    TCQUERY cQuery ALIAS &(cAlias)

    // posiciona o ponteiro de registro no início
    &(cAlias)->(DbGoTop())

    while &(cAlias)->(!EOF()) // loop que percorre todos os registros do resultado da consulta
 
        cMsg += 'Pedido : '           + &(cAlias)            -> (C6_PRODUTO)  + CRLF +; //adiciona ao final de cMsg uma linha com o número do pedido
                'Descrição : '        + cValToChar(&(cAlias) -> (C6_DESCRI))  + CRLF +; // adiciona ao final de cMsg uma linha com a descrição do produto
                'Quantidade : '       + cValToChar(&(cAlias) -> (C6_QTDVEN))  + CRLF +; //adiciona ao final de cMsg uma linha com a quantidade de produtos vendidos
                'Valor unitário : R$' + cValToChar(&(cAlias) -> (C6_PRCVEN))  + CRLF +; // '' com o valor unitário dos produtos
                'Valor total : R$'    + cValToChar(&(cAlias) -> (C6_VALOR))   + CRLF +; // '' com o valor total do pedido
                '___________________________________________' + CRLF + CRLF
        &(cAlias)->(DbSkip()) // deslocar p/ o próximo registro da tabela atualmente aberta no alias cAlias
    end

    FwAlertInfo(cMsg, 'Produtos do pedido de venda PV0008')

    &(cAlias)->(DbCloseArea()) //fecha a área de trabalho com DbCloseArea() e restaura a área original
    RestArea(aArea)
    
Return

