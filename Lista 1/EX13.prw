#INCLUDE 'TOTVS.CH'

/* 13 - Faça um algoritmo para ler: a descrição do
produto (nome), a quantidade adquirida e o preço
unitário.
Calcular e escrever o total (total = quantidade
adquirida * preço unitário), o desconto e o total
a pagar (total a pagar = total - desconto),
sabendo-se que:
o Se quantidade <= 5 o desconto será de 2%
o Se quantidade > 5 e quantidade <= 10 o
desconto será de 3%
o Se quantidade > 10 o desconto será de 5% */


User Function PrecoTotaL()

  Local cProduto    := ''
  Local nQuantidade := 0
  Local nPreco      := 0
  Local nDesconto   := 0 
  Local nTotal      := 0

  cProduto    := FwInputBox('Insira o nome do produto: ') // Recebendo os valores
  nQuantidade := VAL(FwInputBox('Insira a quantidade do produto: ')) 
  nPreco      := VAL(FwInputBox('Insira o preço do produto: ')) 


    if nQuantidade <= 5
        nDesconto := 0.98 // quando o desconto for de 2%
    elseif nQuantidade > 5 .and. nQuantidade <= 10
        nDesconto := 0.97 //quando o desconto for de 3%
    else
        nDesconto := 0.95 //quando o desconto for de 5%
    endif

  nTotal := nQuantidade  * nPreco * nDesconto

  FwAlertInfo('O valor total do produto ' + cProduto + ' é: R$' + ALLTRIM(STR(nTotal)), 'Valor total do produto')

Return
