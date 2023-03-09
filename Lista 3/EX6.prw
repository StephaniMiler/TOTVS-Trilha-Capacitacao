#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 6 � Fa�a um programa em que o usu�rio possa
digitar um c�digo de produto e saber se esse
c�digo existe no sistema ou n�o. Caso exista,
apresente o C�digo, Descri��o e o Pre�o de Venda,
caso contr�rio, apresente uma mensagem
informando que n�o existe. */

User Function CodProduto()
    Local aArea   := GetArea() // armazena a �rea atual em que a fun��o est� sendo executada na vari�vel local aArea
    Local cAlias  := GetNextAlias() // alias para a tabela que ser� consultada
    Local cQuery  := ''
    Local cCodigo := ''
    Local cDescri := ''
    Local nValor := 0
    
    
    cCodigo := alltrim(FwInPutBox("Digite o c�digo do produto: ")) //solicita ao usu�rio o c�digo do produto

    //define o ambiente em que a fun��o ser� executada 
    rpcsetenv("99", "01")

    cQuery := 'SELECT trim(B1_COD) as Codigo, B1_DESC, B1_PRV1' + CRLF
    cQuery += 'FROM ' + RetSqlName('SB1') + ' SB1'  + CRLF
    cQuery += "WHERE B1_COD = '" + cCodigo + "'" + "and D_E_L_E_T_ <> '*'"  //filtrar os resultados de acordo com o c�digo inserido pelo usu�rio 
    TCQUERY cQuery ALIAS &(cAlias) NEW
    &(cAlias)->(DbGoTop())

    if ALLTRIM(&(cAlias)->(Codigo)) == '' //Se a consulta n�o retornar nenhum resultado, exibe uma mensagem informando ao usu�rio
       FwAlertInfo("N�o existem itens com esse c�digo no sistema") 
       RETURN
    ENDIF

    while &(cAlias)->(!EOF()) 
        cDescri := &(cAlias)->(B1_DESC)
        nValor  := &(cAlias)->(B1_PRV1)
        &(cAlias)->(DbSkip())
    end

    //exibe uma mensagem com o c�digo, descri��o e pre�o de venda do produto
    FwAlertInfo('C�digo: ' + cCodigo + CRLF + 'Descri��o: ' + cDescri + CRLF + 'Pre�o de venda: ' + ALLTRIM(STR(nValor)), 'Dados do Produto')
    &(cAlias)->(DbCloseArea()) //fecha a �rea de trabalho
    RestArea(aArea) // restaura �rea original

Return 
