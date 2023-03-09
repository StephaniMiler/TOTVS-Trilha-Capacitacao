#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 13 � Desenvolva uma fun��o que leia um n�mero e
exiba o dia da semana correspondente, por
exemplo:
1 � Domingo
2 � Segunda...
� necess�rio avisar o usu�rio caso ele digite um
valor � inv�lido. Obs: Utilize Array */


User Function DiaSemana()

  Local cDia    := ""
  Local nNumero := 0
  Local aSemana := {"Domingo", "Segunda", "Ter�a", "Quarta", "Quinta", "Sexta", "S�bado"}

    while nNumero <= 0 .or. nNumero > 7

        nNumero := Val(FwInputBox("Informe um n�mero de 1 a 7: "))

        If nNumero < 1 .or. nNumero > 7
            MsgAlert("N�mero inv�lido!")
        EndIf
       End

    cDia := cValtoChar(aSemana[nNumero])

      FwAlertInfo("O dia da semana correspondente ao n�mero informado �: " + cDia )
Return
