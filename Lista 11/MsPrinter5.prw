#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'RPTDEF.CH'
#INCLUDE 'FWPRINTSETUP.CH'

#DEFINE PRETO    RGB(000, 000, 000)
#DEFINE VERMELHO RGB(255, 000, 000)

#DEFINE MAX_LINE  770
 
/*/{Protheus.doc} User Function FwMsPrinter
    Relatório de Pedidos de Compra utilizando o FwMsPrinter
    @type  Function
    @author Stephani Miler
    @since 14/04/2023
/*/
User Function MsPrinter()
    Local cAlias := GeraCons()
    if !Empty(cAlias)
        // Régua de processamento
	    Processa({|| MontaRel(cAlias)}, 'Imprimindo relatório...', 'Aguarde...', .F.)
    else    
        FwAlertError('Nenhum Registro encontrado!', 'Atenção')
    endif
Return

Static Function GeraCons()
    Local aArea  := GetArea()
    Local cAlias := GetNextAlias()
    Local cQuery := ''

    //Consulta Banco de Dados  
    cQuery += "SELECT C7_NUM, C7_EMISSAO, C7_FORNECE, C7_LOJA, C7_COND, C7_PRODUTO, C7_DESCRI, C7_QUANT, C7_PRECO, C7_TOTAL" + CRLF
	cQuery += "FROM " + RetSqlName('SC7') + ' SC7' + CRLF
	cQuery += "WHERE  D_E_L_E_T_= ''"
    TCQUERY cQuery ALIAS (cAlias) NEW
    (cAlias)->(DbGoTop())
    if (cAlias)->(EOF())
       cAlias := '' 
    endif
    
    RestArea(aArea)
Return cAlias

// Criação do Relatório
Static Function MontaRel(cAlias)
    Local cCamPDF    := 'C:\Users\tehmi\OneDrive\Área de Trabalho\TOTVS\'
    Local cArqPDF    := 'TodosPed.pdf'

    
    Private dDataGer := Date()
    Private cHoraGer := Time()
    Private nLinha   := 105
    Private nColIni  := 020
    Private nColFim  := 820
    Private oPrint

    // Criando padrões de fontes
    Private oFont08  := TFont():New('Arial',/*Compat.*/, 08 /*Tamanho*/, /*Compat.*/, .F. /*Negrito*/,/*Compat.*/,/*Compat.*/,/*Compat.*/,/*Compat.*/, .F./*Sublinhado*/, .F./*Itálico*/)
    Private oFont10  := TFont():New('Arial',/*Compat.*/, 10 /*Tamanho*/, /*Compat.*/, .F. /*Negrito*/,/*Compat.*/,/*Compat.*/,/*Compat.*/,/*Compat.*/, .F./*Sublinhado*/, .F./*Itálico*/)
    Private oFont12  := TFont():New('Arial',/*Compat.*/, 12 /*Tamanho*/, /*Compat.*/, .T. /*Negrito*/,/*Compat.*/,/*Compat.*/,/*Compat.*/,/*Compat.*/, .F./*Sublinhado*/, .F./*Itálico*/)
    Private oFont14  := TFont():New('Arial',/*Compat.*/, 14 /*Tamanho*/, /*Compat.*/, .T. /*Negrito*/,/*Compat.*/,/*Compat.*/,/*Compat.*/,/*Compat.*/, .F./*Sublinhado*/, .F./*Itálico*/)
    Private oFont16  := TFont():New('Arial',/*Compat.*/, 16 /*Tamanho*/, /*Compat.*/, .T. /*Negrito*/,/*Compat.*/,/*Compat.*/,/*Compat.*/,/*Compat.*/, .T./*Sublinhado*/, .F./*Itálico*/)

    // Criando objeto de impressão
    oPrint := FWMSPrinter():New(cArqPDF, IMP_PDF, .F., '', .T.,, @oPrint, '',,,, .T.)
    oPrint:cPathPDF := cCamPDF
  
    //orientação da página "Retrato"
    oPrint:SetPortrait()
    // Definindo o tamanho da impressão como A4
    oPrint:setPaperSize(9)
    // Criando nova Página
    oPrint:StartPage()
    // Imprime o cabeçalho
    Cabecalho()
    ImpDados(cAlias)
    oPrint:endPage()
    // Mostrando o relatório
    oPrint:Preview()
Return

