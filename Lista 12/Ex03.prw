#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'

#DEFINE LEFT      1
#DEFINE CENTER    2
#DEFINE RIGHT     3
#DEFINE GERAL     1
#DEFINE NUMERO    2
#DEFINE GERAL     3
#DEFINE DATETIME  4

/*/{Protheus.doc} User Function Plan3
  Planilha de cursos com a classe FwMsExelEx 
  @type  Function
  @author Stephani Miler
  @since 19/04/2023
  /*/
User Function Plan3()
   
    Local oExcel    := FwMsExcelEx():New() // Instanciando a classe para criação da planilha
    Local cPath     := 'C:\Users\tehmi\OneDrive\Área de Trabalho\TOTVS\Lista 12\' // Local onde quer salvar o arquivo
    Local cArq      := 'EX3.xls' // nome do arquivo
    Local aArea     := GetArea()
    Local cAlias    := GetNextAlias()   
    Local cCursoAnt := ''
    Local cQuery 

    rpcsetenv("99", "01")

    cQuery    := ConsQuery()

    TCQUERY cQuery ALIAS &(cAlias) NEW


    //Criando planilha por curso
    (cAlias)->(DbGoTop())
	While (cAlias)->(!EOF())
		//Caso o curso for diferente do anterior
		if (cAlias)->(ZZY_CODIGO) != cCursoAnt
		
			oExcel:AddWorkSheet((cAlias)->(ZZY_NOME))
			oExcel:AddTable((cAlias)->(ZZY_NOME), (cAlias)->(ZZY_NOME))
			oExcel:AddColumn((cAlias)->(ZZY_NOME), (cAlias)->(ZZY_NOME), 'Código'           , CENTER   , GERAL)
			oExcel:AddColumn((cAlias)->(ZZY_NOME), (cAlias)->(ZZY_NOME), 'Nome do Aluno'    , LEFT , GERAL)
			oExcel:AddColumn((cAlias)->(ZZY_NOME), (cAlias)->(ZZY_NOME), 'Idade'            , CENTER   , GERAL)
			cCursoAnt:= (cAlias)->(ZZY_CODIGO)

		endif

		oExcel:AddRow((cAlias)->(ZZY_NOME), (cAlias)->(ZZY_NOME), {(cAlias)->(ZZB_COD), (cAlias)->(ZZB_NOME), (cAlias)->(ZZZ_ID)})

		(cAlias)->(DbSkip())

	enddo

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
    

    RestArea(aArea)

Return

//Consulta Banco de Dados 
Static Function ConsQuery()
    
    cQuery := "SELECT ZZB_COD, ZZB_NOME, ZZZ_ID, ZZY_CODIGO, ZZY_NOME" + CRLF
	cQuery += "FROM " + RetSqlName('ZZY') + ' ZZY' + CRLF
    cQuery += "INNER JOIN "+ RetSqlName('ZZB') +" ZZB ON ZZB.ZZB_CURSO = ZZY_CODIGO" + CRLF
    cQuery += "LEFT JOIN "+ RetSqlName('ZZZ') +" ZZZ ON ZZZ.ZZZ_CODIGO = ZZB_COD" + CRLF
	cQuery += "WHERE ZZY.D_E_L_E_T_= ' '" + CRLF
    cQuery += "ORDER BY ZZY_CODIGO"


Return cQuery
