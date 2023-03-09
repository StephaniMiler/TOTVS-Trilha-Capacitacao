#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 7 � Fa�a um programa em que o usu�rio possa
digitar um per�odo (data in�cio / data fim) e saber
quais s�o os pedidos de venda existentes no
per�odo informado. */

User Function InicioFim()
    Local aArea       := GetArea() //armazena a �rea atual em que a fun��o est� sendo executada na vari�vel local aArea
    Local cAlias      := GetNextAlias() // alias para a tabela que ser� consultada
    Local cQuery      := ''
    Local cDataInicio := ''
    Local cDataFim    := ''
    Local cCodigo     := ''

    cDataInicio := alltrim(FwInPutBox("Digite a data de in�cio: ")) //Solicita ao usuario a data inicial
    cDataFim := alltrim(FwInPutBox("Digite a data de fim: ")) //Solicita ao usu�rio a data final
    
    //define o ambiente em que a fun��o ser� executada 
    rpcsetenv("99", "01")

    cQuery := 'SELECT C5_NUM' + CRLF //realiza a consulta na tabela SC5
    cQuery += 'FROM ' + RetSqlName('SC5') + ' SC5'  + CRLF
    cQuery += "WHERE C5_EMISSAO  BETWEEN '" + cDataInicio + "' AND '" +  cDataFim + "' and D_E_L_E_T_ <> '*'" 
    TCQUERY cQuery ALIAS &(cAlias) NEW
    &(cAlias)->(DbGoTop())

    while &(cAlias)->(!EOF())
        cCodigo +='C�digo do pedido: ' + &(cAlias)->(C5_NUM) + CRLF
        &(cAlias)->(DbSkip())
    end

    FwAlertInfo(cCodigo, 'Pedidos de venda do per�odo') //Imprime os pedidos do per�odo
    &(cAlias)->(DbCloseArea())
    RestArea(aArea)

Return 
