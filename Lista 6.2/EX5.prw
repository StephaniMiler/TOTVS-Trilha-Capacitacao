#INCLUDE 'TOTVS.CH'

/*5 – Utilize um PE para adicionar um botão
“Mensagem” à rotina dos Pedidos de Compra, esse
botão terá uma função simples, apenas deve
apresentar uma mensagem dizendo: “Botão
acionado com sucesso!”.*/

User Function Botao()

    FwAlertInfo('Botão acionado com sucesso!')  
    
Return


User Function MT120BRW()

    aadd(aRotina, {'Botão', 'u_Botao()', 0, 6})

Return 

