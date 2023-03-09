#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 7 – Faça um programa em que o usuário possa
digitar um período (data início / data fim) e saber
quais são os pedidos de venda existentes no
período informado. */

User Function InicioFim()
    Local aArea       := GetArea() //armazena a área atual em que a função está sendo executada na variável local aArea
    Local cAlias      := GetNextAlias() // alias para a tabela que será consultada
    Local cQuery      := ''
    Local cDataInicio := ''
    Local cDataFim    := ''
    Local cCodigo     := ''

    cDataInicio := alltrim(FwInPutBox("Digite a data de início: ")) //Solicita ao usuario a data inicial
    cDataFim := alltrim(FwInPutBox("Digite a data de fim: ")) //Solicita ao usuário a data final
    
    //define o ambiente em que a função será executada 
    rpcsetenv("99", "01")

    cQuery := 'SELECT C5_NUM' + CRLF //realiza a consulta na tabela SC5
    cQuery += 'FROM ' + RetSqlName('SC5') + ' SC5'  + CRLF
    cQuery += "WHERE C5_EMISSAO  BETWEEN '" + cDataInicio + "' AND '" +  cDataFim + "' and D_E_L_E_T_ <> '*'" 
    TCQUERY cQuery ALIAS &(cAlias) NEW
    &(cAlias)->(DbGoTop())

    while &(cAlias)->(!EOF())
        cCodigo +='Código do pedido: ' + &(cAlias)->(C5_NUM) + CRLF
        &(cAlias)->(DbSkip())
    end

    FwAlertInfo(cCodigo, 'Pedidos de venda do período') //Imprime os pedidos do período
    &(cAlias)->(DbCloseArea())
    RestArea(aArea)

Return 
