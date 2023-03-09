#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 11 – Crie uma função que retorne todos os
fornecedores situados em São Paulo (SP). */

User Function FornSP()

	Local aArea     := GetArea() //armazena a área atual em que a função está sendo executada na variável local aArea
    Local cAlias    := GetNextAlias() // alias para a tabela que será consultada
	Local cArmazena := ''
    Local cQuery    := ''

    //define o ambiente em que a função será executada 
	PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SA2' MODULO 'COM'

    /*a variável cQuery é definida como uma consulta SQL para selecionar os nomes dos fornecedores da tabela SA2 
	que estejam no estado de SP e que não tenham sido marcados para exclusão. */
    cQuery := "SELECT A2_NOME " + "FROM " + RetSqlName('SA2') + " SA2" + CRLF + " WHERE A2_EST = 'SP' AND D_E_L_E_T_ = ' '"

	// executa a consulta SQL
	TCQUERY cQuery ALIAS &(cAlias) NEW

	/*o loop while é usado para percorrer os resultados da consulta
	o nome do fornecedor é adicionado à variável cArmazena*/
	while &(cAlias)->(!EOF())
		cArmazena 	+= (&(cAlias)->(A2_NOME)) + CRLF + '______________' + CRLF + CRLF
		&(cAlias)->(DbSkip())
	end

	FwAlertInfo(cArmazena, 'Fornecedores do estado de São Paulo') //Imprime os fornecedores do estado de SP

	// o alias é fechado e a área atual é restaurada antes que a função retorne
	&(cAlias)->(DbCloseArea())
	RestArea(aArea)
Return
