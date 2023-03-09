#INCLUDE 'PROTHEUS.CH'

/*10 ñ FaÁa um programa para o c·lculo de uma folha
de pagamento, sabendo que os descontos s„o do
imposto de Renda, que depende do sal·rio bruto
(conforme tabela abaixo) e 10% para o INSS. AlÈm
disso, existe o FGTS que corresponde a 11% do
sal·rio bruto, mas n„o È descontado (È a empresa
que deposita).*/

User Function Lista4_10() 
    
    Local nSalarioBruto:= 0
    Local nIR:= 0
    Local nINSS:= 0
    Local nFGTS:= 0 
    Local nDescontos:= 0
    Local nSalarioLiquido:= 0
    Local nHora := 0 
    Local nQuantidadeHoras := 0
    Local cIR := ''
    Local cTitle := 'Folha de pagamento'
    Local oDlg   := NIL
    Local nOpcao := 0


    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO 100, 600 PIXEL
    @ 014, 010 SAY 'Informe o valor pago por hora: ' SIZE 100, 07 OF oDlg PIXEL
    @ 023, 010 SAY 'Informe a quantidade de horas trabalhadas: ' SIZE 100, 07 OF oDlg PIXEL
    @ 014, 180 MSGET nHora SIZE 55, 11 OF oDlg PIXEL PICTURE '@E 999.99'
    @ 023, 180 MSGET nQuantidadeHoras SIZE 55, 11 OF oDlg PIXEL PICTURE '@E 99999'
    DEFINE SBUTTON FROM 011, 260 TYPE 1 ACTION (nOpcao := 1, oDlg:End()) ENABLE OF oDlg
    DEFINE SBUTTON FROM 025, 260 TYPE 2 ACTION (nOpcao := 2, oDlg:End()) ENABLE OF oDlg

    ACTIVATE MSDIALOG oDlg CENTERED

    if nOpcao == 1 .AND. nHora > 0 .AND. nQuantidadeHoras > 0
        nSalarioBruto := nHora*nQuantidadeHoras  //*Calcular o sal√°rio bruto
            if nSalarioBruto > 1200 .and. nSalarioBruto <= 1800   //* Definir percentual da tabela acima
                nIR := 0.05 * nSalarioBruto //* Caso o desconto seja de 5%
            elseif nSalarioBruto > 1800 .and. nSalarioBruto <= 2500 
                nIR := 0.10 * nSalarioBruto //* Caso o desconto seja de 10%
                cIR := '10%'
            elseif nSalarioBruto > 2500 
                nIR := 0.20 * nSalarioBruto //* Caso o desconto seja de 20%
                cIR := '20%'
            else
                FwAlertInfo('O sal·rio n„o possui desconto de IR!')
                nIR := 1 * nSalarioBruto
            endif    
    else
        FwAlertError('Cancelado pelo usu√°rio ou o valor inserido È inv·lido!', 'Cancelado!')
    endif

    nINSS := 0.10 * nSalarioBruto //* Desconto do INSS   
             
    nFGTS := 0.11 * nSalarioBruto //* Desconto do FGTS   

    nDescontos := nIR + nINSS //* Descontos totais

    nSalarioLiquido := nSalarioBruto - nDescontos //* Valor do sal√°rio l√≠quido

    FwAlertInfo('Sal·rio bruto (' + ALLTRIM(STR(nHora)) + '*' + ALLTRIM(STR(nQuantidadeHoras)) + ')_______: R$ ' + ALLTRIM(StrZero(nSalarioBruto,7,2)) + CRLF + ;
                '( - ) IR (' + ALLTRIM(cIR) + ')_______________: R$ ' + ALLTRIM(StrZero(nIR,7,2)) + CRLF + ;
                '( - ) INSS (10%)____________: R$ ' + ALLTRIM(StrZero(nINSS,7,2)) + CRLF + ;
                'FGTS (11%)_______________: R$ ' + ALLTRIM(StrZero(nFGTS,7,2)) + CRLF + ;
                'Total de descontos__________: R$ ' + ALLTRIM(StrZero(nDescontos,7,2)) + CRLF + ;
                'Sal·rio LÌ≠quido_____________: R$ ' + ALLTRIM(StrZero(nSalarioLiquido,7,2)))



Return
