#INCLUDE 'TOTVS.CH'

User Function MT410INC() //Para inclus�es
    Local lRet  := .T.
    Local aArea    := GetArea()
    Local aAreaSC5 := SC5->(GetArea()) 
    Local aRelatorio
    Local aLog
    Local aPasta
    //Local aCopia       

    If INCLUI
        //Fun��o que gera relat�rio
        FwAlertInfo("Aguarde, gerando relat�rio.", "Aguarde!")
        aRelatorio := u_TReport()
        //Fun��es que geram pasta e copia arquivo
        aPasta     := u_CriaPasta()
        aCopia     := u_CopiaArq()
        //Fun��o que gera o log
        FwAlertInfo("Aguarde, gerando Log.", "Aguarde!")
        aLog       := u_GeraLog()
    Endif


    RestArea(aAreaSC5)
    RestArea(aArea)

Return lRet
