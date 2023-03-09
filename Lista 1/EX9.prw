#INCLUDE 'TOTVS.CH'

/* 9 - Ler um valor e escrever se é positivo, negativo
ou zero */

User Function Valor()
   Local nValor := 0
   
   nValor := VAL(FwInputBox("Digite um número: ")) //Coleta um valor

   If nValor > 0
      FwAlertInfo('O número digitado é positivo') //Se o número for positivo
   ElseIf nValor < 0
      FwAlertInfo('O número digitado é negativo') //Se o número for negativo
   Else
      FwAlertInfo('O número digitado é igual a 0') //Se o número for zero
   EndIf

Return
