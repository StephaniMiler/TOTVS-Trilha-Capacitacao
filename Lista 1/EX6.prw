#INCLUDE 'TOTVS.CH'

/* 6 -Escreva um algoritmo para ler uma temperatura
em graus Fahrenheit, calcular e escrever o valor
correspondente em graus Celsius.
Observação: Para testar se a sua resposta está
correta saiba que 100 graus Celsius = 212 graus
Fahrenheit. */

User Function GrausCelcius()

    Local nGrausF := 0
    Local nGrausC := 0

    nGrausF := VAL(FwInputBox('Informe a temperatura em Fahrenheit: ')) //Recebe o valor da temperatura em °F
    nGrausC := (nGrausF - 32) * 5/9 //Converte °F para °C

    FwAlertInfo('A temperatura em Graus Celsius é: ' + cValToChar(nGrausC))

Return 
