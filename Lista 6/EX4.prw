#INCLUDE 'TOTVS.CH'

/*• 4 – Você acabou de mudar a legenda no browse dos
pedidos de venda, agora, utilizando outro PE,
altere as imagens da janela onde é possível
identificar o que cada legenda representa. Deve
ficar desse jeito:*/

User function MA410LEG()

    Local aLeg := PARAMIXB


    aLeg := { {'CHECKOK' ,"Pedido de Venda em aberto"},;
    {'BR_CANCEL' ,"Pedido de Venda encerrado"},;
    {'GCTPIMSE',"Pedido de Venda liberado" },;
    {"BR_AZUL" ,"Pedido Bloqueado por Regra"},;
    {"BR_LARANJA" ,"Pedido Bloqueado por Verba"}}

Return aLeg
