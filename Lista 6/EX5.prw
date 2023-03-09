#INCLUDE 'TOTVS.CH'

/*� 5 � Utilizando Ponto de Entrada, crie uma rotina
que far� com que qualquer produto, quando for
cadastrado no Protheus, tenha o status de
bloqueado (B1_MSBLQL = 1).*/

User Function MT010INC() //Para inclus�es

    Local aArea    := GetArea() //� uma boa pr�tica utilizar o GetArea e RestArea das tabelas e das vari�veis.
    Local aAreaSB1 := SB1->(GetArea()) //SB1 pois � a tabela de produtos
    Local lRetorno := .T.

    RecLock('SB1', .F.)
    SB1->B1_MSBLQL := '1'
	MsUnlock()

    RestArea(aArea)
    RestArea(aAreaSB1)

Return lRetorno
