#INCLUDE 'TOTVS.CH'

/*1 � Fazer um programa que dados um n�mero de 1
at� 7, apresente o nome do dia da semana
correspondente. Considere 1 como �Domingo�.*/

User Function L5E1()
  
  Local aDias   := {'Domingo' , 'Segunda' , 'Ter�a' , 'Quarta' , 'Quinta' , 'Sexta' , 'S�bado'}
  Local nNumero := 0

  nNumero := FwInputBox('Digite um n�mero de 1 a 7: ') //*Pede para o usu�rio inserir um n�mero
  nNumero := Val(nNumero)

  If nNumero < 0 .OR. nNumero > 7 //Caso o n�mero digitado seja inv�lido, emite um alerta e solicita novamente
    FwAlertInfo('O n�mero digitado � inv�lido!')
    nNumero := FwInputBox('Digite um n�mero de 1 a 7: ')
  Else
    FwAlertInfo('O dia da semana correspondente ao n�mero '+ CValToChar(nNumero) + ' �: ' + aDias[nNumero] , 'Dias da Semana') //Imprime o dia correspondente
  Endif
    
Return
