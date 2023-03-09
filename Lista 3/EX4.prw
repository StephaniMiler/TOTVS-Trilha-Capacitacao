#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 4 � Fa�a um SELECT na tabela SB1 que retorne todos os produtos que pertencem ao grupo
�Pel�culas�. Apresente a descri��o desses produtos atrav�s da fun��o FwAlertInfo() */

User Function Peliculas()
    Local cDescricao := ''
    LOCAL cGrupo     := ''
    Local cMsg       := ''
    Local nContador  := 1


    rpcsetenv("99", "01")

    BEGINSQL Alias "SB1"
        SELECT 
            B1_DESC, //os campos "B1_DESC" e "B1_GRUPO" que ser�o selecionados pela consulta
            B1_GRUPO
        FROM %table:sb1% SB1
        where D_E_L_E_T_ <>'*'
    ENDSQL



    while SB1->(!EOF()) //Enquanto o arquivo n�o chegar no fim
        cDescricao  := SB1->B1_DESC
        cGrupo := SB1->B1_GRUPO

        IF cGrupo == 'G002' //se pertencer ao grupo das pel�culas
            cMsg += 'produto ' +Alltrim(str(nContador))+' : ' + cDescricao + CRLF //imprime o modelo da pel�cula
            cMsg += '------------------------------' + CRLF + CRLF
            nContador++
        ENDIF

        if nContador == 10
        FwAlertInfo(cMsg, 'Pel�culas')
        nContador := 0
        cMsg  := ''
        endif

        SB1->(DBSKIP())
    end

    if nContador > 0
        FwAlertInfo(cMsg, 'Pel�culas')
    endif

    SB1->(DBCLOSEAREA()) //fecha a �rea de trabalho
Return
