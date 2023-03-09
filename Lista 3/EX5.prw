#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 5 – Faça um SELECT na tabela SB1 que retorne todos os produtos cadastrados e apresente os
códigos e descrições de todos em uma mensagem. Mas atenção, os itens devem ser apresentados em
ordem de descrição decrescente (Z-A) */

User Function PRODUTOS()
    Local cDescricao   := ''
    LOCAL cCodigo   := ''
    Local cMsg   := ''
    Local nContador  := 1

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'
    rpcsetenv("99", "01")

    BEGINSQL Alias "SB1"
        SELECT 
            B1_COD,
            B1_DESC
        FROM %table:sb1% SB1
        where D_E_L_E_T_ <>'*'
        order by b1_Desc desc 
    ENDSQL

  while SB1->(!EOF())
    cCodigo := SB1->B1_COD
    cDescricao := SB1->B1_DESC
    cMsg += 'Código: ' + cCodigo + CRLF + 'Nome: ' + cDescricao + CRLF 
    cMsg += '------------------------------' + CRLF + CRLF

    If nContador == 10
      FwAlertInfo(cMsg, 'Dados dos Clientes')
      nContador := 0
      cMsg  := ''
    endif

    SB1->(DBSKIP())
  END

  IF nContador > 0
    FwAlertInfo(cMsg, 'Dados dos Clientes')
  endif
 SB1->(DBCLOSEAREA())

Return
