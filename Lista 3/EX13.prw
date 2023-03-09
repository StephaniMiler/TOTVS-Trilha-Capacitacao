#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 13 – Desenvolva uma função que leia um número e
exiba o dia da semana correspondente, por
exemplo:
1 – Domingo
2 – Segunda...
É necessário avisar o usuário caso ele digite um
valor é inválido. Obs: Utilize Array */


User Function DiaSemana()

  Local cDia    := ""
  Local nNumero := 0
  Local aSemana := {"Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado"}

    while nNumero <= 0 .or. nNumero > 7

        nNumero := Val(FwInputBox("Informe um número de 1 a 7: "))

        If nNumero < 1 .or. nNumero > 7
            MsgAlert("Número inválido!")
        EndIf
       End

    cDia := cValtoChar(aSemana[nNumero])

      FwAlertInfo("O dia da semana correspondente ao número informado é: " + cDia )
Return
