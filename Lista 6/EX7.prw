#INCLUDE 'TOTVS.CH'

/*7 � Utilize um PE para adicionar uma nova op��o ao
bot�o �Outras A��es� do cadastro de
fornecedores. Essa op��o dever� ter o nome
�Cad. Produtos� e quando clicar nela, dever� abrir
o browse do cadastro de produtos, permitindo
realizar qualquer uma das opera��es padr�o
(Incluir, Alterar, Visualizar, Excluir...)*/

User Function MA020ROT()

    Local aRotUser := {}

    aAdd(aRotUser, {'Cad. Produtos', 'U_CadBrowse', 0,6})
    
Return aRotUser

