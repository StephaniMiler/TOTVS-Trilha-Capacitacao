#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 14 � Fa�a uma fun��o que que leia um array de 5
n�meros inteiros e mostre-os numa string. */

User function NumerosStr()
  Local aInteiros := {}
  Local nNumeros  := 0
  Local cInteiro  := ""
  Local nContador := 0

    While nContador < 5
      nNumeros := Val(FwInputBox("Insira um n�mero:"))
      Aadd(aInteiros, nNumeros)
      cInteiro += AllTrim(Str(nNumeros)) + ","
    nContador++
    EndDo

    FwAlertInfo(cInteiro , 'N�meros inteiros:')

Return
