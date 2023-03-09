#INCLUDE 'TOTVS.CH'

/* 34 - Faça um programa que receba a idade e o peso
de sete pessoas. Calcule e mostre:
o A quantidade de pessoas com mais de 90
quilos
o A média das idades das sete pessoas */

User function IdadePeso()
	
    Local nContador := 0
    Local nIdade := 0
    Local nPeso := 0
    Local nMaior90 := 0
    Local nSomaIdades := 0
    Local nMedia := 0

	
	// Loop para receber os dados de cada pessoa
	for nContador := 1 to 7
		
		nIdade := VAL(FwInputBox('Informe a idade: '))
		nPeso := VAL(FwInputBox('Informe o peso: '))

		
		// Calcula a quantidade de pessoas com mais de 90 kg
		if  nPeso > 90
		    nMaior90++
		Endif
		// Acumula a idade para calcular a média posteriormente
		nSomaIdades += nIdade
	next

	// Calcula a média das idades
	nMedia := nSomaIdades / 7

	// Exibe os resultados
	FwAlertInfo('Quantidade de pessoas com mais de 90 kg: ' + cValToChar(nMaior90) + CRLF + 'Media das idades: ' + cValToChar(nMedia))
	
Return





