#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 6 – Faça um programa em que o usuário possa
digitar um código de produto e saber se esse
código existe no sistema ou não. Caso exista,
apresente o Código, Descrição e o Preço de Venda,
caso contrário, apresente uma mensagem
informando que não existe. */

User Function CodProduto()
    Local aArea   := GetArea() // armazena a área atual em que a função está sendo executada na variável local aArea
    Local cAlias  := GetNextAlias() // alias para a tabela que será consultada
    Local cQuery  := ''
    Local cCodigo := ''
    Local cDescri := ''
    Local nValor := 0
    
    
    cCodigo := alltrim(FwInPutBox("Digite o código do produto: ")) //solicita ao usuário o código do produto

    //define o ambiente em que a função será executada 
    rpcsetenv("99", "01")

    cQuery := 'SELECT trim(B1_COD) as Codigo, B1_DESC, B1_PRV1' + CRLF
    cQuery += 'FROM ' + RetSqlName('SB1') + ' SB1'  + CRLF
    cQuery += "WHERE B1_COD = '" + cCodigo + "'" + "and D_E_L_E_T_ <> '*'"  //filtrar os resultados de acordo com o código inserido pelo usuário 
    TCQUERY cQuery ALIAS &(cAlias) NEW
    &(cAlias)->(DbGoTop())

    if ALLTRIM(&(cAlias)->(Codigo)) == '' //Se a consulta não retornar nenhum resultado, exibe uma mensagem informando ao usuário
       FwAlertInfo("Não existem itens com esse código no sistema") 
       RETURN
    ENDIF

    while &(cAlias)->(!EOF()) 
        cDescri := &(cAlias)->(B1_DESC)
        nValor  := &(cAlias)->(B1_PRV1)
        &(cAlias)->(DbSkip())
    end

    //exibe uma mensagem com o código, descrição e preço de venda do produto
    FwAlertInfo('Código: ' + cCodigo + CRLF + 'Descrição: ' + cDescri + CRLF + 'Preço de venda: ' + ALLTRIM(STR(nValor)), 'Dados do Produto')
    &(cAlias)->(DbCloseArea()) //fecha a área de trabalho
    RestArea(aArea) // restaura área original

Return 
