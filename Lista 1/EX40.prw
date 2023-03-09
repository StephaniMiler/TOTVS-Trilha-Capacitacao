#INCLUDE 'TOTVS.CH'

/* 40 - Faça um programa para o cálculo de uma folha
de pagamento, sabendo que os descontos são do
imposto de Renda, que depende do salário bruto
(conforme tabela abaixo) e 10% para o INSS. Além
disso, existe o FGTS que corresponde a 11% do
salário bruto, mas não é descontado (é a empresa
que deposita).

Desconto IR

Salário Bruto Desconto (%)
Até R$1200,00 (inclusive) Isento
Até R$ 1800,00 (inclusive) 5%
Até R$ 2500,00 (Inclusive) 10%
Acima de R$2500,00 20%
O salário líquido corresponde ao salário bruto
menos os descontos O programa deverá pedir ao
usuário o valor da sua hora e a quantidade de
horas trabalhadas no mês.

Imprima na tela as informações, dispostas
conforme o exemplo abaixo, no exemplo valor da
hora é 5 e a quantidade de horas é 220.
Salário bruto (5,5 * 220) : R$ 1210,00
( – ) IR (5%) : R$ 60,50
( – ) INSS ( 10% ) : R$ 121,00
FGTS ( 11%) : R$ 133,10
Total de descontos : R$ 181,50
Salário Líquido : R$ 1028,50 */


User Function FolhaDePagamento() 
    
    Local nSalarioBruto:= 0
    Local nIR:= 0
    Local nINSS:= 0
    Local nFGTS:= 0 
    Local nDescontos:= 0
    Local nSalarioLiquido:= 0
    Local nHora := 0 
    Local nQuantidadeHoras := 0
    Local cIR := ''

    nHora      := VAL(FWInputBox('Informe o valor pago por hora: '))
    nQuantidadeHoras  := VAL(FWInputBox('Informe a quantidade de horas trabalhadas: '))

    nSalarioBruto := nHora*nQuantidadeHoras  //*Calcular o salário bruto

    if nSalarioBruto > 1200 .and. nSalarioBruto <= 1800   //* Definir percentual da tabela acima
        nIR := 0.05 * nSalarioBruto //* Caso o desconto seja de 5%
    elseif nSalarioBruto > 1800 .and. nSalarioBruto <= 2500 
        nIR := 0.10 * nSalarioBruto //* Caso o desconto seja de 10%
        cIR := '10%'
    elseif nSalarioBruto > 2500 
        nIR := 0.20 * nSalarioBruto //* Caso o desconto seja de 20%
        cIR := '20%'
    else
        FwAlertInfo('O salário não possui desconto de IR!')
        nIR := 1 * nSalarioBruto
    endif

    nINSS := 0.10 * nSalarioBruto //* Desconto do INSS   
             
    nFGTS := 0.11 * nSalarioBruto //* Desconto do FGTS   

    nDescontos := nIR + nINSS //* Descontos totais

    nSalarioLiquido := nSalarioBruto - nDescontos //* Valor do salário líquido

    FwAlertInfo('Salário bruto (' + ALLTRIM(STR(nHora)) + '*' + ALLTRIM(STR(nQuantidadeHoras)) + ')_______: R$ ' + ALLTRIM(StrZero(nSalarioBruto,7,2))+CRLF+;
                '( – ) IR ('+ALLTRIM(cIR)+')_______________: R$ '+ALLTRIM(StrZero(nIR,5,2))+CRLF+;
                '( – ) INSS (10%)____________: R$ '+ALLTRIM(StrZero(nINSS,6,2))+CRLF+;
                'FGTS (11%)_______________: R$ '+ALLTRIM(StrZero(nFGTS,6,2))+CRLF+;
                'Total de descontos__________: R$ '+ALLTRIM(StrZero(nDescontos,6,2))+CRLF+;
                'Salário Líquido_____________: R$ '+ALLTRIM(StrZero(nSalarioLiquido,7,2)))


Return

