#INCLUDE 'TOTVS.CH'

/* 8 - A jornada de trabalho semanal de um
funcionário é de 40 horas. O funcionário que
trabalhar mais de 40 horas receberá hora extra,
cujo cálculo é o valor da hora regular com um
acréscimo de 50%.
Escreva um algoritmo que leia o número de horas
trabalhadas em um mês, o salário por hora e
escreva o salário total do funcionário, que deverá
ser acrescido das horas extras, caso tenham sido
trabalhadas (considere que o mês possua 4
semanas exatas). */

USER FUNCTION SalarioTotal()

   Local nHorasTrabalhadas := 0
   Local nSalarioHora := 0 
   Local nSalarioTotal := 0 
   Local nHorasExtras := 0


   nHorasTrabalhadas := FwInputBox("Informe a quantidade de horas trabalhadas no mês: ") //Recebe a quantidade de horas trabalhadas
   nSalarioHora := FwInputBox("Informe o valor da hora trabalhada: ") //Recebe o valor pago por hora

   nSalarioTotal := VAL(nHorasTrabalhadas) * VAL(nSalarioHora) //Calcula o valor do salário


   If VAL(nHorasTrabalhadas) > 40 //Verifica se houve horas extras
      nHorasExtras := VAL(nHorasTrabalhadas) - 40
      nSalarioHoraExtra := VAL(nSalarioHora) * 1.5
      nSalarioTotal := nSalarioTotal + (nHorasExtras * nSalarioHoraExtra) //Calcula o valor do salário + horas extras
   EndIf


   FwAlertInfo("Salário Total", "R$ "+ cValToChar(nSalarioTotal))

RETURN
