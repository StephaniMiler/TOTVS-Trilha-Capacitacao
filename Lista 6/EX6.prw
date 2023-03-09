#INCLUDE 'TOTVS.CH'

/*6 – Utilizando Ponto de Entrada, crie uma rotina
que fará com que qualquer cliente, quando for
cadastrado no Protheus, tenha o status de
bloqueado (A1_MSBLQL = 1).*/

User Function M030INC() //Para inclusões

    Local aArea    := GetArea() //é uma boa prática utilizar o GetArea e RestArea das tabelas e das variáveis.
    Local aAreaSA1 := SA1->(GetArea()) //SA1 pois é a tabela de cadastro de clientes
    Local lRetorno := .T.

    RecLock('SA1', .F.)
    SA1->A1_MSBLQL := '1'
	MsUnlock()

    RestArea(aArea)
    RestArea(aAreaSA1)

Return lRetorno
