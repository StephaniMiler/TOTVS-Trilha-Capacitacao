#INCLUDE 'TOTVS.CH'

/* 7 - As maçãs custam R$ 1,30 cada se forem
compradas menos de uma dúzia, e R$ 1,00 se forem
compradas pelo menos 12. Escreva um programa
que leia o número de maçãs compradas, calcule e
escreva o custo total da compra. */

User Function CustoCompra()

  Local nMacas := 0
  Local nCustoTotal := 0
  Local nValorMaca := 0
  Local cInput := ''

  cInput := FwInputBox('Quantas maças você irá comprar?: ')
  nMacas := (VAL(cInput))

  if nMacas < 12
    nValorMaca := 1.30
  else
    nValorMaca := 1.00
  end

  nCustoTotal := nValorMaca * nMacas

  FwAlertInfo('O custo total da compra é: R$ ' + cValToChar(nCustoTotal))

Return


