#INCLUDE 'TOTVS.CH'

/* 4 - Escreva um algoritmo para ler o salário mensal
atual de um funcionário e o percentual de
reajuste. Calcular e escrever o valor do novo
salário. */

User Function NovoSalario()

    Local nSalarioAtual := 0
    Local nReajuste     := 0
    Local nNovoSalario  := 0

    nSalarioAtual := FwInputBox('Informe o salário mensal do funcionário: ') //Pede ao usuário o salário atual do funcionário
    nReajuste := FwInputBox('Informe o percentual de reajuste: ') //Pede o percentual de reajuste

    nNovoSalario := VAL(nSalarioAtual) + (VAL(nSalarioAtual) *  (VAL(nReajuste) / 100)) //Cálculo do salário com reajuste

    FwAlertInfo('O valor do novo salário é: ' + ValToChar(nNovoSalario))


Return 
