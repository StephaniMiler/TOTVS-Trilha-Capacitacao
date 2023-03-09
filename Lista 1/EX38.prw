#INCLUDE 'TOTVS.CH'

/* 38 - Faça um programa que receba a idade de dez
pessoas e que calcule e mostre a quantidade de
pessoas com idade maior ou igual a 18 anos. */

User function Idade18()
	
    Local nContador := 0
    Local nIdade := 0
    Local nIdade18 := 0
    	
	// Loop para receber as idades de cada pessoa
	for nContador := 1 to 10
		
		nIdade := VAL(FwInputBox('Informe a idade da pessoa: '))
		
		
		// Calcula a quantidade de pessoas com 18 anos ou mais
		if  nIdade >= 18
		    nIdade18++
		Endif
		
	next


	// Exibe os resultados
	FwAlertInfo('Quantidade de pessoas com 18 anos ou mais: ' + cValToChar(nIdade18))
	
Return
