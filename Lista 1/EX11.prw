#INCLUDE 'TOTVS.CH'

/* 11 - Ler 3 valores, cada um representando as
medidas dos lados de um triângulo e escrever se
formam ou não um triângulo. OBS: para formar um
triângulo, o valor de cada lado deve ser menor que
a soma dos outros 2 lados. */


User Function FormaTriangulo()

   Local nLado1 := 0
   Local nLado2 := 0
   Local nLado3 := 0

  nLado1 := VAL(FwInputBox('Digite o primeiro valor: ')) // Recebendo os valores dos lados
  nLado2 := VAL(FwInputBox('Digite o segundo valor: ')) 
  nLado3 := VAL(FwInputBox('Digite o terceiro valor: '))

  if (nLado1 + nLado2 > nLado3) .and. (nLado1 + nLado3 > nLado2) .and. (nLado2 + nLado3 > nLado1) // Se as condições forem atendidas forma um triângulo
    FwAlertSuccess('Os lados formam um triângulo!', 'Forma triângulo')

  else
    FWAlertError('Os lados NÃO formam um triângulo!', 'Forma triângulo') 
  endif

Return






