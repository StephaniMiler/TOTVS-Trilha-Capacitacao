#INCLUDE 'TOTVS.CH'

/*5 � Utilize um PE para adicionar um bot�o
�Mensagem� � rotina dos Pedidos de Compra, esse
bot�o ter� uma fun��o simples, apenas deve
apresentar uma mensagem dizendo: �Bot�o
acionado com sucesso!�.*/

User Function Botao()

    FwAlertInfo('Bot�o acionado com sucesso!')  
    
Return


User Function MT120BRW()

    aadd(aRotina, {'Bot�o', 'u_Botao()', 0, 6})

Return 

