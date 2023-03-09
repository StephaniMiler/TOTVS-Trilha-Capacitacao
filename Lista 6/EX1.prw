#INCLUDE 'TOTVS.CH'

/*1 – Crie um ponto de entrada que seja executado
na inclusão/alteração de produtos. O objetivo
desse PE é acrescentar o texto “Cad. Manual - ”
antes da descrição do produto.
o Ex: “Cad. Manual – Fone de Ouvido”.*/

User Function MT010ALT() //Para alterações

    Local aArea    := GetArea() //é uma boa prática utilizar o GetArea e RestArea das tabelas e das vaiáveis.
    Local aAreaSB1 := SB1->(GetArea()) //SB1 pois é a tabela de cadastro de produtos
    Local lRetorno := .T.
    

    SB1->B1_DESC := ALLTRIM('Cad. Manual - ' + M->B1_DESC) //Informa a tabela e o campo desejado

    RestArea(aArea)
    RestArea(aAreaSB1)

Return lRetorno

User Function MT010INC() //Para inclusões

    Local aArea    := GetArea()
    Local aAreaSB1 := SB1->(GetArea())
    Local lRetorno := .T.
   

    SB1->B1_DESC := ALLTRIM('Cad. Manual - ' + M->B1_DESC)

    RestArea(aArea)
    RestArea(aAreaSB1)

Return lRetorno

