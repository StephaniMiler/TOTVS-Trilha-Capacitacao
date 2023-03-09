#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 2 – Faça uma consulta na tabela SC5 para retornar todos os pedidos de Venda em que o “número da
nota” (C5_NOTA) não foi preenchido. Apresente em uma mensagem quais são os números
dos pedidos e o nome dos clientes. */

User Function SC5()
    Local aArea  := GetArea() // a função GetArea() retorna a área atual do banco de dados
    Local cPedido   := '' //usada para armazenar o número do pedido
    LOCAL cNota  := '' // usada para armazenar o número da nota fiscal
    Local cMsg   := ''  // usada para armazenar uma mensagem com os detalhes dos pedidos sem nota fiscal
    Local nContador  := 0 // usada para contar quantos pedidos sem nota fiscal foram encontrados

    //define o ambiente que será usado para a execução da função
    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC5' MODULO 'COM'
    DbSelectArea('SC5') //seleciona a área de trabalho
    DbSetOrder(1) //define a ordem de classificação
    DbGoTop() //posiciona o cursor no primeiro registro da tabela SC5


    while SC5->(!EOF()) //Enquanto o ponteiro do registro não atingir o final do arquivo (EOF())
        cPedido  := SC5->C5_NUM //C5_NUM é atribuído à variável cPedido
        cNota := SC5->C5_NOTA //C5_NOTA é atribuído à variável cNota
      
        IF cNota == '         '  //se a nota fiscal do pedido estiver vazia
            cMsg += 'Pedido : ' + cPedido + CRLF //adiciona as informações do pedido à variável cMsg
            cMsg += '------------------------------' + CRLF + CRLF
            nContador++ //Soma 1 ao contador nContador
        ENDIF
        if nContador == 10 //verifica se o contador atingiu 10
        FwAlertInfo(cMsg, 'Dados dos Clientes') //Se o contador atingir 10, exibe uma mensagem de alerta com as informações dos pedidos
        nContador := 0
        cMsg  := ''
        endif
        DbSkip() //avança para o próximo registro da tabela
        
    end
    if nContador > 0 // verifica se ainda existem pedidos sem notas fiscais
        FwAlertInfo(cMsg, 'Dados dos Clientes')
    ELSE
        MSGSTOP( "AA")
    endif
    DbCloseArea() //fecha a área de trabalho com DbCloseArea() e restaura a área original
    RestArea(aArea)
    
Return
