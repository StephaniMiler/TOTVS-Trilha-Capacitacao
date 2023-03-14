#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'
 
/* 16 – Crie uma rotina que retorne todos os
clientes situados em um estado/uf selecionado
pelo usuário.*/

User Function BuscaUF()

    Local cTitle  := 'BUSCA CLIENTE' 
    Local cTexto  := 'Digite o UF do Estado: '
    Local cEstado := Space(2)
    Local nOpcao  := 0
    Local oDlg    := NIL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 100, 450 PIXEL   
    @ 014, 010 SAY    cTexto     SIZE 120, 12 OF oDlg PIXEL
    @ 010, 090 MSGET  cEstado    SIZE 55, 11 OF oDlg PIXEL
    @ 010, 160 BUTTON 'Buscar'   SIZE 55, 11 OF oDlg PIXEL ACTION EstadoUF(cEstado)
    @ 035, 160 BUTTON 'Cancelar' SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 1, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return

Static Function EstadoUF(cEstado)

	Local aArea := GetArea(), cAlias := GetNextAlias()
	Local cMsg := '', cQuery := ''

    rpcsetenv('99', '01')

    cQuery := "SELECT A2_NOME " + "FROM " + RetSqlName('SA2') + " SA2" + " WHERE A2_EST =  '" + cEstado + "' AND D_E_L_E_T_ = ' '"

	TCQUERY cQuery ALIAS &(cAlias) NEW

	while &(cAlias)->(!EOF())
		cMsg 	+= (&(cAlias)->(A2_NOME)) + CRLF + '______________' + CRLF + CRLF
		&(cAlias)->(DbSkip())
	end

	FwAlertInfo(cMsg, 'CLIENTE')

	&(cAlias)->(DbCloseArea())
	RestArea(aArea)
    
Return
