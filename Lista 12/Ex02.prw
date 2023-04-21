#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'

#DEFINE LEFT      1
#DEFINE CENTER    2
#DEFINE RIGHT     3
#DEFINE GERAL     1
#DEFINE NUMERO    2
#DEFINE GERAL     3
#DEFINE DATETIME  4

/*/{Protheus.doc} User Function Plan1
  Planilha de produtos com a classe FwMsExelEx 
  @type  Function
  @author Stephani Miler
  @since 19/04/2023
  /*/
User Function Plan2()
   
    Local oExcel := FwMsExcelEx():New() // Instanciando a classe para criação da planilha
    Local cPath  := 'C:\Users\tehmi\OneDrive\Área de Trabalho\TOTVS\Lista 12\' // Local onde quer salvar o arquivo
    Local cArq   := 'EX2.xls' // nome do arquivo
    Local cAlias := 'SB1'
    Local cQuery

    rpcsetenv("99", "01")
    cQuery := ConsBanco()

    TCQUERY cQuery ALIAS (cAlias) NEW


    // Criando nova aba
    oExcel:AddworkSheet('Produtos')
  
    // Adicionando nova tabela
    oExcel:AddTable('Produtos', 'Dados Produtos')    

    // Adicionando colunas
    oExcel:AddColumn('Produtos', 'Dados Produtos', 'Código'         , CENTER , GERAL)
    oExcel:AddColumn('Produtos', 'Dados Produtos', 'Descrição'      , LEFT   , GERAL)
    oExcel:AddColumn('Produtos', 'Dados Produtos', 'Tipo'           , CENTER , GERAL)
    oExcel:AddColumn('Produtos', 'Dados Produtos', 'Un de Medida'   , CENTER , GERAL)
    oExcel:AddColumn('Produtos', 'Dados Produtos', 'Preço de venda' , CENTER , GERAL)


    // Alterando estilo da linha 1
    oExcel:SetLineFont('Times New Roman')
    oExcel:SetLineSizeFont(12)
    oExcel:SetLineBgColor('#808080')
    oExcel:SetLineFrColor('#000000')

    // Alterando estilo da linha 2
    oExcel:Set2LineFont('Times New Roman')
    oExcel:Set2LineSizeFont(12)
    oExcel:Set2LineBgColor('#474a51')
    oExcel:Set2LineFrColor('#000000')

    // Alterando estilo do título da planilha
    oExcel:SetTitleFont('Arial Black')
    oExcel:SetTitleSizeFont(15)
    oExcel:SetTitleBold(.T.)
    oExcel:SetTitleBgColor('#054F77')
    oExcel:SetTitleFrColor('#FFFFFF')

    // Alterando estilos do cabeçalho das colunas
    oExcel:SetHeaderFont('Arial')
    oExcel:SetHeaderSizeFont(13)
    oExcel:SetHeaderBold(.T.)
    oExcel:SetBgColorHeader('#FFFFFF')
    oExcel:SetFrColorHeader('#054F77')

    //Para produtos excluídos
    oExcel:SetCelFrColor('#FF0000')

    (cAlias)->(DbGoTop())
    While (cAlias)->(!EOF()) 
        If (cAlias)->(excluido) == '*'
             oExcel:AddRow('Produtos','Dados Produtos',{((cAlias)->(B1_COD)), ((cAlias)->(B1_DESC)), ((cAlias)->(B1_TIPO)), ((cAlias)->(B1_UM)), ;
                                                        ((cAlias)->(B1_PRV1))},{1,2,3,4,5})

        Else 
             oExcel:AddRow('Produtos','Dados Produtos',{((cAlias)->(B1_COD)), ((cAlias)->(B1_DESC)), ((cAlias)->(B1_TIPO)), ((cAlias)->(B1_UM)), ;
                                                        ((cAlias)->(B1_PRV1))})
        Endif

      
        (cALias)->(DbSkip())

    enddo


    // Ativando a classe
    oExcel:Activate()

    // Gerando arquivo
    oExcel:GetXMLFile(cPath + cArq)

    // Verifica se tem o Excel instalado no PC
    if ApOleClient('MsExcel')
        oExec := MsExcel():New()
        oExec:WorkBooks:Open(cPath + cArq)
        oExec:SetVisible(.T.)
        oExec:Destroy()
    else
        cMsg := 'Microsoft Excel não encontrado!' + CRLF
        cMsg += 'Arquivo salvo em: ' + cPath + cArq
        FwAlertError(cMsg, 'Atenção!')
    endif

    // Desativando a classe
    oExcel:DeActivate()
    

    (cAlias)->(DbCloseArea())


Return

//Consulta Banco de Dados:
Static Function ConsBanco()

    Local cQuery := ''

	cQuery := 'SELECT B1_COD, B1_DESC, B1_TIPO, B1_UM, B1_PRV1, D_E_L_E_T_ as excluido' + CRLF
	cQuery += 'FROM ' + RetSqlName('SB1') + ' SB1' + CRLF

Return cQuery
