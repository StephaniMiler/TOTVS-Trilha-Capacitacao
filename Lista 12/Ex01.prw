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
  Planilha de fornecedores com a classe FwMsExelEx 
  @type  Function
  @author Stephani Miler
  @since 19/04/2023
  /*/
User Function Plan1()
   
    Local oExcel := FwMsExcelEx():New() // Instanciando a classe para criação da planilha
    Local cPath  := 'C:\Users\tehmi\OneDrive\Área de Trabalho\TOTVS\Lista 12\' // Local onde quer salvar o arquivo
    Local cArq   := 'EX1.xls' // nome do arquivo
    Local cAlias := 'SA2'
    Local cQuery 

    rpcsetenv("99", "01")
    cQuery := ConsQuery()

    TCQUERY cQuery ALIAS (cAlias) NEW

    // Criando nova aba
    oExcel:AddworkSheet('Fornecedores')
  
    // Adicionando nova tabela
    oExcel:AddTable('Fornecedores', 'Dados Cadastrais')    

    // Adicionando colunas
    oExcel:AddColumn('Fornecedores', 'Dados Cadastrais', 'Código'   , CENTER , GERAL)
    oExcel:AddColumn('Fornecedores', 'Dados Cadastrais', 'Nome'     , LEFT   , GERAL)
    oExcel:AddColumn('Fornecedores', 'Dados Cadastrais', 'Loja'     , CENTER , GERAL)
    oExcel:AddColumn('Fornecedores', 'Dados Cadastrais', 'CNPJ'     , LEFT   , GERAL)
    oExcel:AddColumn('Fornecedores', 'Dados Cadastrais', 'Endereço' , LEFT   , GERAL)
    oExcel:AddColumn('Fornecedores', 'Dados Cadastrais', 'Bairro'   , LEFT   , GERAL)
    oExcel:AddColumn('Fornecedores', 'Dados Cadastrais', 'Cidade'   , LEFT   , GERAL)
    oExcel:AddColumn('Fornecedores', 'Dados Cadastrais', 'UF'       , CENTER , GERAL)

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

    (cAlias)->(DbGoTop())
    While (cAlias)->(!EOF()) 
 
        oExcel:AddRow('Fornecedores','Dados Cadastrais',{((cAlias)->(A2_COD)), ((cAlias)->(A2_NOME)), ((cAlias)->(A2_LOJA)), ((cAlias)->(A2_CGC)), ;
                                                        ((cAlias)->(A2_END)), ((cAlias)->(A2_BAIRRO)), ((cAlias)->(A2_MUN)), ((cAlias)->(A2_EST))})
      
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
Static Function ConsQuery()

    Local cQuery := ''

	cQuery := 'SELECT A2_COD, A2_NOME, A2_LOJA, A2_CGC, A2_END, A2_BAIRRO, A2_MUN, A2_EST' + CRLF
	cQuery += 'FROM ' + RetSqlName('SA2') + ' SA2' + CRLF
	cQuery += "WHERE D_E_L_E_T_ = ' '"

Return cQuery
