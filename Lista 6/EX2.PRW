#INCLUDE 'TOTVS.CH'

/*� 2 � Crie um campo na tabela SC5 com as seguintes
caracter�sticas:
o Nome do Campo: Tipo de Inclus�o
o Op��es do Campo (Lista): Manual / Autom�tico
Ap�s criar o campo, utilize um ponto de entrada
para impedir a exclus�o de pedidos de venda que
tenham esse novo campo com o valor �Autom�tico�.*/

User Function A410EXC() //Para exclus�es

    Local aArea    := GetArea() //� uma boa pr�tica utilizar o GetArea e RestArea das tabelas e das vari�veis.
    Local aAreaSC5 := SC5->(GetArea()) //SC5 pois � a tabela de pedidos de venda
    Local lRetorno := .T.

    If AllTrim(C5_ZZTIPO) == '2'
        lRetorno := .F.
        FwAlertError('Opera��o n�o autorizada!' , 'Erro!')
    Endif


    RestArea(aArea)
    RestArea(aAreaSC5)

Return lRetorno

