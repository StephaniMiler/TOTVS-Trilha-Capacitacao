#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 1 – Faça uma consulta na tabela SC7 para retornar todos os pedidos realizados para o fornecedor “Super Cabos”.
Apresente o resultado em uma função de mensagem com a seguinte estrutura:
Pedido 1: PC0001
Pedido 2: PC0002. */

User Function SC7()

    Local aArea         := GetArea() // a função GetArea() retorna a área atual do banco de dados.
    Local cPedidoCompra := '', cFornecedor := '', cMsg := '', cArmazena := ''
    Local nCont         := 1

    //Configurar o ambiente de execução para a empresa 99, filial 01 e tabela "SC7" no módulo "COM".
    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC7' MODULO 'COM'

    DbSelectArea('SC7') //A função DbSelectArea('SC7') é chamada para selecionar a área "SC7" do banco de dados.
    DbSetOrder(1) //A função DbSetOrder(1) é chamada para definir a ordem de classificação.
    DbGoTop() //A função DbGoTop() é chamada para mover o ponteiro do registro para o primeiro registro da área selecionada.


    while SC7->(!EOF()) // Enquanto o ponteiro do registro não atingir o final do arquivo (EOF())
        cPedidoCompra  := SC7->C7_NUM //C7_NUM é atribuído à variável cPedidoCompra
        cFornecedor    := SC7->C7_FORNECE //C7_FORNECE é atribuído à variável cFornecedor

        if cArmazena != C7_NUM .and. cFornecedor == 'F00004' //Se o pedido de compra atual for diferente do pedido de compra anterior e o fornecedor for Super Cabos
            cMsg += 'Pedido : ' + cPedidoCompra + CRLF //  cMsg é atualizada com o número do pedido atual
            cMsg += '------------------------------' + CRLF + CRLF
            nCont++ //Contador é atualizado
            cArmazena := SC7->C7_NUM
        ENDIF

        if nCont == 10 //Quando nCont atinge 10, um novo grupo é iniciado.
            FwAlertInfo(cMsg, 'Dados dos Clientes')
            nCont := 0
            cMsg  := ''
        endif
        DbSkip() //A função DbSkip() é chamada para mover o ponteiro do registro para o próximo registro
    end

    if nCont > 0
        FwAlertInfo(cMsg, 'Dados dos Clientes')
    endif

    DbCloseArea() //DbCloseArea() e RestArea(aArea) são chamadas para fechar a área selecionada e restaurar a área anterior do banco de dados.
    RestArea(aArea)
Return
    
