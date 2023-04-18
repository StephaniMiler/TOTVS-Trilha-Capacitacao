#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'RPTDEF.CH'
#INCLUDE 'FWPRINTSETUP.CH'

#DEFINE PRETO    RGB(000, 000, 000)
#DEFINE VERMELHO RGB(255, 000, 000)
#DEFINE MAX_LINE  770
 
/*/{Protheus.doc} User Function FwMsPrinter
    Relat�rio de fornecedores utilizando o FwMsPrinter
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
    cQuery += 'SELECT A2_COD, A2_NOME, A2_LOJA, A2_MUN, A2_EST' + CRLF
	cQuery += 'FROM ' + RetSqlName('SA2') + ' SA2' + CRLF
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
    Local cArqPDF    := 'Forn.pdf'
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
    oPrint:Say(070, 220, 'Cadastro de Fornecedores', oFont16,, VERMELHO)
    
    // T�tulo das colunas
    oPrint:Say(nLinha, 20, 'C�DIGO'     , oFont12, /*Width*/, PRETO)
    oPrint:Say(nLinha, 120, 'NOME'      , oFont12, /*Width*/, PRETO)
    oPrint:Say(nLinha, 250, 'LOJA'      , oFont12, /*Width*/, PRETO)
    oPrint:Say(nLinha, 380, 'MUNIC�PIO' , oFont12, /*Width*/, PRETO)
    oPrint:Say(nLinha, 520, 'UF'        , oFont12, /*Width*/, PRETO)
   
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
       
     
        oPrint:Say(nLinha, 020, AllTrim((cAlias)->(A2_COD)), oFont10,, nCor)
        // Copiando o NOME DO FORNECEDOR para a vari�vel cString
        cString  := AllTrim((cAlias)->(A2_NOME))
        // fun��o que verifica se h� a necessidade de quebrar a linha
        VeriQuebLn(cString, 20, 80)
        // Imprimindo loja
        oPrint:Say(nLinha, 263, AllTrim((cAlias)->(A2_LOJA)), oFont10,, nCor)   
        // Imprimindo munic�pio
        oPrint:Say(nLinha, 380, + AllTrim((cAlias)->(A2_MUN)), oFont10,, nCor)
        // Imprimindo UF
        oPrint:Say(nLinha, 520, AllTrim((cAlias)->(A2_EST)), oFont10,, nCor) 

        nLinha += 30
        (cALias)->(DbSkip())
    enddo
    (cAlias)->(DbCloseArea())
Return

// Fun��o quebra de Linha
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
