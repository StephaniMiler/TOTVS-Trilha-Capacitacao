#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 11 � Crie uma fun��o que retorne todos os
fornecedores situados em S�o Paulo (SP). */

User Function FornSP()

	Local aArea     := GetArea() //armazena a �rea atual em que a fun��o est� sendo executada na vari�vel local aArea
    Local cAlias    := GetNextAlias() // alias para a tabela que ser� consultada
	Local cArmazena := ''
    Local cQuery    := ''

    //define o ambiente em que a fun��o ser� executada 
	PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SA2' MODULO 'COM'

    /*a vari�vel cQuery � definida como uma consulta SQL para selecionar os nomes dos fornecedores da tabela SA2 
	que estejam no estado de SP e que n�o tenham sido marcados para exclus�o. */
    cQuery := "SELECT A2_NOME " + "FROM " + RetSqlName('SA2') + " SA2" + CRLF + " WHERE A2_EST = 'SP' AND D_E_L_E_T_ = ' '"

	// executa a consulta SQL
	TCQUERY cQuery ALIAS &(cAlias) NEW

	/*o loop while � usado para percorrer os resultados da consulta
	o nome do fornecedor � adicionado � vari�vel cArmazena*/
	while &(cAlias)->(!EOF())
		cArmazena 	+= (&(cAlias)->(A2_NOME)) + CRLF + '______________' + CRLF + CRLF
		&(cAlias)->(DbSkip())
	end

	FwAlertInfo(cArmazena, 'Fornecedores do estado de S�o Paulo') //Imprime os fornecedores do estado de SP

	// o alias � fechado e a �rea atual � restaurada antes que a fun��o retorne
	&(cAlias)->(DbCloseArea())
	RestArea(aArea)
Return
