#INCLUDE 'TOTVS.CH'

/*7 – Utilize um PE para adicionar uma nova opção ao
botão “Outras Ações” do cadastro de
fornecedores. Essa opção deverá ter o nome
“Cad. Produtos” e quando clicar nela, deverá abrir
o browse do cadastro de produtos, permitindo
realizar qualquer uma das operações padrão
(Incluir, Alterar, Visualizar, Excluir...)*/

User Function MA020ROT()

    Local aRotUser := {}

    aAdd(aRotUser, {'Cad. Produtos', 'U_CadBrowse', 0,6})
    
Return aRotUser

