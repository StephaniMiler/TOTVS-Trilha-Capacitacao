#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 2 � Fa�a uma consulta na tabela SC5 para retornar todos os pedidos de Venda em que o �n�mero da
nota� (C5_NOTA) n�o foi preenchido. Apresente em uma mensagem quais s�o os n�meros
dos pedidos e o nome dos clientes. */

User Function SC5()
    Local aArea  := GetArea() // a fun��o GetArea() retorna a �rea atual do banco de dados
    Local cPedido   := '' //usada para armazenar o n�mero do pedido
    LOCAL cNota  := '' // usada para armazenar o n�mero da nota fiscal
    Local cMsg   := ''  // usada para armazenar uma mensagem com os detalhes dos pedidos sem nota fiscal
    Local nContador  := 0 // usada para contar quantos pedidos sem nota fiscal foram encontrados

    //define o ambiente que ser� usado para a execu��o da fun��o
    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC5' MODULO 'COM'
    DbSelectArea('SC5') //seleciona a �rea de trabalho
    DbSetOrder(1) //define a ordem de classifica��o
    DbGoTop() //posiciona o cursor no primeiro registro da tabela SC5


    while SC5->(!EOF()) //Enquanto o ponteiro do registro n�o atingir o final do arquivo (EOF())
        cPedido  := SC5->C5_NUM //C5_NUM � atribu�do � vari�vel cPedido
        cNota := SC5->C5_NOTA //C5_NOTA � atribu�do � vari�vel cNota
      
        IF cNota == '         '  //se a nota fiscal do pedido estiver vazia
            cMsg += 'Pedido : ' + cPedido + CRLF //adiciona as informa��es do pedido � vari�vel cMsg
            cMsg += '------------------------------' + CRLF + CRLF
            nContador++ //Soma 1 ao contador nContador
        ENDIF
        if nContador == 10 //verifica se o contador atingiu 10
        FwAlertInfo(cMsg, 'Dados dos Clientes') //Se o contador atingir 10, exibe uma mensagem de alerta com as informa��es dos pedidos
        nContador := 0
        cMsg  := ''
        endif
        DbSkip() //avan�a para o pr�ximo registro da tabela
        
    end
    if nContador > 0 // verifica se ainda existem pedidos sem notas fiscais
        FwAlertInfo(cMsg, 'Dados dos Clientes')
    ELSE
        MSGSTOP( "AA")
    endif
    DbCloseArea() //fecha a �rea de trabalho com DbCloseArea() e restaura a �rea original
    RestArea(aArea)
    
Return
