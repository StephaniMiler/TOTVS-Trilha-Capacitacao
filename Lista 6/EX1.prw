#INCLUDE 'TOTVS.CH'

/*1 � Crie um ponto de entrada que seja executado
na inclus�o/altera��o de produtos. O objetivo
desse PE � acrescentar o texto �Cad. Manual - �
antes da descri��o do produto.
o Ex: �Cad. Manual � Fone de Ouvido�.*/

User Function MT010ALT() //Para altera��es

    Local aArea    := GetArea() //� uma boa pr�tica utilizar o GetArea e RestArea das tabelas e das vai�veis.
    Local aAreaSB1 := SB1->(GetArea()) //SB1 pois � a tabela de cadastro de produtos
    Local lRetorno := .T.
    

    SB1->B1_DESC := ALLTRIM('Cad. Manual - ' + M->B1_DESC) //Informa a tabela e o campo desejado

    RestArea(aArea)
    RestArea(aAreaSB1)

Return lRetorno

User Function MT010INC() //Para inclus�es

    Local aArea    := GetArea()
    Local aAreaSB1 := SB1->(GetArea())
    Local lRetorno := .T.
   

    SB1->B1_DESC := ALLTRIM('Cad. Manual - ' + M->B1_DESC)

    RestArea(aArea)
    RestArea(aAreaSB1)

Return lRetorno

