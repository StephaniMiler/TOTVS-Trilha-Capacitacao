#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/* 15 - Desenvolva um programa que receba a
temperatura m�dia de cada m�s do ano e
armazene-as em um array. Ap�s isso, calcule a
m�dia de temperatura anual e mostre todas as
temperaturas acima da m�dia anual e em que m�s
ocorreram exemplo:
M�dia Anual: 28 Graus
Fevereiro: 29 Graus
Novembro: 31 Graus */

USER FUNCTION TemperaturaMedia()

    //Declarando as vari�veis
    Local aTemperatura  := {}
    Local aMes          := {"Janeiro", "Fevereiro", "Mar�o", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"}
    Local nContador     := 0
    Local nMedia        := 0
    Local cMsg          := ''
    Local nValor        := 0

    //Para os meses de janeiro a dezembro
    For nContador := 1 to 12 
        nValor := Val(FwInputBox('Digite a temperatura do mes ' + aMes[nContador] +': ')) //Solicita ao usu�rio a temperatura do m�s
        aadd(aTemperatura, nValor)
    NEXT
    for nContador := 1 to 12
        nMedia += aTemperatura[nContador]
        cMsg += aMes[nContador] + ": " + alltrim(str(aTemperatura[nContador])) + CRLF
    NEXT

    cMsg += "m�dia: " + Alltrim(str(nMedia/12))
    fwAlertInfo(cMsg)

RETURN
