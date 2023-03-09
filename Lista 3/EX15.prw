#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 15 - Desenvolva um programa que receba a
temperatura média de cada mês do ano e
armazene-as em um array. Após isso, calcule a
média de temperatura anual e mostre todas as
temperaturas acima da média anual e em que mês
ocorreram exemplo:
Média Anual: 28 Graus
Fevereiro: 29 Graus
Novembro: 31 Graus */

USER FUNCTION TemperaturaMedia()

    //Declarando as variáveis
    Local aTemperatura  := {}
    Local aMes          := {"Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"}
    Local nContador     := 0
    Local nMedia        := 0
    Local cMsg          := ''
    Local nValor        := 0

    //Para os meses de janeiro a dezembro
    For nContador := 1 to 12 
        nValor := Val(FwInputBox('Digite a temperatura do mes ' + aMes[nContador] +': ')) //Solicita ao usuário a temperatura do mês
        aadd(aTemperatura, nValor)
    NEXT
    for nContador := 1 to 12
        nMedia += aTemperatura[nContador]
        cMsg += aMes[nContador] + ": " + alltrim(str(aTemperatura[nContador])) + CRLF
    NEXT

    cMsg += "média: " + Alltrim(str(nMedia/12))
    fwAlertInfo(cMsg)

RETURN
