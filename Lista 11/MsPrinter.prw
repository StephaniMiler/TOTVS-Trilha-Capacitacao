#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'RPTDEF.CH'
#INCLUDE 'FWPRINTSETUP.CH'

#DEFINE PRETO    RGB(000, 000, 000)
#DEFINE VERMELHO RGB(255, 000, 000)
#DEFINE MAX_LINE  770
 
/*/{Protheus.doc} User Function FwMsPrinter
    Relat�rio de produtos utilizando o FwMsPrinter
    @type  Function
    @author Stephani Miler
    @since 14/04/2023
/*/
User Function MsPrinter()
    Local cAlias := GeraCons()
    if !Empty(cAlias)
        // R�gua de processamento
	    Processa({|| MontaRel(cAlias)}, 'Imprimindo relat�rio...', 'Aguarde...', .F.)
    else    
        FwAlertError('Nenhum Registro encontrado!', 'Aten��o')
    endif
Return

Static Function GeraCons()
    Local aArea  := GetArea()
    Local cAlias := GetNextAlias()
    Local cQuery := ''

    //Consulta Banco de Dados  
    cQuery += 'SELECT B1_COD, B1_DESC, B1_UM, B1_PRV1, B1_LOCPAD' + CRLF
	cQuery += 'FROM ' + RetSqlName('SB1') + ' SB1' + CRLF
	cQuery += "WHERE D_E_L_E_T_= ' '" + CRLF
    TCQUERY cQuery ALIAS (cAlias) NEW
    (cAlias)->(DbGoTop())
    if (cAlias)->(EOF())
       cAlias := '' 
    endif
    
    RestArea(aArea)
Return cAlias

// Cria��o do Relat�rio
Static Function MontaRel(cAlias)
    Local cCamPDF    := 'C:\Users\tehmi\OneDrive\�rea de Trabalho\TOTVS\'
    Local cArqPDF    := 'Prod.pdf'   
    Private nLinha   := 105
    Private oPrint

    // Criando padr�es de fontes
    Private oFont08  := TFont():New('Arial',/*Compat.*/, 08 /*Tamanho*/, /*Compat.*/, .F. /*Negrito*/,/*Compat.*/,/*Compat.*/,/*Compat.*/,/*Compat.*/, .F./*Sublinhado*/, .F./*It�lico*/)
    Private oFont10  := TFont():New('Arial',/*Compat.*/, 10 /*Tamanho*/, /*Compat.*/, .F. /*Negrito*/,/*Compat.*/,/*Compat.*/,/*Compat.*/,/*Compat.*/, .F./*Sublinhado*/, .F./*It�lico*/)
    Private oFont12  := TFont():New('Arial',/*Compat.*/, 12 /*Tamanho*/, /*Compat.*/, .T. /*Negrito*/,/*Compat.*/,/*Compat.*/,/*Compat.*/,/*Compat.*/, .F./*Sublinhado*/, .F./*It�lico*/)
    Private oFont14  := TFont():New('Arial',/*Compat.*/, 14 /*Tamanho*/, /*Compat.*/, .T. /*Negrito*/,/*Compat.*/,/*Compat.*/,/*Compat.*/,/*Compat.*/, .F./*Sublinhado*/, .F./*It�lico*/)
    Private oFont16  := TFont():New('Arial',/*Compat.*/, 16 /*Tamanho*/, /*Compat.*/, .T. /*Negrito*/,/*Compat.*/,/*Compat.*/,/*Compat.*/,/*Compat.*/, .T./*Sublinhado*/, .F./*It�lico*/)

    // Criando objeto de impress�o
    oPrint := FWMSPrinter():New(cArqPDF, IMP_PDF, .F., '', .T.,, @oPrint, '',,,, .T.)
    oPrint:cPathPDF := cCamPDF
  
    //orienta��o da p�gina "Retrato"
    oPrint:SetPortrait()
    // Definindo o tamanho da impress�o como A4
    oPrint:setPaperSize(9)
    // Criando nova P�gina
    oPrint:StartPage()
    // Imprime o cabe�alho
    Cabecalho()
    ImpDados(cAlias)
    oPrint:endPage()
    // Mostrando o relat�rio
    oPrint:Preview()
