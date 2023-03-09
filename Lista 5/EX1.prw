#INCLUDE 'TOTVS.CH'

/*1 – Fazer um programa que dados um número de 1
até 7, apresente o nome do dia da semana
correspondente. Considere 1 como “Domingo”.*/

User Function L5E1()
  
  Local aDias   := {'Domingo' , 'Segunda' , 'Terça' , 'Quarta' , 'Quinta' , 'Sexta' , 'Sábado'}
  Local nNumero := 0

  nNumero := FwInputBox('Digite um número de 1 a 7: ') //*Pede para o usuário inserir um número
  nNumero := Val(nNumero)

  If nNumero < 0 .OR. nNumero > 7 //Caso o número digitado seja inválido, emite um alerta e solicita novamente
    FwAlertInfo('O número digitado é inválido!')
    nNumero := FwInputBox('Digite um número de 1 a 7: ')
  Else
    FwAlertInfo('O dia da semana correspondente ao número '+ CValToChar(nNumero) + ' é: ' + aDias[nNumero] , 'Dias da Semana') //Imprime o dia correspondente
  Endif
    
Return
