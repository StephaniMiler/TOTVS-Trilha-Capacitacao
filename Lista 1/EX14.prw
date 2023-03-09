#INCLUDE 'TOTVS.CH'

/* 14 - Escreva um algoritmo para ler 2 valores e se o
segundo valor informado for ZERO, deve ser lido
um novo valor, ou seja, para o segundo valor não
pode ser aceito o valor zero. Imprimir o resultado
da divisão do primeiro valor lido pelo segundo
valor lido. 15 - Acrescentar uma mensagem de 'VALOR
INVÁLIDO' no exercício anterior caso o segundo
valor informado seja ZERO.*/

User Function Resultado()

  Local nNumero1   := 0
  Local nNumero2   := 0
  Local nResultado := 0

  nNumero1 := FwInputBox('Informe o primeiro numero: ')

  While .T.
    nNumero2 := FwInputBox('Informe o segundo valor: ')
  If VAL(nNumero2) <> 0
    Exit
  EndIf
    FwAlertInfo('VALOR INVÁLIDO ! O segundo valor não pode ser zero. Por favor, informe um novo valor.')
  enddo

  nResultado := VAL(nNumero1) / VAL(nNumero2)
  FwAlertInfo('O resultado da divisão é: ' + cValToChar(nResultado))

Return