Return

//Imprimir o cabe�alho
Static Function Cabecalho(cAlias)
    //caixa para colocar texto
    oPrint:Box(015, 015, 085, 580, '-8')
  
    //texto do cabe�alho
    oPrint:Say(035, 020, 'Empresa / Filial: ' + AllTrim(SM0->M0_NOME) + ' / ' + AllTrim(SM0->M0_FILIAL), oFont14,, PRETO)
    oPrint:Say(070, 220, 'Cadastro de Produtos', oFont16,, VERMELHO)
    
    // T�tulo das colunas
    oPrint:Say(nLinha, 20, 'C�DIGO'    , oFont12, /*Width*/, PRETO)
    oPrint:Say(nLinha, 120, 'DESCRI��O', oFont12, /*Width*/, PRETO)
    oPrint:Say(nLinha, 250, 'UN MEDIDA', oFont12, /*Width*/, PRETO)
    oPrint:Say(nLinha, 380, 'PRE�O'    , oFont12, /*Width*/, PRETO)
    oPrint:Say(nLinha, 500, 'ARMAZ�M'  , oFont12, /*Width*/, PRETO)
   
    nLinha += 5 
    // Adicionando uma linha horizontal
    oPrint:Line(nLinha, 015, nLinha, 580, /*Cor*/, '-6')
    nLinha += 20 
Return

Static Function ImpDados(cAlias)
    Local cString  := ''
    Private nCor   := 0
    
    DbSelectArea(cAlias)
    (cAlias)->(DbGoTop())
    while (cAlias)->(!EOF())
        // Verificando se atingiu o n�mero m�ximo de linhas para uma p�gina (770)
        VeriQuebPg(MAX_LINE)
       
     
        oPrint:Say(nLinha, 020, AllTrim((cAlias)->(B1_COD)), oFont10,, nCor)
        // Copiando o NOME DO PRODUTO para a vari�vel cString
        cString  := AllTrim((cAlias)->(B1_DESC))
        // fun��o que verifica se h� a necessidade de quebrar a linha
        VeriQuebLn(cString, 20, 80)
        // Imprimindo Un. de Medida
        oPrint:Say(nLinha, 263, AllTrim((cAlias)->(B1_UM)), oFont10,, nCor)   
        // Imprimindo pre�o
        oPrint:Say(nLinha, 380, 'R$ ' + AllTrim(STR((cAlias)->(B1_PRV1),,2)), oFont10,, nCor)
        // Imprimindo armaz�m
        oPrint:Say(nLinha, 520, AllTrim((cAlias)->(B1_LOCPAD)), oFont10,, nCor) 

        nLinha += 30
        (cALias)->(DbSkip())
    enddo
    (cAlias)->(DbCloseArea())
Return

// Fun��o quebra de linha
Static Function VeriQuebLn(cString, nLineTam, nCol)
    Local cLinha   := ''
    Local lTemQbra := .F.
    Local nQtdLine := MLCount(cString, nLineTam, /*Tab. Size*/, .F.)
    Local nI       := 1
    if nQtdLine > 1
        lTemQbra := .T.
        for nI := 1 to nQtdLine
            cLinha := MemoLine(cString, nLineTam, nI) 
            oPrint:Say(nLinha, nCol, cLinha, oFont10,, nCor)

            nLinha += 10
        next
    else
        oPrint:Say(nLinha, nCol, cString, oFont10,, nCor)
    endif
    if lTemQbra
        nLinha -= nQtdLine * 10 
    endif
Return

// Fun��o quebra de p�gina
Static Function VeriQuebPg(nMax)
    if nLinha > nMax
        // Encerra p�gina atual
        oPrint:EndPage()
        //Inicia uma nova p�gina
        oPrint:StartPage()
        nLinha := 105
        
        // Imprime o cabe�alho
        Cabecalho()
    endif
Return
