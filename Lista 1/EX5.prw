#INCLUDE 'TOTVS.CH'

/* 5 - O custo de um carro novo ao consumidor é a
soma do custo de fábrica com a porcentagem do
distribuidor e dos impostos (aplicados ao custo de
fábrica). Supondo que o percentual do distribuidor
seja de 28% e os impostos de 45%, escrever um
algoritmo para ler o custo de fábrica de um carro,
calcular e escrever o custo final ao consumidor. */

User Function CustoFinal()

    Local nCusFabricacao := 0
    Local nCustoFinal    := 0
    
    nCusFabricacao := FwInputBox('Digite o custo de fábrica do carro: ') // Solicita o custo de fábrica do carro

    nCustoFinal := VAL(nCusFabricacao) + VAL(nCusFabricacao) * 0.28 + VAL(nCusFabricacao) * 0.45 // Cálculo do custo final

    FwAlertInfo('O custo final do carro é: R$' + ALLTRIM(STR(nCustoFinal)), 'Custo final')
  
Return 
