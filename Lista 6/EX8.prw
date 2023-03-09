#INCLUDE 'TOTVS.CH'

/*8 – Utilizando um Ponto de Entrada, faça com que
os registros bloqueados de qualquer tabela sejam
apresentados com uma cor diferente, como no
exemplo abaixo (o produto “TESTE 02” está
bloqueado):*/

User Function MBlkColor()

    //Constantes
    #Define CLR_RGB_BRANCO        RGB(254,254,254)    //Cor Branca em RGB
    #Define CLR_RGB_ROSA          RGB(255,000,132)    //Cor Vermelha em RGB

    Local aRet := {}   
 
    //Adicionando as cores
    aAdd(aRet, (CLR_RGB_BRANCO)) //Cor do texto
    aAdd(aRet, (CLR_RGB_ROSA)) //Cor de fundo

Return aRet
