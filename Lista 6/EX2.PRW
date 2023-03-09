#INCLUDE 'TOTVS.CH'

/*• 2 – Crie um campo na tabela SC5 com as seguintes
características:
o Nome do Campo: Tipo de Inclusão
o Opções do Campo (Lista): Manual / Automático
Após criar o campo, utilize um ponto de entrada
para impedir a exclusão de pedidos de venda que
tenham esse novo campo com o valor “Automático”.*/

User Function A410EXC() //Para exclusões

    Local aArea    := GetArea() //é uma boa prática utilizar o GetArea e RestArea das tabelas e das variáveis.
    Local aAreaSC5 := SC5->(GetArea()) //SC5 pois é a tabela de pedidos de venda
    Local lRetorno := .T.

    If AllTrim(C5_ZZTIPO) == '2'
        lRetorno := .F.
        FwAlertError('Operação não autorizada!' , 'Erro!')
    Endif


    RestArea(aArea)
    RestArea(aAreaSC5)

Return lRetorno

