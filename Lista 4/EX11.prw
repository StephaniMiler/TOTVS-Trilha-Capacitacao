#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

/*11 � Fa�a um programa em que o usu�rio possa
digitar um c�digo de produto e saber se esse
c�digo existe no sistema ou n�o. Caso exista,
apresente o C�digo, Descri��o e o Pre�o de Venda,
caso contr�rio, apresente uma mensagem
informando que n�o existe. */

USER FUNCTION L4E11()

  Local aArea  := GetArea() //armazena a �rea atual em que a fun��o est� sendo executada na vari�vel local aArea
  Local cAlias := GetNextAlias() // alias para a tabela que ser� consultada
  Local cQuery := ''
  Local cMsg   := ''
  Local nPed   := 0
  Local cTitle := 'Consulta Produto'
  Local oDlg   := NIL
  Local nOpcao := 0

  DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO 100, 600 PIXEL
  @ 014, 010 SAY 'Digite o c�digo do produto a ser pesquisado: ' SIZE 150, 07 OF oDlg PIXEL
  @ 014, 180 MSGET nPed SIZE 55, 11 OF oDlg PIXEL PICTURE '@E 99999999999'
  DEFINE SBUTTON FROM 011, 260 TYPE 1 ACTION (nOpcao := 1, oDlg:End()) ENABLE OF oDlg
  DEFINE SBUTTON FROM 025, 260 TYPE 2 ACTION (nOpcao := 2, oDlg:End()) ENABLE OF oDlg

  ACTIVATE MSDIALOG oDlg CENTERED
  
  if nOpcao == 1
    //define o ambiente em que a fun��o ser� executada
    rpcsetenv('99', '01')
    cQuery := "SELECT SB1.B1_COD, CONCAT(SC6.C6_NUM, ', ') AS NUMPED, AVG(SC6.C6_QTDVEN) AS MEDIA_QUANT" + CRLF
    cQuery += "FROM " + RetSqlName('SB1') + " AS SB1" + CRLF
    cQuery += "INNER JOIN SC6990 AS SC6 ON SB1.B1_COD = SC6.C6_PRODUTO" + CRLF
    cQuery += "WHERE SC6.C6_PRODUTO = '" + alltrim(nPed) + "'" + CRLF
    cQuery += "GROUP BY SB1.B1_COD, SC6.C6_QTDVEN, SC6.C6_NUM "+ CRLF

    TCQUERY cQuery ALIAS &(cAlias) NEW
    &(cAlias)->(DbGoTop())
    if ALLTRIM(&(cAlias)->(NUMPED)) == ''
      FwAlertInfo("n�o h� itens com este c�digo no sistema") 
      Return
    ENDIF

  else
    
    while &(cAlias)->(!EOF())
      cMsg := "O produto �: " + alltrim(&(cAlias)->(B1_COD))

      &(cAlias)->(DbSkip())

    END
        
        
  endif  

  FwAlertInfo(cMsg, 'Dados do Produto')
  &(cAlias)->(DbCloseArea())
  RestArea(aArea)

Return 
