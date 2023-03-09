#INCLUDE 'TOTVS.CH'

/* 5 – Elaborar um programa que efetue a
apresentação do valor da conversão em real (R$)
de um valor lido em dólar (US$). O programa
deverá solicitar o valor da cotação do dólar e,
também, a quantidade de dólares disponível com o
usuário. */

User Function Lista2_5()

    Local nReal            := 0 //Declaração das variáveis
    Local nDolarHoje       := 0
    Local nQuantidadeDolar := 0


    nDolarHoje       := VAL(FWInputBox('Informe o valor da cotação do dólar hoje: ')) //Recebendo os valores
    nQuantidadeDolar := VAL(FWInputBox('Informe a quantidade de dinheiro em dólares: '))

    nReal := nDolarHoje * nQuantidadeDolar //Cálculo da quantidade de dinheiro em reais

    //Imprimindo o resultado
    FwAlertInfo('A quantidade de dinheiro em reais é: R$ ' + cValToChar(nReal), 'Valor em R$:')


Return
