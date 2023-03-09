#INCLUDE 'TOTVS.CH'

/* 37 - Uma loja tem tem uma política de descontos de
acordo com o valor da compra do cliente. Os
descontos começam a partir dos R$500. A cada 100
reais acima dos R$500,00 o cliente ganha 1% de
desconto cumulativo até 25%.
o Por exemplo: R$500 = 1%
o R$600,00 = 2%
o R$700,00 = 3%
o ... 
Faça um programa que exiba essa tabela de
descontos no seguinte formato:
Valor da compra – porcentagem de desconto – valor final */

User Function Desconto() 
 
  Local nValorCompra := 0
  Local nValorFinal  := 0
  Local nDesconto    := 0

  nValorCompra := VAL(FWInputBox('Insira o valor da compra: ')) //Solicita o valor da compra

  if nValorCompra >= 500 .and. nValorCompra < 600
    nDesconto := 1
    nValorFinal := nValorCompra*(1-(nDesconto/100))        // Quando der 1% de desconto

  elseif nValorCompra >= 500 .and. nValorCompra < 2900 // Quando o desconto for de 2% até 24%
    nDesconto:= ((nValorCompra-500) / 100) + 1             
    nDesconto:=INT(nDesconto)                                    
    nValorFinal := nValorCompra * (1-(nDesconto/100))

  elseif nValorCompra >= 2900                           // Descontos de 25%
    nDesconto := 25
    nValorFinal := nValorCompra * (1-(nDesconto/100))

  else
    FwAlertInfo('Valores a baixo de R$ 500 não tem descontos.')
    Break                                                // Encerrar o programa caso não tiver descontos
  endif

  FwAlertInfo('O valor total da compra de R$' + ALLTRIM(Str(nValorCompra,7,2)) + CRLF +;
              'O desconto é de '+ ALLTRIM(Str(nDesconto,5,2)) + '%' + CRLF +;
              'O valor final da compra é de R$' + ALLTRIM(Str(nValorFinal,7,2)))

Return


