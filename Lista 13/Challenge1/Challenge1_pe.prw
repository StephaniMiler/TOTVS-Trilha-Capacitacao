#INCLUDE 'TOTVS.CH'

User Function MT410INC() //Para inclusões
    Local lRet  := .T.
    Local aArea    := GetArea()
    Local aAreaSC5 := SC5->(GetArea()) 
    Local aRelatorio
    Local aLog
    Local aPasta
    //Local aCopia       

    If INCLUI
        //Função que gera relatório
        FwAlertInfo("Aguarde, gerando relatório.", "Aguarde!")
        aRelatorio := u_TReport()
        //Funções que geram pasta e copia arquivo
        aPasta     := u_CriaPasta()
        aCopia     := u_CopiaArq()
        //Função que gera o log
        FwAlertInfo("Aguarde, gerando Log.", "Aguarde!")
        aLog       := u_GeraLog()
    Endif


    RestArea(aAreaSC5)
    RestArea(aArea)

Return lRet
