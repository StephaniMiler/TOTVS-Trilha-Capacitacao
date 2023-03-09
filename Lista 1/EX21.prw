#INCLUDE 'TOTVS.CH'

/* 21 - Ler um valor N e imprimir todos os valores
inteiros entre 1 (inclusive) e N (inclusive).
Considere que o N será sempre maior que ZERO. */

User Function Valores()

  Local nContador := 0
  Local nNumero   := 0
  Local cArmazena := ''

  nNumero := VAL(FwInputBox('Insira um número: ')) 

  while nNumero < 1 // Validação para que o número seja maior que 1
    FwAlertInfo('O número deve ser maior que 1')
    nNumero := VAL(FwInputBox('Insira um número: '))
  end

  for nContador := 1 to nNumero // Armazenando os valores de 1 até nNum (Valor inserido)
    cArmazena += cValtoChar(nContador) + CRLF
  next
  
  FwAlertInfo(cArmazena, 'Resultado')
  
Return
