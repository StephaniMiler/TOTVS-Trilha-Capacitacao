#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 4 – Faça um SELECT na tabela SB1 que retorne todos os produtos que pertencem ao grupo
“Películas”. Apresente a descrição desses produtos através da função FwAlertInfo() */

User Function Peliculas()
    Local cDescricao := ''
    LOCAL cGrupo     := ''
    Local cMsg       := ''
    Local nContador  := 1


    rpcsetenv("99", "01")

    BEGINSQL Alias "SB1"
        SELECT 
            B1_DESC, //os campos "B1_DESC" e "B1_GRUPO" que serão selecionados pela consulta
            B1_GRUPO
        FROM %table:sb1% SB1
        where D_E_L_E_T_ <>'*'
    ENDSQL



    while SB1->(!EOF()) //Enquanto o arquivo não chegar no fim
        cDescricao  := SB1->B1_DESC
        cGrupo := SB1->B1_GRUPO

        IF cGrupo == 'G002' //se pertencer ao grupo das películas
            cMsg += 'produto ' +Alltrim(str(nContador))+' : ' + cDescricao + CRLF //imprime o modelo da película
            cMsg += '------------------------------' + CRLF + CRLF
            nContador++
        ENDIF

        if nContador == 10
        FwAlertInfo(cMsg, 'Películas')
        nContador := 0
        cMsg  := ''
        endif

        SB1->(DBSKIP())
    end

    if nContador > 0
        FwAlertInfo(cMsg, 'Películas')
    endif

    SB1->(DBCLOSEAREA()) //fecha a área de trabalho
Return
