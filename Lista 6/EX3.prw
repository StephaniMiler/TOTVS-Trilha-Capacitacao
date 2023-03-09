#INCLUDE 'TOTVS.CH'

/*• 3 – Utilize um Ponto de Entrada para alterar as
legendas da rotina “Pedidos de Venda”.
As legendas devem utilizar as seguintes imagens:
o Pedido em aberto: “CHECKOK”
o Pedido encerrado: “BR_CANCEL”
o Pedido Liberado: “GCTPIMSE”
Após a alteração o browse dos pedidos de venda
devem ficar da seguinte forma:.*/


User Function MA410COR()

    Local aCores := {} // PARAMIXB traz a estrutura do array padrão

    aAdd(aCores, {"Empty(C5_LIBEROK).And.Empty(C5_NOTA) .And. Empty(C5_BLQ)", "CHECKOK", "Pedido em Aberto"})
    aAdd(aCores, {"!Empty(C5_NOTA).Or.C5_LIBEROK=='E' .And. Empty(C5_BLQ)", "BR_CANCEL", "Pedido Encerrado"})
    aAdd(aCores, {"!Empty(C5_LIBEROK).And.Empty(C5_NOTA).And. Empty(C5_BLQ)", "GCTPIMSE", "Pedido Liberado"})


Return aCores
