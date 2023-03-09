#INCLUDE 'TOTVS.CH'

/* 3 - Faça um algoritmo que leia a idade de uma
pessoa expressa em anos, meses e dias e escreva
a idade dessa pessoa expressa apenas em dias
Considerar ano com 365 dias e mês com 30 dias */

User Function IdadeDias()
    
  Local nAnos      := 0
  Local nMeses     := 0
  Local nDias      := 0
  Local nIdadeDias := 0

  nAnos  := FwInputBox('Informe a sua idade em anos: ')  //*Pede informações do nascimento do usuário
  nMeses := FwInputBox('Informe a quantidade de meses da sua idade: ') 
  nDias  := FwInputBox('Informe a quantidade de dias da sua idade: ') 

  nIdadeDias := VAL(nAnos)*365 + VAL(nMeses)*30 + VAL(nDias) //*Calculo da quantidade de dias do usuário
  
  FwAlertInfo('A sua idade em dias é: ' + ALLTRIM(STR(nIdadeDias)), 'Idade em dias')

Return


