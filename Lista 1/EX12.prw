#INCLUDE 'TOTVS.CH'

/* 12 - Ler o nome de 2 times e o número de gols
marcados na partida (para cada time). Escrever o
nome do vencedor. Caso não haja vencedor
deverá ser impressa a palavra EMPATE. */

User Function TimeVencedor()

   Local cTime1 := ''
   Local cTime2 := ''
   Local nGolsTime1 := 0
   Local nGolsTime2 := 0


   cTime1 := FwInputBox('Escreva o nome do primeiro time: ') //Solicita o nome do time e a quantidade de gols
   nGolsTime1 := FwInputBox('Escreva a quantidade de gols do primeiro time: ')
   cTime2 := FwInputBox('Escreva o nome do segundo time: ')
   nGolsTime2 := FwInputBox('Escreva a quantidade de gols do segundo time: ')

   If VAL(nGolsTime1) > VAL(nGolsTime2) //Verifica qual dos times ganhou ou se deu empate
      FwAlertInfo('Time vencedor: ' + cTime1)
      ElseIf nGolsTime2 > nGolsTime1
      FwAlertInfo('Time vencedor: ' + cTime2)
   Else
      FwAlertInfo('DEU EMPATE')
   EndIf

RETURN
