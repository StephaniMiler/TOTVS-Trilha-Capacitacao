#INCLUDE 'TOTVS.CH'

User Function MA020ROT()
    Local aRotUser := {} //Define Array contendo as Rotinas a executar do programa   
  
    aAdd(aRotUser, {'Relatorio', 'U_MsPrinter', 0,6})

Return (aRotUser)
