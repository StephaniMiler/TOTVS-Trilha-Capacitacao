#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 14 – Faça uma função que que leia um array de 5
números inteiros e mostre-os numa string. */

User function NumerosStr()
  Local aInteiros := {}
  Local nNumeros  := 0
  Local cInteiro  := ""
  Local nContador := 0

    While nContador < 5
      nNumeros := Val(FwInputBox("Insira um número:"))
      Aadd(aInteiros, nNumeros)
      cInteiro += AllTrim(Str(nNumeros)) + ","
    nContador++
    EndDo

    FwAlertInfo(cInteiro , 'Números inteiros:')

Return