//Imprimir o cabeçalho
Static Function Cabecalho(cAlias)
    //caixa para colocar texto
    oPrint:Box(015, 015, 085, 580, '-8')
  
    //texto do 1° cabeçalho
    oPrint:Say(035, 020, 'Empresa / Filial: ' + AllTrim(SM0->M0_NOME) + ' / ' + AllTrim(SM0->M0_FILIAL), oFont14,, PRETO)
    oPrint:Say(070, 220, 'Pedidos de Compra', oFont16,, VERMELHO)
    
    // 2º cabeçalho
    oPrint:Say(nLinha, 20,  'Nº PEDIDO'       , oFont12, /*Width*/, PRETO)
    oPrint:Say(nLinha, 120, 'DATA EMISSAO'    , oFont12, /*Width*/, PRETO)
    oPrint:Say(nLinha, 250, 'FORNECEDOR'      , oFont12, /*Width*/, PRETO)
    oPrint:Say(nLinha, 380, 'LOJA'            , oFont12, /*Width*/, PRETO)
    oPrint:Say(nLinha, 450, 'COND. PAGAMENTO' , oFont12, /*Width*/, PRETO)

    nLinha += 5 
    // Adicionando uma linha horizontal
    oPrint:Line(nLinha, 015, nLinha, 580, /*Cor*/, '-6')

    //3º Cabeçalho
    oPrint:Say(160, 20,  'ITENS'       , oFont12, /*Width*/, PRETO)
    oPrint:Say(160, 120, 'DESCRIÇÃO'   , oFont12, /*Width*/, PRETO)
    oPrint:Say(160, 250, 'QUANTIDADE'  , oFont12, /*Width*/, PRETO)
    oPrint:Say(160, 380, 'PREÇO'       , oFont12, /*Width*/, PRETO)
    oPrint:Say(160, 450, 'VALOR TOTAL' , oFont12, /*Width*/, PRETO)
   
    // Adicionando uma linha horizontal
    oPrint:Line(165, 015, 165, 580, /*Cor*/, '-6')
   
   
	
    
Return

Static Function ImpDados(cAlias)
    Private nCor    := 0

    
    DbSelectArea(cAlias)
    (cAlias)->(DbGoTop())
    while (cAlias)->(!EOF())

        // Verificando se atingiu o número máximo de linhas para uma página (770)
        VeriQuebPg(MAX_LINE)


        nLinha += 20

        //Imprimindo nº do pedido
        oPrint:Say(nLinha, 020, AllTrim((cAlias)->(C7_NUM)), oFont10,, nCor)
        // Imprimindo data de emissão
        oPrint:Say(nLinha, 120, TRANSFORM(STOD((cAlias)->(C7_EMISSAO)), '@R 99/99/9999'), oFont10,, nCor)   
        // Imprimindo fornecedor
        oPrint:Say(nLinha, 270, + AllTrim((cAlias)->(C7_FORNECE)), oFont10,, nCor)
        // Imprimindo loja fornecedor
        oPrint:Say(nLinha, 380, AllTrim((cAlias)->(C7_LOJA)), oFont10,, nCor)
        // Imprimindo cond. pagamento
        oPrint:Say(nLinha, 450, AllTrim((cAlias)->(C7_COND)), oFont10,, nCor)

    
  
        //Imprimindo cód do produto
        oPrint:Say(180, 020, AllTrim((cAlias)->(C7_PRODUTO)), oFont10,, nCor)
        // Imprimindo desc. do produto
        oPrint:Say(180, 120, AllTrim((cAlias)->(C7_DESCRI)), oFont10,, nCor)   
        // Imprimindo qtde vendida
        oPrint:Say(180, 270, + CVALTOCHAR((cAlias)->(C7_QUANT)), oFont10,, nCor)
        // Imprimindo valor unitário
        oPrint:Say(180, 380, CVALTOCHAR((cAlias)->(C7_PRECO)), oFont10,, nCor)
        // Imprimindo valor total
        oPrint:Say(180, 450, CVALTOCHAR((cAlias)->(C7_TOTAL)), oFont10,, nCor) 

        (cALias)->(DbSkip())
                
    enddo
    
    (cAlias)->(DbCloseArea())

   

Return

// Função quebra de Linha
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
            // Aumentando em 10 a posição da linha.
            nLinha += 10
        next
    else
        oPrint:Say(nLinha, nCol, cString, oFont10,, nCor)
    endif
    if lTemQbra
        nLinha -= nQtdLine * 10
    endif
Return

// Função quebra de página
Static Function VeriQuebPg(nMax)
    if nLinha  > nMax
        // Encerra página atual
        oPrint:EndPage()
        //Inicia uma nova página
        oPrint:StartPage()
        nLinha  := 105
        
        // Imprime o cabeçalho
        Cabecalho()
    endif
Return
